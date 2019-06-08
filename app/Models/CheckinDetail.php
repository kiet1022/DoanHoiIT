<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CheckinDetail extends Model
{
    protected $table="checkin_details";

    public function ofCheckin()
    {
    	return $this->belongsTo('App\Models\Checkin','checkin_id','id');
    }

    public function ofStudent()
    {
    	return $this->belongsTo('App\Models\Student','student_id','student_id');
    }
}
