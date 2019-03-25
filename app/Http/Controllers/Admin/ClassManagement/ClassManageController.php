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
            return redirect()->back()->with('success','Thêm khóa học thành công');
        }catch(Exception $ex){
            return redirect()->back()->with('error','Thêm khóa học thất bại');
        }
    }
    public function getEditProgram($id){
        $schoolYear = SchoolYear::find($id);
        $year= $schoolYear->name;
        $arr = array();
        $arr=explode(' - ', $year);
        $yearStart = $arr[0];
        $yearEnd = $arr[1]; 
        return view('admin.academic.edit',compact('schoolYear','yearStart', 'yearEnd'));
    }
    public function postEditProgram($id, Request $re){
        try{
            $schoolYear = SchoolYear::find($id);
            $schoolYear->course = $re->course;
            // $newstype->updated_by = Auth::user()->id;
            $schoolYear->save();
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
        $schoolYear = SchoolYear::whereIn('id',explode(",",$ids))->update(['deleted_at' => now()]);
        return response()->json(['success'=>"Xóa khóa học thành công"]);
    }
}
