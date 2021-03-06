<?php

namespace App\Http\Controllers\Admin\ActivityManagement;
use App\Http\Controllers\Controller;
use App\Http\Requests\AddNewActivityRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\ExecComm;
use App\Models\AssociationEc;
use App\Models\Collaborator;
use App\Models\Activity;
use App\Models\Attender;
use App\Models\ActivityFund;
use App\Models\ActivityFundDetail;
use App\Models\SchoolYear;
use App\Models\Student;
use App\Models\Checkin;
use App\Models\CheckinDetail;
use App\Models\WorkFlow;
use App\Models\WorkFlowDetail;
use App\Exports\MarksExport;
use DateTime;
use Carbon;
use StringUtil;
use DateTimeUtil;
use App\Models\Log;

class ActivityController extends Controller
{
  
  /**
  * Get Activity list
  * 
  */
  public function getListActivity(Request $req){
    // Check user role
    // delete session if exist
    session()->forget('_old_input');
    $this->data['activities'] = Activity::with(['leadBy','fund'])->where('year','2018 - 2019')->get();
    $this->data['year'] = SchoolYear::where('type',1)->orderBy('name','desc')->get();
    return view('admin.activity.list_activity')->with($this->data);
  }
  
  /**
  * Filter activity
  * 
  * @param $req Request
  */
  public function filterActivity(Request $req){
    // Check user role
    $this->data['year'] = SchoolYear::where('type',1)->get();
    if(StringUtil::pureString($req->year) == null && StringUtil::pureString($req->semester) == null){
      $this->data['activities'] = Activity::with(['leadBy'])->get();
    }else if (StringUtil::pureString($req->year) == null && StringUtil::pureString($req->semester) != null){
      $this->data['activities'] = Activity::with(['leadBy'])->where('semester',$req->semester)->get();
    } else if (StringUtil::pureString($req->year) != null && StringUtil::pureString($req->semester) == null){
      $this->data['activities'] = Activity::with(['leadBy'])->where('year',$req->year)->get();
    } else {
      $this->data['activities'] = Activity::with(['leadBy'])->where('year',$req->year)->where('semester',$req->semester)->get();
    }
    $req->flash();
    return view('admin.activity.list_activity')->with($this->data);
  }
  
  /**
  * Get activities attender list
  * 
  */
  public function getAttenderList(Request $req){
    
    // Check user role
    // delete session if exist
    session()->forget('_old_input');
    $this->data['activities'] = Activity::with(['attenders.ofStudent'])->where('year','2018 - 2019')->get();
    // return $this->data['activities'];
    $this->data['year'] = SchoolYear::where('type',1)->orderBy('name','desc')->get();
    return view('admin.activity.list_activity_attender')->with($this->data);
  }
  
  public function filterAttenderList(Request $req){
    
    $this->data['year'] = SchoolYear::where('type',1)->get();
    $this->data['activities'] = Activity::with(['attenders.ofStudent']);
    if(StringUtil::pureString($req->year) != null){
      $this->data['activities'] = $this->data['activities']->where('year',$req->year);
    } if (StringUtil::pureString($req->semester) != null) {
      $this->data['activities'] = $this->data['activities']->where('semester',$req->semester);
    } if (StringUtil::pureString($req->month) != null){
      $firstDay = (new Carbon('first day of '.$req->month.' 2019'))->format('Y-m-d');
      $lastDay = (new Carbon('last day of '.$req->month.' 2019'))->format('Y-m-d');
      $this->data['activities'] = $this->data['activities']->where('start_date','>=',$firstDay)->where('end_date','<=',$lastDay);
    }
    $this->data['activities'] = $this->data['activities']->get();
    $req->flash();
    return view('admin.activity.list_activity_attender')->with($this->data);
  }
  
