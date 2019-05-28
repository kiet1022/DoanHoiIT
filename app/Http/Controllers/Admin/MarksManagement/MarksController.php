<?php

namespace App\Http\Controllers\Admin\MarksManagement;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Activity;
use App\SchoolYear;
use App\Checkin;
use App\CheckinDetail;
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
}
