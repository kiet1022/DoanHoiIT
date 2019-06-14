<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class WorkFlow extends Model
{
    protected $table="workflows";
    use SoftDeletes;
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