  public function ExportAttenderList($activity_id){
    $details = Attender::with(['ofStudent','ofActivity'])->where('activity_id',$activity_id)->get();
    $export_name = "Danh sách đăng ký_".$details[0]->ofActivity->name.".xlsx";
    return (new MarksExport($details))->download($export_name);
  }
  /**
  * Get add activity page
  * 
  */
  public function getAddActivity(Request $req){
    // Check user role
    $ex = ExecComm::with(['ofStudent'])->get();
    $ass = AssociationEc::with(['ofStudent'])->get();
    $col = Collaborator::with(['ofStudent'])->get();
    $this->data['leader'] = [];
    foreach ($ex as $e) {
      array_push($this->data['leader'],array('student_id' => $e->student_id, 'name' => $e->ofStudent->name,'level'=>$e->level,'type'=>'0'));
    }
    foreach($ass as $a){
      array_push($this->data['leader'],array('student_id' => $a->student_id, 'name' => $a->ofStudent->name,'level'=>$e->level,'type'=>'1'));
    }
    foreach($col as $c){
      array_push($this->data['leader'],array('student_id' => $c->student_id, 'name' => $c->ofStudent->name,'level'=>5,'type'=>'1'));
    }
    
    $this->data['year'] = SchoolYear::where('type',1)->get();
    return view('admin.activity.add_activity')->with($this->data);
  }
  
  /**
  * Add new activity
  * 
  * @param $req AddNewActivityRequest
  */
  public function postAddActivity(Request $re, AddNewActivityRequest $req){
    // return $re;
    // Check user role
    try {
      DB::beginTransaction();
      $activity = new Activity;
      $activity->name = $req->name;
      $activity->leader = $req->leader;
      $activity->start_date = DateTimeUtil::convertToYmd($req->startDate);
      $activity->end_date = DateTimeUtil::convertToYmd($req->endDate);
      $activity->start_regis_date = DateTimeUtil::convertToYmd($req->startRegisDate);
      $activity->end_regis_date = DateTimeUtil::convertToYmd($req->endRegisDate);
      $activity->content = $req->activityContent;
      $activity->practise_marks = $req->practiseMark;
      $activity->social_marks = $req->socialMark;
      $activity->year = $req->year;
      $activity->semester = $req->semester;
      $activity->max_regis = $req->maxRegis;
      // upload plan file
      if($req->hasFile('planUrl')){
        //return dd($req->planUrl);
        $file = $req->file('planUrl');
        $duoi = $file->getClientOriginalExtension();
        $name = $file->getClientOriginalName();
        $plan = str_random(4)."_".$name;
        while (file_exists("assets/fileupload/activities/plans/".$plan)) {
          $plan = str_random(4)."_".$name;
        }
        $file->move("assets/fileupload/activities/plans",$plan);
        $activity->plan_url = $plan;
      }else{
        $activity->plan_url = "";
      }
      
      // upload fund file
      if($req->hasFile('fundUrl')){
        $file = $req->file('fundUrl');
        $duoi = $file->getClientOriginalExtension();
        $name = $file->getClientOriginalName();
        $fund = str_random(4)."_".$name;
        while (file_exists("assets/fileupload/activities/funds/".$fund)) {
          $fund = str_random(4)."_".$name;
        }
        $file->move("assets/fileupload/activities/funds",$fund);
        $activity->fund_url = $fund;
      }else{
        $activity->fund_url = "";
      }
      
      // upload image file
      if($re->hasFile('image')){
        $file = $re->file('image');
        $duoi = $file->getClientOriginalExtension();
        if($duoi != 'jpg' && $duoi != 'png' && $duoi != 'jpeg'){
          return redirect()->back()->with('error','Vui lòng chọn đúng định dạng hình');
        }
        $name = $file->getClientOriginalName();
        $image = str_random(4)."_".$name;
        while (file_exists("assets/fileupload/activities/images/".$image)) {
          $image = str_random(4)."_".$name;
        }
        $file->move("assets/fileupload/activities/images",$image);
        $activity->image = $image;
      } else {
        $activity->image = "";
      }
      
      $activity->created_by = Auth::user()->id;
      $activity->save();
      
      // Create Log
      $oldData = "";
      $newData = "Tên Chương trình: ".$req->name."<br>";
      $newData .= "Sinh viên đứng chính: ".$req->leader."<br>";
      $newData .= "Thời gian bắt đầu: ".$req->startDate."<br>";
      $newData .= "Thời gian kết thúc: ".$req->endDate."<br>";
      Log::AddToLog('Thêm chương trình', $oldData, $newData);
      DB::commit();
      return redirect()->back()->with(config('constants.SUCCESS'),'Thêm chương trình thành công!');
    } catch (Exception $e) {
      DB::rollback();
      return redirect()->back()->with(config('constants.ERROR'),'Thêm chương trình thất bại!');
    }
  }
  
