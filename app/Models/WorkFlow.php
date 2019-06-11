<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WorkFlow extends Model
{
    protected $table="workflows";

    public function ofStudent(){
        return $this->belongsTo('App\Models\Student','student_id','student_id');
    }

    public function ofActivity()
    {
    	return $this->belongsTo('App\Models\Activity','activity_id','id');
    }

    public function details(){
        return $this->hasMany('App\Models\WorkFlowDetail','workflow_id','id');
    }
}
