<?php
namespace App\Http\Controllers\Admin\ClassManagement;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Database\Eloquent\Collection;
use App\Http\Requests\AddProgramRequest;
use \Carbon\Carbon;
use App\Models\SchoolYear;
use App\Models\Classes;
use App\Models\User;
use App\Models\Role;
use App\Models\UserRole;
use App\Rules\Uppercase;

class ClassManageController extends Controller
{
	public function getClassList(Request $req){
        // Check user role
        $classes = Classes::all();
        return view('admin.classes.classes_list',compact('classes'));
    }

    public function getAddClass(Request $req){
        // Check user role
        $schoolYear = SchoolYear::where('type',2)->get();
        return response()->view('admin.classes.add-modal',compact('schoolYear'));
    }

    public function postAddClass(Request $re){
        // Check user role
        try{
            $class = new Classes;
            $class->class_id = $re->name;
            $class->class_name = $re->name;
            $class->school_year_id = $re->schoolYear;
            $class->save();
            $success = true;
            // return redirect()->back()->with('success','Thêm chi đoàn thành công');
            return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Thêm chi đoàn thành công"]);
        }catch(Exception $ex){
            return redirect()->back()->with('error','Thêm chi đoàn thất bại');
        }
    }

    public function getEditClass(Request $req){
        $class = Classes::with(['schoolYear'])->where('id',$req->id)->first();
        return response()->view('admin.classes.edit-modal', compact('class'));
    }

    public function postEditClass(Request $re){
        // Check user role
        try{
            $class = Classes::find($re->id);
            $class->class_name = $re->name;
            $class->save();
            // return redirect()->back()->with('success','Lưu thông tin khóa học thành công');
            return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Lưu chi đoàn thành công"]);
        }catch(Exception $ex){
            return redirect()->back()->with('error','Thêm khóa học thất bại');
        }
    }

    public function delete(Request $req){
        // Check user role
        // if (!isset(Auth::user()->id)) {
        //     return view('login'); //redirect to loginpage if no have session login
        // }
        // $ids = $req->ids;
        // $classes = Classes::whereIn('id',explode(",",$ids))->update(['deleted_at' => now()]);
        // return response()->json(['success'=>"Xóa chi đoàn thành công"]);
        foreach($req->id as $sid){
            $classes = Classes::find($sid);
            $classes->delete();
        }
        return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Xóa chi đoàn thành công!"]);
    }
}
