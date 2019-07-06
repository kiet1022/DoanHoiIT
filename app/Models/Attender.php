<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Attender extends Model
{
    protected $table="attenders";

    public function ofActivity()
    {
    	return $this->belongsTo('App\Models\Activity','activity_id','id');
    }

    public function ofStudent()
    {
    	return $this->belongsTo('App\Models\Student','student_id','student_id');
    }
}
