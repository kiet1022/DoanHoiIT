<?php

namespace App\Http\Controllers\Admin\MarksManagement;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\AddMarksRequest;
use App\Exports\MarksExport;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Activity;
use App\Models\SchoolYear;
use App\Models\Checkin;
use App\Models\CheckinDetail;
use App\Models\Student;
use StringUtil;
class MarksController extends Controller
{
  public function getMarksList(Request $req){
    // Check user role
    session()->forget('_old_input');
    $this->data['activities'] = Activity::with(['checkins'])->get();
    $this->data['year'] = SchoolYear::where('type',1)->get();
    $this->data['checkinlist'] = Checkin::with(['ofActivity','details'=>function($q){
      $q->with(['ofStudent'=>function($s){
        $s->select('student_id','name');
      }])->select('id','checkin_id','student_id');
    }])->get();
    // return $this->data;
    return view('admin.ac_marks.marks_list')->with($this->data);
  }
  
  public function getMarksDetail(Request $req){
    $detail = CheckinDetail::where('checkin_id',$req->checkinId)->select('student_id')->get();
    return response()->json($detail);
  }
  
  public function getAddNewMarks(Request $req){
    // Check user role
    $this->data['activities'] = Activity::where('year','2018 - 2019')->get();
    $this->data['year'] = SchoolYear::where('type',1)->orderBy('name','desc')->first();
    $this->data['students'] = Student::all();
    return view('admin.ac_marks.add_marks')->with($this->data);
  }
  
  public function postAddNewMarks(Request $re, AddMarksRequest $req){
    // Check user role
    if(is_null($req->data)){
      return redirect()->back()->with(config('constants.ERROR'),'Danh sách điểm danh rỗng!');
    }        
    try {
      DB::beginTransaction();
      $checkin = new Checkin;
      $checkin->content = $req->content;
      $checkin->year = $req->year;
      $checkin->type = $req->type;
      $checkin->marks = $req->marks;
      $checkin->created_by = Auth::user()->id;
      if (!is_null($req->activity)){
        $checkin->activity_id = $req->activity;
      }
      $checkin->save();
      
      $arrStudentId = explode(",",$req->data);
      foreach ($arrStudentId as $studentid) {
        $detail = new CheckinDetail;
        $detail->checkin_id = $checkin->id;
        $detail->student_id = $studentid;
        $detail->save();
      }
      DB::commit();
      return redirect()->back()->with(config('constants.SUCCESS'),'Lưu danh sách thành công.');
    } catch (Exception $ex) {
      DB::rollback();
      return redirect()->back()->with(config('constants.ERROR'),'Lưu danh sách Thất bại.');
    }
    
  }
  
  public function postExport(Request $req, $checkin_id){
    // Check user role
    $checkin = Checkin::where('id',$checkin_id)->with(['ofActivity'])->first();
    $name = "";
    if(!is_null($checkin->ofActivity)){
      $name = $checkin->ofActivity->name;
    }
    $type = "DRL";
    if($checkin->type == 1){
      $type = "CTXH";
    }
    $export_name = $checkin->year.'_'.$checkin->content.'_'.$name.'_'.$checkin->marks.$type.'.xlsx';
    $details = CheckinDetail::with(['ofStudent'])->where('checkin_id',$checkin_id)->get();
    // return $details;
    return (new MarksExport($details))->download($export_name);
  }
  
  public function filterMarks(Request $req){
    // Check user role
    $this->data['activities'] = Activity::with(['checkins'])->get();
    $this->data['year'] = SchoolYear::where('type',1)->get();

    if (StringUtil::pureString($req->year) != null &&  StringUtil::pureString($req->semester) != null){
        
        $this->data['checkinlist'] = Checkin::with(['ofActivity','details'=>function($q){
            $q->with(['ofStudent'=>function($s){$s->select('student_id','name');}])->select('id','checkin_id','student_id');
        }])->whereHas('ofActivity',function($a) use ($req){$a->where('semester',$req->semester)->where('year',$req->year);})->get();
          
    } else if (StringUtil::pureString($req->year) != null &&  StringUtil::pureString($req->semester) == null){
      $this->data['checkinlist'] = Checkin::with(['ofActivity','details'=>function($q){
          $q->with(['ofStudent'=>function($s){$s->select('student_id','name');}])->select('id','checkin_id','student_id');
      }])->whereHas('ofActivity', function($a) use ($req){$a->where('year',$req->year);})->get();
    }
    $req->flash();
    return view('admin.ac_marks.marks_list')->with($this->data);
  }
}