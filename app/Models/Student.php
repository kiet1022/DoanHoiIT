<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\SoftDeletes;
class Student extends Model
{
    use SoftDeletes;
    
    protected $table="students";
    
    public $incrementing = false;
    protected $keyType = 'string';
    protected $primaryKey = 'student_id';

    public function user()
    {
    	return $this->hasOne('App\Models\User','student_id','student_id');
    }

    public function attends()
    {
    	return $this->hasMany('App\Models\Attender','student_id','id');
    }

    public function checkin()
    {
    	return $this->hasMany('App\Models\Checkin','student_id','id');
    }

    public function practiseMarks()
    {
    	return $this->hasMany('App\Models\PractiseMark','student_id','id');
    }

    public function socialMarks()
    {
    	return $this->hasMany('App\Models\SocialMark','student_id','id');
    }

    public function class()
    {
    	return $this->belongsTo('App\Models\Classes','class_id','id');
    }

    public function schoolYear(){
        return $this->belongsTo('App\Models\SchoolYear','school_year_id','id');
    }

    public function execComm(){
        return $this->hasOne('App\Models\ExecComm','student_id','student_id');
    }

    public function association(){
        return $this->hasOne('App\Models\AssociationEc','student_id','student_id');
    }

    public function collaborator(){
        return $this->hasOne('App\Models\Collaborator','student_id','student_id');
    }

    public function leadActivity(){
        return $this->hasMany('App\Models\Activity','leader','student_id');
    }
}
