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
use DateTime;
use Carbon;
use StringUtil;
use DateTimeUtil;
use App\Models\Log;

class StatisticalController extends Controller
{
    public function stStudentSchoolYear(){
        $this->data['K15'] = DB::select('call doanhoi_it.statis_student_by_schoolyear(?);',[1]);
        $this->data['K16'] = DB::select('call doanhoi_it.statis_student_by_schoolyear(?);',[2]);
        $this->data['K17'] = DB::select('call doanhoi_it.statis_student_by_schoolyear(?);',[3]);
        $this->data['K18'] = DB::select('call doanhoi_it.statis_student_by_schoolyear(?);',[4]);
        // return dd($this->data);
        return view('admin.statistical.st_student_school_year')->with($this->data);
    }
}
