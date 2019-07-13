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
use App\Models\ActivityFund;
use App\Models\ActivityFundDetail;
use App\Models\SchoolYear;
use App\Models\Student;
use App\Models\Checkin;
use App\Models\CheckinDetail;
use DateTime;
use Carbon;
use StringUtil;
use DateTimeUtil;
use App\Models\Log;

class FundingController extends Controller
{
  public function getListFunding(Request $req){
    // Check user role
    // delete session if exist
    session()->forget('_old_input');
    $this->data['activities'] = Activity::where('year','2018 - 2019')->get();
    $this->data['year'] = SchoolYear::where('type',1)->orderBy('name','desc')->get();
    $this->data['funds'] = ActivityFund::with(['activity','details' => function($q){
      $q->select('fund_id','content','expected_value','actual_value','unit','amount','unit_price','payment_type');
    }])->whereHas('activity', 
    function($a){
      $a->where('year','2018 - 2019');
    }
    )->get();
    // return $this->data['funds'];
    return view('admin.funding.list_activity_fund')->with($this->data);
  }
  
  /**
  * Get activity funding page
  * 
  * @param String $id The id of activity
  */
  public function getAddActivityFund(Request $req, $id){
    // Check user role
    $this->data['activity'] = Activity::with(['leadBy'])->where('id',$id)->first();
    
    $this->data['content_'] = old('content_', []);
    $this->data['unit_'] = old('unit_', []);
    $this->data['unitPrice_'] = old('unitPrice_', []);
    $this->data['amount_'] = old('amount_', []);
    $this->data['paymentType_'] = old('paymentType_', []);
    
    return view('admin.funding.add_activity_fund')->with($this->data);
  }
  
  /**
  * Add activity funding
  * 
  * @param Object $req The Request that user sent
  */
  public function postAddActivityFund(Request $req){
    // Check user role
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
  
  /**
  * Get edit activity funding page
  * 
  * @param String $id The id of activity
  */
  public function getEditActivityFund(Request $req, $id){
    // Check user role
    $this->data['activityFund'] = ActivityFundDetail::with(['fund.activity'])->where('fund_id',$id)->get();
    // Check if there is no activity fund
    if(count($this->data['activityFund']) == 0){
      return abort(404);
    }
    return view('admin.funding.edit_activity_fund')->with($this->data);
  }
  
  /**
  * Edit activity funding
  * 
  * @param String $id The id of activity
  * @param Object $req The request that user sent
  */
  public function postEditActivityFund($id, Request $req){
    return $req;
    // Check user role
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
      $totalexpected = 0;
      $totalactual = 0;
      // Save expected value into parent
      foreach ($req->expectedValue_ as $expected) {
        $totalexpected += intval(join(explode(",",$expected)));
      }
      // Save actual value into parent
      foreach ($req->actualValue_ as $actual) {
        $totalactual += intval(join(explode(",",$actual)));
      }
      $ac_fund->initial_funds = $totalexpected;
      $ac_fund->actual_funds = $totalactual;
      // Update payment status of parent
      if(isset($req->status)){
        $ac_fund->status = $req->status;
      } else {
        $ac_fund->status = 0;
      }
      
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
          $new_fund_detail->actual_value = intval(join(explode(",",$req->actualValue_[$i])));
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
          $old_fund_detail->actual_value = intval(join(explode(",",$req->actualValue_[$i])));;
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
    // Check user role
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
  
  public function deleteManyActivityFunding(Request $req){
    // Check user role
    foreach ($req->fund_id as $fundId) {
      $this->data['activityFundDetail'] = ActivityFundDetail::where('fund_id',$fundId)->get();
      foreach ($this->data['activityFundDetail'] as $detail) {
        $detail->updated_by = Auth::user()->id;
        $detail->delete();
      }
      $this->data['activityFund'] = ActivityFund::find($fundId);
      $this->data['activityFund']->updated_by = Auth::user()->id;
      $this->data['activityFund']->delete();
    }
    return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Xóa dự trù thành công!"]);
  }
  
  
  public function filterActivityFunding(Request $req){
    // Check user role
    $this->data['year'] = SchoolYear::where('type',1)->orderBy('name','desc')->get();
    $this->data['activities'] = Activity::where('year','2018 - 2019')->get();
    if(StringUtil::pureString($req->semester) == null && StringUtil::pureString($req->activity) == null){
      $this->data['funds'] = ActivityFund::with(['activity','details' => 
      function($q){
        $q->select('fund_id','content','expected_value','actual_value','unit','amount','unit_price','payment_type');
      }
      ])->whereHas('activity', 
      function($a) use($req){
        $a->where('year',trim($req->year));
      }
      )->get();
    } else if(StringUtil::pureString($req->semester) == null && StringUtil::pureString($req->activity) != null){
      $this->data['funds'] = ActivityFund::with(['activity','details' => 
      function($q){
        $q->select('fund_id','content','expected_value','actual_value','unit','amount','unit_price','payment_type');
      }
      ])->whereHas('activity', 
      function($a) use($req){
        $a->where('id',trim($req->activity));
      }
      )->get();
    } else if(StringUtil::pureString($req->semester) != null && StringUtil::pureString($req->activity) == null){
      $this->data['funds'] = ActivityFund::with(['activity','details' => 
      function($q){
        $q->select('fund_id','content','expected_value','actual_value','unit','amount','unit_price','payment_type');
      }
      ])->whereHas('activity', 
      function($a) use($req){
        $a->where('year',trim($req->year))->where('semester',$req->semester);
      }
      )->get();
    } else if(StringUtil::pureString($req->semester) != null && StringUtil::pureString($req->activity) != null){
      $this->data['funds'] = ActivityFund::with(['activity','details' => 
      function($q){
        $q->select('fund_id','content','expected_value','actual_value','unit','amount','unit_price','payment_type');
      }
      ])->whereHas('activity', 
      function($a) use($req){
        $a->where('year',trim($req->year))->where('semester',$req->semester)->where('id',$req->activity);
      }
      )->get();
    }
    $req->flash();
    return view('admin.funding.list_activity_fund')->with($this->data);
  }
  
  public function loadActivity(Request $req){
    if(StringUtil::pureString($req->semester) != null){
      $this->data['activities'] = Activity::where('year',$req->year)->where('semester',$req->semester)->get();
    } else {
      $this->data['activities'] = Activity::where('year',$req->year)->get();
    }
    
    return response()->json([$this->data['activities']]);
  }
}