<?php

namespace App\Http\Controllers\Admin\ActivityManagement;
use App\Http\Controllers\Controller;
use App\Http\Requests\AddNewActivityRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\ExecComm;
use App\AssociationEc;
use App\Collaborator;
use App\Activity;
use App\ActivityFund;
use App\ActivityFundDetail;
use App\SchoolYear;
use App\Student;
use DateTime;
use Carbon;
use StringUtil;
use App\Log;

class ActivityController extends Controller
{
  
  /**
  * Get Activity list
  * 
  */
  public function getListActivity(){
    $this->data['activities'] = Activity::with(['leadBy','fund'])->get();
    $this->data['year'] = SchoolYear::where('type',1)->get();
    return view('admin.activity.list_activity')->with($this->data);
  }
  
  /**
  * Filter activity
  * 
  * @param $req Request
  */
  public function filterActivity(Request $req){
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
    return view('admin.activity.list_activity')->with($this->data);
  }
  
  public function loadActivity(Request $req){
    if(StringUtil::pureString($req->semester) != null){
      $this->data['activities'] = Activity::where('year',$req->year)->where('semester',$req->semester)->get();
    } else {
      $this->data['activities'] = Activity::where('year',$req->year)->get();
    }
    
    return response()->json([$this->data['activities']]);
  }
  
