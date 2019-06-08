<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ExecComm extends Model
{
    protected $table="exec_comm";

    public function ofStudent()
    {
    	return $this->hasOne('App\Models\Student','student_id','student_id');
    }
}
