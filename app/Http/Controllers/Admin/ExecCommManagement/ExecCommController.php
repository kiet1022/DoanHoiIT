<?php
namespace App\Http\Controllers\Admin\ExecCommManagement;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Database\Eloquent\Collection;
use App\ExecComm;
class ExecCommController extends Controller
{
    /**
     * Get Youth Union Executive Board list
     * 
     */
	public function getExecCommList(Request $req){
        //dd($req);
        if($req->type == "1"){
            $execComm = ExecComm::where('type',1)->get();
        }else{
            $execComm = ExecComm::where('type',0)->get();
        }
        return view('admin.execComm.exec_comm_list',compact('execComm'));
    }
}