  /**
  * Get add activity page
  * 
  */
  public function getAddActivity(){
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
  public function postAddActivity(AddNewActivityRequest $req){
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
      $activity->max_regis_num = $req->maxRegisNum;
      $activity->year = $req->year;
      $activity->semester = $req->semester;
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
    $this->data['activity'] = Activity::with(['leadBy'])->where('id',$idActivity)->first();
    $this->data['activityFundingDetail'] = ActivityFund::with(['details'])->where('activity_id',$idActivity)->get();
    // return response()->json($this->data);
    return response()->view('admin.activity.modal_detail', $this->data);
  }
  
  /**
  * Get edit activity page
  * 
  * @param $id Activity id
  */
  public function getEditActivity($id){
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
  public function postEditActivity(AddNewActivityRequest $req, $id){
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
      
      if($activity->max_regis_num != $req->maxRegisNum){
        // create log old data
        $oldData .= "Số lượng đăng ký tối đa: ".$activity->max_regis_num."<br>";
        $activity->max_regis_num = $req->maxRegisNum;
        // create log new data
        $newData .= "Số lượng đăng ký tối đa: ".$req->maxRegisNum."<br>";
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
      
      $activity->updated_by = Auth::user()->id;
      $activity->save();
      
      Log::AddToLog('Chỉnh sửa chương trình', $oldData, $newData);
      DB::commit();
      return redirect()->back()->with(config('constants.SUCCESS'),'Thêm chương trình thành công!');
    } catch (Exception $e) {
      DB::rollback();
      return redirect()->back()->with(config('constants.ERROR'),'Thêm chương trình thất bại!');
    }
  }
  
  /**
  * Delete activities handle
  * 
  * @param $req
  */
  public function deleteActivity(Request $req){
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
  * Get add activity funding page
  * 
  */
  public function getAddActivityFund($id){
    $this->data['activity'] = Activity::with(['leadBy'])->where('id',$id)->first();
    
    $this->data['content_'] = old('content_', []);
    $this->data['unit_'] = old('unit_', []);
    $this->data['unitPrice_'] = old('unitPrice_', []);
    $this->data['amount_'] = old('amount_', []);
    $this->data['paymentType_'] = old('paymentType_', []);
    
    return view('admin.funding.add_activity_fund')->with($this->data);
  }
  
  public function postAddActivityFund(Request $req){
    // return back()->withInput()->withErrors(['message' => 'chos kiet']);
    DB::beginTransaction();
    try {
      $ac_fund = new ActivityFund;
      $ac_fund->activity_id = $req->id;
      $total = 0;
      foreach ($req->expectedValue_ as $expected) {
        $total += intval(join(explode(",",$expected)));
      }
      $ac_fund->initial_funds = $total;
      $ac_fund->actual_funds = 0;
      $ac_fund->created_by = Auth::user()->id;
      $ac_fund->save();
      
      for($i = 0;$i< count($req->content_);$i++){
        $fund_detail = new ActivityFundDetail;
        $fund_detail->fund_id = $ac_fund->id;
        // save content
        $fund_detail->content = $req->content_[$i];
        // save unit
        $fund_detail->unit = $req->unit_[$i];
        // save unit_price
        $fund_detail->unit_price = intval(join(explode(",",$req->unitPrice_[$i])));
        // save amount
        $fund_detail->amount = $req->amount_[$i];
        // save payment_type
        $fund_detail->payment_type = $req->paymentType_[$i];
        // save expected_value
        $fund_detail->expected_value = intval(join(explode(",",$req->expectedValue_[$i])));
        // save actual
        $fund_detail->actual_value = 0;
        // save created_by
        $fund_detail->created_by = Auth::user()->id;
        $fund_detail->save();
      }
      DB::commit();
      return redirect()->back()->with(config('constants.SUCCESS'),'Thêm dự trù thành công');
    } catch (Exception $ex) {
      DB::rollback();
      return redirect()->back()->with(config('constants.ERROR'),'Thêm dự trù thất bại!');
    }
  }
  
  public function getEditActivityFund($id){
    $this->data['activityFund'] = ActivityFundDetail::with(['fund.activity'])->where('fund_id',$id)->get();
    // Check if there is no activity fund
    if(count($this->data['activityFund']) == 0){
      return abort(404);
    }
    return view('admin.funding.edit_activity_fund')->with($this->data);
  }
  
  public function postEditActivityFund($id, Request $req){
    // return count($req->detail_id_);
    $this->data['activityDetail'] = ActivityFundDetail::where('fund_id',$id)->get();
    $arrayDetaiIdFund = [];
    // Get all funding id detail
    foreach ($this->data['activityDetail'] as $detail) {
      array_push($arrayDetaiIdFund, $detail->id);
    }
    
    try {
      // Delete funding detail if it is not exist
      foreach ($arrayDetaiIdFund as $detailid) {
        if(!in_array(intval($detailid), $req->detail_id_)){
          $deleteDetail = ActivityFundDetail::find($detailid);
          $deleteDetail->forceDelete();
        }
      }
      $ac_fund = ActivityFund::find($id);
      $total = 0;
      foreach ($req->expectedValue_ as $expected) {
        $total += intval(join(explode(",",$expected)));
      }
      $ac_fund->initial_funds = $total;
      $ac_fund->actual_funds = 0;
      $ac_fund->created_by = Auth::user()->id;
      $ac_fund->save();
      // Update old funding detail
      for($i = 0; $i < count($req->detail_id_); $i++){
        if($req->detail_id_[$i] == 0){
          $new_fund_detail = new ActivityFundDetail;
          $new_fund_detail->fund_id = $ac_fund->id;
          // save content
          $new_fund_detail->content = $req->content_[$i];
          // save unit
          $new_fund_detail->unit = $req->unit_[$i];
          // save unit_price
          $new_fund_detail->unit_price = intval(join(explode(",",$req->unitPrice_[$i])));
          // save amount
          $new_fund_detail->amount = $req->amount_[$i];
          // save payment_type
          $new_fund_detail->payment_type = $req->paymentType_[$i];
          // save expected_value
          $new_fund_detail->expected_value = intval(join(explode(",",$req->expectedValue_[$i])));
          // save actual
          $new_fund_detail->actual_value = 0;
          // save created_by
          $new_fund_detail->created_by = Auth::user()->id;
          $new_fund_detail->save();
        } else {
          $old_fund_detail = ActivityFundDetail::find($req->detail_id_[$i]);
          $old_fund_detail->fund_id = $ac_fund->id;
          // save content
          $old_fund_detail->content = $req->content_[$i];
          // save unit
          $old_fund_detail->unit = $req->unit_[$i];
          // save unit_price
          $old_fund_detail->unit_price = intval(join(explode(",",$req->unitPrice_[$i])));
          // save amount
          $old_fund_detail->amount = $req->amount_[$i];
          // save payment_type
          $old_fund_detail->payment_type = $req->paymentType_[$i];
          // save expected_value
          $old_fund_detail->expected_value = intval(join(explode(",",$req->expectedValue_[$i])));
          // save actual
          $old_fund_detail->actual_value = 0;
          // save created_by
          $old_fund_detail->created_by = Auth::user()->id;
          $old_fund_detail->save();
        }
      }
      DB::commit();
      return redirect()->back()->with(config('constants.SUCCESS'),'Cập nhật dự trù thành công');
    } catch (Exception $ex) {
      DB::rollback();
      return redirect()->back()->with(config('constants.ERROR'),'Cập nhật trù thất bại!');
    }
  }

  public function deleteActivityFunding(Request $req){
    $fundId = $req->activityFundId;
    $this->data['activityFundDetail'] = ActivityFundDetail::where('fund_id',$fundId)->get();
    foreach ($this->data['activityFundDetail'] as $detail) {
      $detail->updated_by = Auth::user()->id;
      $detail->delete();
    }
    $this->data['activityFund'] = ActivityFund::find($fundId);
    $this->data['activityFund']->updated_by = Auth::user()->id;
    $this->data['activityFund']->delete();
    
    return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Xóa dự trù thành công!"]);
  }

  public function getCheckin(){
    $now = Carbon::now();
    $this->data['activities'] = Activity::where('end_date','>=',$now)->get();
    $this->data['year'] = SchoolYear::where('type',1)->orderBy('name','desc')->first();
    $this->data['students'] = Student::select('student_id','name')->get();
    return view('admin.activity.check_in')->with($this->data);
  }
}
