<?php

namespace App\Http\Controllers\Admin\TrashManagement;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Activity;
use App\ActivityFund;
use App\ActivityFundDetail;
use App\Student;
use App\News;
class TrashController extends Controller
{
    /**
     * Get Trash bin
     * 
     */
    public function getTrashBin(){
        $this->data['activities'] = Activity::onlyTrashed()->get();
        return view('admin.trash.trash_list')->with($this->data);
    }

    /**
     * Change Trash type
     * 
     * @param $req Request
     */
    public function changeTrashType(Request $req){
        $action = $req->action;
        if($req->action === config('constants.TRASH_ACTIVITIES')){

            $this->data['activities'] = Activity::onlyTrashed()->get();
            $this->data['type'] = config('constants.TRASH_ACTIVITIES');
            return response()->view('admin.trash.data_table_trash', $this->data);

        } else if ($req->action === config('constants.TRASH_STUDENTS')){

            $this->data['studentList'] = Student::onlyTrashed()->get();
            $this->data['type'] = config('constants.TRASH_STUDENTS');
            return response()->view('admin.trash.data_table_trash', $this->data);
            
        } else if ($req->action === config('constants.TRASH_NEWS')){
            $this->data['newList'] = News::onlyTrashed()->get();
            $this->data['type'] = config('constants.TRASH_NEWS');
            return response()->view('admin.trash.data_table_trash', $this->data);
        }
    }

    /**
     * Restore deleted trash
     * 
     * @param $req Req
     */
    public function restoreTrash(Request $req){
        if($req->action === config('constants.TRASH_ACTIVITIES')){
            foreach($req->ids as $id){
                // restore activity first
                $activity = Activity::onlyTrashed()->where('id',$id);
                $activity->restore();
                // restore related activity fund
                $acFundDetail = ActivityFund::onlyTrashed()->with(['details_with_trashed'])->where('activity_id',$id)->orderBy('id','desc')->first();
                $acFundDetail->restore();
                // restore related activity fund detail
                foreach ($acFundDetail->details_with_trashed as $detail) {
                    $detail->restore();
                }
            }
            return response()->json(["status"=>config('constants.SUCCESS'),"message"=> count($req->ids)." chương trình được khôi phục."]);
        } elseif($req->action === config('constants.TRASH_STUDENTS')){
            foreach($req->ids as $id){
                $student = Student::onlyTrashed()->where('student_id',$id);
                $student->restore();
            }
            return response()->json(["status"=>config('constants.SUCCESS'),"message"=> count($req->ids)." sinh viên được khôi phục."]);
        }
    }
}