  /**
  * Activity detail
  * 
  * @param $req Request
  */
  public function activityDetail(Request $req){
    $idActivity = $req->id;
    
    $this->data['percent'] = DB::table('workflows')->select(DB::raw('sum(progress) / count(*) as percent'))->where('activity_id', $idActivity)
    ->whereNull('deleted_at')->first();
    $this->data['activity'] = Activity::with(['leadBy','workflows'])->where('id',$idActivity)->first();
    $this->data['activityFundingDetail'] = ActivityFund::with(['details'])->where('activity_id',$idActivity)->get();
    // return response()->json($this->data);
    return response()->view('admin.activity.modal_detail', $this->data);
  }
  
  /**
  * Get edit activity page
  * 
  * @param $id Activity id
  */
  public function getEditActivity(Request $req, $id){
    // Check user role
    $ex = ExecComm::with(['ofStudent'])->get();
    $ass = AssociationEc::with(['ofStudent'])->get();
    $col = Collaborator::with(['ofStudent'])->get();
    $this->data['leader'] = [];
    foreach ($ex as $e) {
      array_push($this->data['leader'],array('student_id' => $e->student_id, 'name' => $e->ofStudent->name,'level'=>$e->level,'type'=>'0'));
    }
    foreach($ass as $a){
      array_push($this->data['leader'],array('student_id' => $a->student_id, 'name' => $a->ofStudent->name,'level'=>$e->level,'type'=>'1'));
    }
    foreach($col as $c){
      array_push($this->data['leader'],array('student_id' => $c->student_id, 'name' => $c->ofStudent->name,'level'=>5,'type'=>'1'));
    }
    $this->data['year'] = SchoolYear::where('type',1)->get();
    $this->data['activity'] = Activity::with(['leadBy'])->where('id',$id)->first();
    return view('admin.activity.edit_activity')->with($this->data);
  }
  
