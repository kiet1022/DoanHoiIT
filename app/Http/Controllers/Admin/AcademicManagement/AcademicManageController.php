<?php
namespace App\Http\Controllers\Admin\AcademicManagement;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Database\Eloquent\Collection;
use App\Http\Requests\AddProgramRequest;
use \Carbon\Carbon;
use App\SchoolYear;
use App\Student;
use App\User;
use App\Role;
use App\UserRole;
use App\Rules\Uppercase;

class AcademicManageController extends Controller
{
	public function getSchoolYearList(){
        $schoolYear = SchoolYear::where('deleted_at',null)->get();
        
        return view('admin.academic.academic_list',compact('schoolYear'));
    }

    public function getAddNew(){
        return view('admin.academic.add');
    }
    public function postAddNew(Request $re){
        try{
            $schoolYear = new SchoolYear;
            $start=$re->start;
            $end=$re->end;

            $schoolYear->name = $start." - ".$end;
            $schoolYear->course = $re->course;
            $schoolYear->type = ($re->type)/2;
            $schoolYear->save();
            return redirect()->back()->with('success','Thêm loại tin thành công');
        }catch(Exception $ex){
            return redirect()->back()->with('error','Thêm loại tin thất bại');
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
            return redirect()->back()->with('success','Lưu tin thành công');
        }catch(Exception $ex){
            return redirect()->back()->with('error','Thêm tin thất bại');
        }
    }
}
