<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AssociationEc extends Model
{
    protected $table="association_ec";

    public function ofStudent()
    {
    	return $this->hasOne('App\Student','student_id','student_id');
    }
}
