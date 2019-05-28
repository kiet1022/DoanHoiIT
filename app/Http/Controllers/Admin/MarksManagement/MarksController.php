<?php

namespace App\Http\Controllers\Admin\MarksManagement;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\AddMarksRequest;
use App\Activity;
use App\SchoolYear;
use App\Checkin;
use App\CheckinDetail;
use App\Student;
class MarksController extends Controller
{
    public function getMarksList(){
        $this->data['activities'] = Activity::with(['checkins'])->get();
        $this->data['year'] = SchoolYear::where('type',1)->get();
        $this->data['checkinlist'] = Checkin::with(['ofActivity','details'=>function($q){
            $q->with(['ofStudent'=>function($s){
                $s->select('student_id','name');
            }])->select('id','checkin_id','student_id');
        }])->get();
        return view('admin.ac_marks.marks_list')->with($this->data);
    }

    public function getMarksDetail(Request $req){
        $detail = CheckinDetail::where('checkin_id',$req->checkinId)->select('student_id')->get();
        return response()->json($detail);
    }

    public function getAddNewMarks(){
        $this->data['activities'] = Activity::where('year','2018 - 2019')->get();
        $this->data['year'] = SchoolYear::where('type',1)->orderBy('name','desc')->first();
        $this->data['students'] = Student::all();
        return view('admin.ac_marks.add_marks')->with($this->data);
    }

    public function postAddNewMarks(AddMarksRequest $req){
        return $req;
    }
}
