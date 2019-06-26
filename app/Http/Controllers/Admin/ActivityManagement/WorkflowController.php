<?php
namespace App\Http\Controllers\Admin\ActivityManagement;
use App\Http\Controllers\Controller;
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
use App\Models\WorkFlow;
use App\Models\WorkFlowDetail;
use DateTime;
use Carbon;
use StringUtil;
use DateTimeUtil;
use App\Models\Log;

class WorkflowController extends Controller
{
  /**
  * Get add new workflow page
  * 
  */
  public function getAddAcWorkFlow(Request $req, $id = null){
    // Check user role
		$req->user()->authorizeRoles([config('constants.FULL_ROLES'), config('constants.ACTIVITY_MANAGE_ROLE')]);
    if($id != 'null'){
      $this->data['acid'] = $id;
    }
    $this->data['activities'] = Activity::where('year','2018 - 2019')->get();
    $this->data['year'] = SchoolYear::where('type',1)->orderBy('name','desc')->get();
    $this->data['students'] = Student::whereHas('execComm')->orWhereHas('association')->orWhereHas('collaborator')->get();
    return view('admin.workflow.add_workflow')->with($this->data);
  }
  
  /**
  * Add new workflow
  * 
  * @param Request $req The request that user sent
  */
  public function postAddAcWorkFlow(Request $req){
    // Check user role
		$req->user()->authorizeRoles([config('constants.FULL_ROLES'), config('constants.ACTIVITY_MANAGE_ROLE')]);
    try {
      DB::beginTransaction();
      for($i = 0; $i < count($req->leader_) ; $i++){
        $workflow = new WorkFlow;
        $workflow->activity_id = $req->activity;
        $workflow->student_id = $req->leader_[$i];
        $workflow->content = $req->workcontent_[$i];
        $workflow->deadline = DateTimeUtil::convertToYmd($req->deadline_[$i]);
        $workflow->created_by = Auth::user()->id;
        $workflow->progress = 0;
        $workflow->save();
      }
      DB::commit();
      return redirect()->back()->with(config('constants.SUCCESS'),'Thêm công việc thành công!');
    } catch (Exception $ex) {
      DB::rollback();
      return redirect()->back()->with(config('constants.ERROR'),'Thêm công việc thất bại!');
    }
  }
  
  /**
  * Get work flow list of an activity
  * 
  * @param Integer $id The id of activity
  * 
  */
  public function getListWorkFlow(Request $req, $id = null){
    // Check user role
		$req->user()->authorizeRoles([config('constants.FULL_ROLES'), config('constants.ACTIVITY_MANAGE_ROLE')]);
    $this->data['workflows'] = WorkFlow::with(['details','ofStudent','ofActivity'])->where('activity_id',$id)->get();
    // return $this->data['workflows'];
    return view('admin.workflow.workflow_list')->with($this->data);
  }
  
  /**
  * Get detail of activity workflow
  * 
  * @param Request $req The request that user sent
  * 
  */
  public function getWorkFlowDetail(Request $req){
    $this->data['workflowDetail'] = $req->content;
    // return $this->data['workflowDetail'];
    return response()->view('admin.workflow.modal_workflow_detail', $this->data);
  }
  
  /**
  * Edit workflow detail
  * 
  * @param Request $req the request that user sent
  * 
  */
  public function postEditWorkFlowDetail(Request $req){
    // Check user role
		$req->user()->authorizeRoles([config('constants.FULL_ROLES'), config('constants.ACTIVITY_MANAGE_ROLE')]);
    $wfdetail = WorkFlow::where('id',$req->id)->with(['details'])->first();
    $arrDetailId = [];
    foreach ($wfdetail->details as $detail) {
      array_push($arrDetailId, $detail->id);
    }
    
    try {
      DB::beginTransaction();
      $wfdetail->content = $req->contentDetail;
      $wfdetail->updated_by = Auth::user()->id;
      
      // Delete funding detail if it is not exist
      foreach ($arrDetailId as $detailid) {
        if(!in_array(intval($detailid), $req->workflowId_)){
          $deleteDetail = WorkFlowDetail::find($detailid);
          $deleteDetail->forceDelete();
        }
      }
      
      // update detail
      for($i = 0; $i < count($req->content_); $i++){
        if($req->workflowId_[$i] == 0){
          $newDetail = new WorkFlowDetail;
          $newDetail->workflow_id = $req->id;
          $newDetail->content = $req->content_[$i];
          $newDetail->progress = $req->progress_[$i];
          $newDetail->created_by = Auth::user()->id;
          $newDetail->save();
        } else {
          $oldDetail = WorkFlowDetail::find($req->workflowId_[$i]);
          $oldDetail->content = $req->content_[$i];
          $oldDetail->progress = $req->progress_[$i];
          $oldDetail->created_by = Auth::user()->id;
          $oldDetail->save();
          
        }
      }
      
      // update workflow progress after update of inser detail
      $percent = DB::table('workflow_details')->select(DB::raw('sum(progress) / count(*) as percent'))->where('workflow_id', $req->id)
      ->whereNull('deleted_at')->first();
      $wfdetail->progress = intval($percent->percent);
      $wfdetail->save();
      DB::commit();
      return redirect()->back()->with(config('constants.SUCCESS'),'Cập nhật công việc thành công');
    } catch (Excetion $ex) {
      DB::rollback();
      return redirect()->back()->with(config('constants.ERROR'),'Cập nhật công việc thất bại!');
    }
  }
  
  /**
  * Detlete workflow
  * 
  * @param Integer $id The id of workflow
  * 
  */
  public function deleteWorkFlow(Request $req, $id){
    // Check user role
		$req->user()->authorizeRoles([config('constants.FULL_ROLES'), config('constants.ACTIVITY_MANAGE_ROLE')]);
    $workflow = WorkFlow::with(['details'])->find($id);
    foreach ($workflow->details as $detail) {
      $detail->delete();
    }
    $workflow->delete();
    return redirect()->back()->with(config('constants.SUCCESS'),'Xóa công việc thành công');
  }

  /**
  * Get work flow list
  * 
  * @param Integer $id The id of activity
  * 
  */
  public function getWorkFlowList(Request $req){
    // Check user role
		$req->user()->authorizeRoles([config('constants.FULL_ROLES'), config('constants.ACTIVITY_MANAGE_ROLE')]);
    // delete session if exist
    session()->forget('_old_input');
    if($req->user()->hasRole(config('constants.FULL_ROLES'))){
      $this->data['activities'] = Activity::all();
    } else if ($req->user()->hasRole(config('constants.ACTIVITY_MANAGE_ROLE'))){
      $this->data['activities'] = Activity::where('leader',Auth::user()->student->student_id)->get();
    }
    return view('admin.workflow.list_workflow')->with($this->data);
  }

  /**
   * Filter workflow by id activity
   * 
   * @param Request $req The request that user sent
   * 
   */
  public function filterWorkFlow(Request $req){
    if($req->user()->hasRole(config('constants.FULL_ROLES'))){
      $this->data['activities'] = Activity::all();
    } else if ($req->user()->hasRole(config('constants.ACTIVITY_MANAGE_ROLE'))){
      $this->data['activities'] = Activity::where('leader',Auth::user()->student->student_id)->get();
    }
    $this->data['workflows'] = WorkFlow::with(['details','ofStudent','ofActivity'])->where('activity_id',$req->activity)->get();
    $req->flash();
    return view('admin.workflow.list_workflow')->with($this->data);
  }
}
