<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
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
}
