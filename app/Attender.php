<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Attender extends Model
{
    protected $table="attenders";

    public function ofActivity()
    {
    	return $this->belongsTo('App\Activity','activity_id','id');
    }

    public function ofStudent()
    {
    	return $this->belongsTo('App\Student','student_id','id');
    }
}
