<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Collaborator extends Model
{
    protected $table = "collaborators";
    
    public function ofStudent()
    {
    	return $this->hasOne('App\Models\Student','student_id','student_id');
    }
}
