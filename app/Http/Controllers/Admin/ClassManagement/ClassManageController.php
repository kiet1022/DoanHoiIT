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
use App\SchoolYear;
use App\Classes;
use App\User;
use App\Role;
use App\UserRole;
use App\Rules\Uppercase;

class ClassManageController extends Controller
{
	public function getClassList(){
        $classes = Classes::where('deleted_at',null)->get();
        
        return view('admin.classes.classes_list',compact('classes'));
    }

    public function getAddClass(){
        $schoolYear = SchoolYear::where('deleted_at',null)->get();
        return view('admin.classes.add',compact('schoolYear'));
    }
    public function postAddClass(Request $re){
        try{
            $class = new Classes;
            $class->class_id = $re->name;
            $class->class_name = $re->name;
            $class->school_year_id = $re->schoolYear;
            $class->save();
            return redirect()->back()->with('success','Thêm chi đoàn thành công');
        }catch(Exception $ex){
            return redirect()->back()->with('error','Thêm chi đoàn thất bại');
        }
    }
    public function getEditClass($id){
        $class = Classes::find($id);
        return view('admin.classes.edit',compact('class'));
    }
    public function postEditClass($id, Request $re){
        try{
            $class = Classes::find($id);
            $class->class_name = $re->name;
            $class->save();
            return redirect()->back()->with('success','Lưu thông tin khóa học thành công');
        }catch(Exception $ex){
            return redirect()->back()->with('error','Thêm khóa học thất bại');
        }
    }
    public function delete(Request $request){
        if (!isset(Auth::user()->id)) {
            return view('login'); //redirect to loginpage if no have session login
        }
        $ids = $request->ids;
        $classes = Classes::whereIn('id',explode(",",$ids))->update(['deleted_at' => now()]);
        return response()->json(['success'=>"Xóa chi đoàn thành công"]);
    }
}
