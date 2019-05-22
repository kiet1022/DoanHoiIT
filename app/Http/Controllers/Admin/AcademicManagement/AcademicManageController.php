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
use App\Log;

class AcademicManageController extends Controller
{
	public function getSchoolYearList(){
        $schoolYear = SchoolYear::where('deleted_at',null)->get();
        
        return view('admin.academic.academic_list',compact('schoolYear'));
    }

    public function getAddNew(){
        // return view('admin.academic.add');
        return response()->view('admin.academic.add-modal');
    }
    public function postAddNew(Request $re){
        $schoolYear = new SchoolYear;
        $start=$re->start;
        $end=$re->end;

        $schoolYear->name = $start." - ".$end;
        $schoolYear->course = $re->course;
        $schoolYear->type = ($re->type)/2;
        $schoolYear->created_by = Auth::user()->id;
        $schoolYear->save();
        $success = true;
        // Create Log
        $newData = "Name: ".$start." - ".$end."<br>
                    Course: ".$re->course."";
        Log::AddToLog('Thêm chương trình đào tạo', "",$newData);

        return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Thêm chương trình đào tạo thành công!"]);
    }
    public function getEditProgram(Request $req){
        $schoolYear = SchoolYear::find($req->id);
        $year= $schoolYear->name;
        $arr = array();
        $arr=explode(' - ', $year);
        $yearStart = $arr[0];
        $yearEnd = $arr[1]; 
        return response()->view('admin.academic.edit-modal',compact('schoolYear','yearStart', 'yearEnd'));

    }

    public function postEditProgram( Request $re){
        DB::beginTransaction();
        $schoolYear = SchoolYear::find($re->id);
            // Create Log
        $oldData ="Name: ".$schoolYear->name."<br>
                    Course: ".$schoolYear->course."";

        $schoolYear->course = $re->course;
        $schoolYear->updated_by = Auth::user()->id;
        $schoolYear->updated_at = time();
        $schoolYear->save();

        $newData = "Course: ".$re->course."";

        Log::AddToLog('Sửa chương trình đào tạo', $oldData, $newData);
        DB::commit();

        return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Lưu chương trình đào tạo thành công"]);

    }
    public function delete(Request $request){
        // if (!isset(Auth::user()->id)) {
        //     return view('login'); //redirect to loginpage if no have session login
        // }
        // $ids = $request->ids;
        // $schoolYear = SchoolYear::whereIn('id',explode(",",$ids))->update(['deleted_at' => now()]);
        // return response()->json(['success'=>"Xóa chương trình đào tạo thành công"]);
        $deleteType = "Xóa chương trình đào tạo: ";
        foreach($request->id as $sid){
            $schoolYear = SchoolYear::find($sid);
            $schoolYear->updated_by = Auth::user()->id;
            $schoolYear->updated_at = time();
            $schoolYear->save();
            $schoolYear->delete();
            // $news = News::where('type_id',$sid)->get();
            // foreach ($news as $new) {
            //     $new->updated_by = Auth::user()->id;
            //     $new->updated_at = time();
            //     $new->save();
            //     $new->delete();
            // }
            // Create Log
            $deleteType .= "".$sid.", ";
        }
        Log::AddToLog('Xóa chương trình đào tạo', "",$deleteType);
        return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Xóa chương trình đào tạo thành công!"]);
    }
}
