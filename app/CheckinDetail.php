<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CheckinDetail extends Model
{
    protected $table="checkin_details";

    public function ofCheckin()
    {
    	return $this->belongsTo('App\Checkin','checkin_id','id');
    }

    public function ofStudent()
    {
    	return $this->belongsTo('App\Student','student_id','id');
    }
}
