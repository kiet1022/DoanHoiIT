<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExecComm extends Model
{
    protected $table="exec_comm";

    public function ofStudent()
    {
    	return $this->belongsTo('App\Student','student_id','student_id');
    }
}
