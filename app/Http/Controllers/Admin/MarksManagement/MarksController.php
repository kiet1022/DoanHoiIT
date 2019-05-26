<?php

namespace App\Http\Controllers\Admin\MarksManagement;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Activity;
use App\SchoolYear;
class MarksController extends Controller
{
    public function getMarksList(){
        $this->data['activities'] = Activity::with(['leadBy','fund'])->get();
        $this->data['year'] = SchoolYear::where('type',1)->get();
        return view('admin.ac_marks.marks_list')->with($this->data);
    }
}
