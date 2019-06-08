<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AssociationEc extends Model
{
    protected $table="association_ec";

    public function ofStudent()
    {
    	return $this->hasOne('App\Models\Student','student_id','student_id');
    }
}
