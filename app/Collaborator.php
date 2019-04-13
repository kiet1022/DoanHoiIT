<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Collaborator extends Model
{
    protected $table = "collaborators";
    
    public function ofStudent()
    {
    	return $this->hasOne('App\Student','student_id','student_id');
    }
}
