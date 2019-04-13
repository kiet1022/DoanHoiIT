<?php
namespace App\Http\Controllers\Admin\ExecCommManagement;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Database\Eloquent\Collection;
use App\ExecComm;
use App\AssociationEc;
use App\Collaborator;
use App\Student;
class ExecCommController extends Controller
{
    /**
    * Get Youth Union Executive Board list
    * 
    * @param Request $req Request from client
    */
    public function getExecCommList(Request $req){
        
        // check if client pass different commType
        if (!in_array($req->type, [
            config('constants.EXEC_COMM_TYPE'), 
            config('constants.ASSOCIA_EC_TYPE'), 
            config('constants.COLLABORATOR_TYPE'),
            config('constants.BLANK_SPACE')
            ])) {
                abort(404);
            }
            
            $this->data["commType"] = config('constants.EXEC_COMM_TYPE');
            if($req->type == config('constants.ASSOCIA_EC_TYPE')){
                $this->data["execComm"] = AssociationEc::with(['ofStudent'])->get();
                $this->data["commType"] = config('constants.ASSOCIA_EC_TYPE');
            }else if($req->type == config('constants.COLLABORATOR_TYPE')){
                $this->data["execComm"] = Collaborator::with(['ofStudent'])->get();
                $this->data["commType"] = config('constants.COLLABORATOR_TYPE');
            }else{
                $this->data["execComm"] = ExecComm::with(['ofStudent'])->get();
            }
            
            return view('admin.execComm.exec_comm_list')->with($this->data);
        }
        
        /**
        * Get Exec Comm Chart
        * 
        * @param Any $type Type of chart
        */
        public function getExecCommChart($type){
            
            $this->data["commType"] = "0";
            if($type == "1"){
                $this->data["execComm"] = ExecComm::with(['ofStudent'])->where('type',1)->orWhere('type',3)->get();
                $this->data["commType"] = $type;
            }else if($type == "2"){
                $this->data["execComm"] = ExecComm::with(['ofStudent'])->where('type',2)->get();
                $this->data["commType"] = $type;
            }else{
                $this->data["execComm"] = ExecComm::with(['ofStudent'])->where('type',0)->orWhere('type',3)->get();
            }
            
            return view('admin.execComm.exec_comm_chart')->with($this->data);
        }
        
        /**
        * Get Exec Comm Detail
        * 
        * @param Request $req Request from client
        */
        public function getExecCommDetail(Request $req){
            if($req->type === "0"){
                $this->data['execComm'] = ExecComm::with(['ofStudent'])->where('student_id',$req->id)->first();
            } else if ($req->type === "1") {
                $this->data['execComm'] = AssociationEc::with(['ofStudent'])->where('student_id',$req->id)->first();
            }
            $this->data['commType'] = $req->type;
            return response()->view('admin.execComm.exec_comm_edit_modal', $this->data);
        }
        
        /**
        * Check info
        * 
        * @param Request $req Request from client
        */
        public function checkInfo(Request $req){
            $this->data['execComm'] = Student::with(['class'])->where('student_id',$req->id)->first();
            return response()->json($this->data);
        }
        
        /**
        * Save info
        * 
        * @param Request $req Request from client
        */
        public function saveInfo(Request $req){
            // 0: BCH Doan, 1: BCH LCH
            $type = $req->type;
            // Truong hop edit BCH Doan
            if($type === "0"){
                // check if new student have exist in db
                $checkExecComm = ExecComm::where('student_id',$req->newId)->get();
                $execComm = ExecComm::where('student_id',$req->oldId)->first();
                if(count($checkExecComm) >= 1 && $checkExecComm[0]->level == $execComm->level){
                    return response()->json(["status"=>config('constants.ERROR'),"message"=>"Sinh viên này đã tồn tại!"]); 
                } else {
                    $execComm = ExecComm::where('student_id',$req->oldId)->first();
                    if($execComm->level === 3){ // Truong hop sinh vien nay la pho bi thu va LCH Truong
                        $associa = AssociationEc::where('level',1)->first();
                        $associa->student_id = $req->newId;
                        $associa->updated_by = Auth::user()->id;
                        $associa->save();
                    }
                    $execComm->student_id = $req->newId;
                    $execComm->updated_by = Auth::user()->id;
                    $execComm->save();
                }
            } else if($type === "1"){ 
                // check if new student have exist in db
                $checkAssocia = AssociationEc::where('student_id',$req->newId)->get();
                $associa = AssociationEc::where('student_id',$req->oldId)->first();
                if(count($checkAssocia) >= 1 && $checkAssocia[0]->level == $associa->level){
                    return response()->json(["status"=>config('constants.ERROR'),"message"=>"Sinh viên này đã tồn tại!"]); 
                }else{
                    // Truong hop edit BCH Hoi
                    if($associa->level === 1){ // Truong hop sinh vien nay la pho bi thu va LCH Truong
                        $execComm = ExecComm::where('level',3)->first();
                        $execComm->student_id = $req->newId;
                        $execComm->updated_by = Auth::user()->id;
                        $execComm->save();
                    }
                    $associa->student_id = $req->newId;
                    $associa->updated_by = Auth::user()->id;
                    $associa->save();
                }
            }
            return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Lưu thông tin thành công!"]);
        }
    }
    