  /**
  * 
  */
  public function postEditActivity(Request $re ,AddNewActivityRequest $req, $id){
    // Check user role
    $activity = Activity::find($id);
    $oldData = "";
    $newData = "";
    try {
      DB::beginTransaction();
      
      if($req->name != $activity->name){
        // create log old data
        $oldData .= "Tên Chương trình: ".$activity->name."<br>";
        $activity->name = $req->name;
        // create log new data
        $newData .= "Tên Chương trình: ".$req->name."<br>";
      }
      
      if($activity->leader != $req->leader){
        // create log old data
        $oldData .= "Sinh viên đứng chính: ".$activity->leader."<br>";
        $activity->leader = $req->leader;
        // create log new data
        $newData .= "Sinh viên đứng chính: ".$req->leader."<br>";
      }
      
      if(DateTimeUtil::convertYmdTodmY($activity->start_date) != $req->startDate){
        // create log old data
        $oldData .= "Ngày bắt đầu: ".DateTimeUtil::convertYmdTodmY($activity->start_date)."<br>";
        $activity->start_date = DateTimeUtil::convertToYmd($req->startDate);
        // create log new data
        $newData .= "Ngày bắt đầu: ".$req->startDate."<br>";
      }
      
      if(DateTimeUtil::convertYmdTodmY($activity->end_date) != $req->endDate){
        // create log old data
        $oldData .= "Ngày kết thúc: ".DateTimeUtil::convertYmdTodmY($activity->end_date)."<br>";
        $activity->end_date = DateTimeUtil::convertToYmd($req->endDate);
        // create log new data
        $newData .= "Ngày kết thúc: ".$req->endDate."<br>";
      }
      
      if(DateTimeUtil::convertYmdTodmY($activity->start_regis_date) != $req->startRegisDate){
        // create log old data
        $oldData .= "Ngày bắt đầu đăng ký: ".DateTimeUtil::convertYmdTodmY($activity->start_regis_date)."<br>";
        $activity->start_regis_date = DateTimeUtil::convertToYmd($req->startRegisDate);
        // create log new data
        $newData .= "Ngày bắt đầu đăng ký: ".$req->startRegisDate."<br>";
      }
      
      if(DateTimeUtil::convertYmdTodmY($activity->end_regis_date) != $req->endRegisDate){
        // create log old data
        $oldData .= "Ngày kết thúc đăng ký: ".DateTimeUtil::convertYmdTodmY($activity->end_regis_date)."<br>";
        $activity->end_regis_date = DateTimeUtil::convertToYmd($req->endRegisDate);
        // create log new data
        $newData .= "Ngày kết thúc đăng ký: ".$req->endRegisDate."<br>";
      }
      
      if($activity->content != $req->activityContent){
        // create log old data
        $oldData .= "Nội dung: ".$activity->content."<br>";
        $activity->content = $req->activityContent;
        // create log new data
        $newData .= "Nội dung: ".$req->activityContent."<br>";
      }
      
      if($activity->practise_marks != $req->practiseMark){
        // create log old data
        $oldData .= "Điểm rèn luyện: ".$activity->practise_marks."<br>";
        $activity->practise_marks = $req->practiseMark;
        // create log new data
        $newData .= "Điểm rèn luyện: ".$req->practiseMark."<br>";
      }
      
      if($activity->social_marks != $req->socialMark){
        // create log old data
        $oldData .= "Điểm CTXH: ".$activity->social_marks."<br>";
        $activity->social_marks = $req->socialMark;
        // create log new data
        $newData .= "Điểm CTXH: ".$req->socialMark."<br>";
      }
      
      if($activity->year != $req->year){
        // create log old data
        $oldData .= "Năm học: ".$activity->year."<br>";
        $activity->year = $req->year;
        // create log new data
        $newData .= "Năm học: ".$req->year."<br>";
      }
      
      if($activity->semester != $req->semester){
        // create log old data
        $oldData .= "Học kỳ: ".$activity->semester."<br>";
        $activity->semester = $req->semester;
        // create log new data
        $newData .= "Học kỳ: ".$req->semester."<br>";
      }
      $activity->max_regis = $req->maxRegis;
      // upload plan file
      if($req->hasFile('planUrl')){
        //return dd($req->planUrl);
        $file = $req->file('planUrl');
        $duoi = $file->getClientOriginalExtension();
        $name = $file->getClientOriginalName();
        $plan = str_random(4)."_".$name;
        while (file_exists("assets/fileupload/activities/plans/".$plan)) {
          $plan = str_random(4)."_".$name;
        }
        $file->move("assets/fileupload/activities/plans",$plan);
        $activity->plan_url = $plan;
      }else{
        $activity->plan_url = "";
      }
      
      // upload fund file
      if($req->hasFile('fundUrl')){
        $file = $req->file('fundUrl');
        $duoi = $file->getClientOriginalExtension();
        $name = $file->getClientOriginalName();
        $fund = str_random(4)."_".$name;
        while (file_exists("assets/fileupload/activities/funds/".$fund)) {
          $fund = str_random(4)."_".$name;
        }
        $file->move("assets/fileupload/activities/funds",$fund);
        $activity->fund_url = $fund;
      }else{
        $activity->fund_url = "";
      }
      
      // upload image file
      if($re->hasFile('image')){
        $file = $re->file('image');
        $duoi = $file->getClientOriginalExtension();
        if($duoi != 'jpg' && $duoi != 'png' && $duoi != 'jpeg'){
          return redirect()->back()->with('error','Vui lòng chọn đúng định dạng hình');
        }
        $name = $file->getClientOriginalName();
        $image = str_random(4)."_".$name;
        while (file_exists("assets/fileupload/activities/images/".$image)) {
          $image = str_random(4)."_".$name;
        }
        $file->move("assets/fileupload/activities/images",$image);
        $activity->image = $image;
      } else {
        $activity->image = "";
      }
      
      $activity->updated_by = Auth::user()->id;
      $activity->save();
      
      // Log::AddToLog('Chỉnh sửa chương trình', $oldData, $newData);
      DB::commit();
      return redirect()->back()->with(config('constants.SUCCESS'),'Sửa thông tin chương trình thành công!');
    } catch (Exception $e) {
      DB::rollback();
      return redirect()->back()->with(config('constants.ERROR'),'Sửa thông tin chương trình thất bại!');
    }
  }
  
