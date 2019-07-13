<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Attender;
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
    	return $this->belongsTo(Attender::class);
    }

    public function checkin()
    {
    	return $this->hasMany('App\Models\Checkin','student_id','id');
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

    public function isAttend($activity_id, $student_id){
        return null !== Attender::where('activity_id', $activity_id)->where('student_id', $student_id)->first();
    }


}
