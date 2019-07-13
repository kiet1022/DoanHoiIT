<?php

namespace App\Http\Controllers\Admin\StatisticalManagement;
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
use App\Models\Checkin;
use App\Models\CheckinDetail;
use App\Models\WorkFlow;
use App\Models\WorkFlowDetail;
use App\Models\Classes;
use DateTime;
use Carbon;
use StringUtil;
use DateTimeUtil;
use App\Models\Log;

class StatisticalController extends Controller
{
    public function stStudentSchoolYear(Request $req){
        // Check user role
        
        $this->data['years'] = SchoolYear::where('type',2)->get();
        $this->data['classes'] = Classes::all();
        $this->data['K15'] = DB::select('call doanhoi_it.statis_student_by_schoolyear(?);',[1]);
        $this->data['K16'] = DB::select('call doanhoi_it.statis_student_by_schoolyear(?);',[2]);
        $this->data['K17'] = DB::select('call doanhoi_it.statis_student_by_schoolyear(?);',[3]);
        $this->data['K18'] = DB::select('call doanhoi_it.statis_student_by_schoolyear(?);',[4]);
        // return dd($this->data);
        return view('admin.statistical.st_student_school_year')->with($this->data);
    }

    public function stFilterStudent(Request $req){
        // Check user role
        
        $this->data['chartYear'] = [];
        $this->data['chartdetail'] = [];
        if(StringUtil::pureString($req->year) == null ){
            $K15 = DB::select('call doanhoi_it.statis_student_by_schoolyear(?);',[1]);
            $K16 = DB::select('call doanhoi_it.statis_student_by_schoolyear(?);',[2]);
            $K17 = DB::select('call doanhoi_it.statis_student_by_schoolyear(?);',[3]);
            $K18 = DB::select('call doanhoi_it.statis_student_by_schoolyear(?);',[4]);
            array_push($this->data['chartdetail'],[$K15, $K16, $K17, $K18]);
        } else if (StringUtil::pureString($req->year) != null){

            $class = Classes::where('school_year_id',$req->year)->get();
            foreach ($class as $cl) {
                $byClass = DB::select('call doanhoi_it.statis_student_by_class(?);',[$cl->id]);
                array_push($this->data['chartdetail'],[$cl->class_name=>$byClass]);
            }
            $byYear = DB::select('call doanhoi_it.statis_student_by_schoolyear(?);',[$req->year]);
            array_push($this->data['chartYear'],[$byYear]);
        }
        return response()->json($this->data);
    }

    public function stUnionFee(Request $req){
        // Check user role

        // forget session
        session()->forget('_old_input');

        $this->data['chartdetail'] = [];
        $this->data['classes'] = Classes::all();
        $this->data['years'] = SchoolYear::where('type',2)->get();

        $this->data['K15'] = DB::select('call doanhoi_it.statis_union_fee(?);',[1]);

        $class = Classes::where('school_year_id',1)->get();
        foreach ($class as $cl) {
            $byClass = DB::select('call doanhoi_it.statis_union_fee_by_class(?);',[$cl->id]);
            array_push($this->data['chartdetail'],[$cl->class_name=>$byClass]);
        }

        $this->data['students'] = Student::where('is_payed_union_fee',0)->where('school_year_id',1)->get();
        // return dd($this->data);
        return view('admin.statistical.st_union_fee')->with($this->data);
        
    }

    public function stFilterUnionFee(Request $req){

        $this->data['chartdetail'] = [];
        $this->data['classes'] = Classes::all();
        $this->data['years'] = SchoolYear::where('type',2)->get();

        $this->data['K15'] = DB::select('call doanhoi_it.statis_union_fee(?);',[$req->schoolyear]);

        $class = Classes::where('school_year_id',$req->schoolyear)->get();
        foreach ($class as $cl) {
            $byClass = DB::select('call doanhoi_it.statis_union_fee_by_class(?);',[$cl->id]);
            array_push($this->data['chartdetail'],[$cl->class_name=>$byClass]);
        }

        $this->data['students'] = Student::where('is_payed_union_fee',0)->where('school_year_id',$req->schoolyear)->get();
        $req->flash();
        return view('admin.statistical.st_union_fee')->with($this->data);
    }
}