  /**
  * Delete activities handle
  * 
  * @param $req
  */
  public function deleteActivity(Request $req){
    // Check user role
    foreach($req->activity_id as $id){
      $activityFundDetail = ActivityFund::with(['details'])->where('activity_id',$id)->get();
      if(count($activityFundDetail) > 0){
        foreach ($activityFundDetail[0]->details as $detail) {
          $detail->delete();
        }
        $activityFundDetail[0]->delete();
      }
      $activity = Activity::find($id);
      $activity->delete();
    }
    return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Thành công!"]);
  }
  
  /**
  * Get check in page
  * 
  */
  public function getCheckin(Request $req){
    // Check user role
    $now = Carbon::now();
    $this->data['activities'] = Activity::where('end_date','>=',$now)->get();
    $this->data['year'] = SchoolYear::where('type',1)->orderBy('name','desc')->first();
    $this->data['students'] = Student::select('student_id','name')->get();
    return view('admin.activity.check_in')->with($this->data);
  }
  
  /**
  * Save checkin info
  * 
  * @param Object $req The request that user sent
  */
  public function saveCheckin(Request $req){
    // return response()->json($req);
    $activityid = $req->activityId;
    
    switch ($req->checkinType) {
      case '0':
      $student_id = $req->arr_attender;
      $content = "Điểm danh sinh viên tham gia chương trình";
      break;
      case '1':
      $student_id = $req->arr_organizers;
      $content = "Điểm danh ban tổ chức";
      break;
      default:
      $student_id = $req->arr_collaborator;
      $content = "Điểm danh cộng tác viên";
      break;
    }
    
    if(!isset($student_id)){
      return response()->json(["status"=>config('constants.ERROR'),"message"=>"Danh sách điểm danh rỗng!"]);
    }
    $activity = Activity::find($activityid);
    if($activity->practise_marks != 0){
      $type = 0;
      $marks = $activity->practise_marks;
    }
    
    if($activity->social_marks != 0){
      $type = 1;
      $marks = $activity->social_marks;
    } 
    try {
      DB::beginTransaction();
      $checkin = new Checkin;
      $checkin->activity_id = $activityid;
      $checkin->content = $content;
      $checkin->type = $type;
      $checkin->marks = $marks;
      $checkin->year = $req->year;
      $checkin->created_by = Auth::user()->id;
      $checkin->save();
      foreach ($student_id as $studentid) {
        $detail = new CheckinDetail;
        $detail->checkin_id = $checkin->id;
        $detail->student_id = $studentid;
        $detail->created_by = Auth::user()->id;
        $detail->save();
      }
      DB::commit();
      return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Lưu danh sách điểm danh thành công!","type"=>$req->checkinType]);
    } catch (Exception $ex) {
      DB::rollback();
      return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Lưu danh sách điểm danh thất bại!"]);
    }
  }
  
}
