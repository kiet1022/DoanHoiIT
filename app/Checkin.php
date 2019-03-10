<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Checkin extends Model
{
    protected $table="checkin";

    public function ofActivity()
    {
    	return $this->belongsTo('App\Activity','activity_id','id');
    }

    public function ofStudent()
    {
    	return $this->belongsTo('App\Student','student_id','id');
    }
}
