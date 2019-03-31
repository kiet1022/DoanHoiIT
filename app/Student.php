<?php

namespace App;

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
    	return $this->hasOne('App\User','student_id','student_id');
    }

    public function attends()
    {
    	return $this->hasMany('App\Attender','student_id','id');
    }

    public function checkin()
    {
    	return $this->hasMany('App\Checkin','student_id','id');
    }

    public function practiseMarks()
    {
    	return $this->hasMany('App\PractiseMark','student_id','id');
    }

    public function socialMarks()
    {
    	return $this->hasMany('App\SocialMark','student_id','id');
    }

    public function class()
    {
    	return $this->belongsTo('App\Classes','class_id','id');
    }

    public function schoolYear(){
        return $this->belongsTo('App\SchoolYear','school_year_id','id');
    }
}
