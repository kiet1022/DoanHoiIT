<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Classes extends Model
{
    protected $table="classes";

    public function students()
    {
    	return $this->hasMany('App\Student','class_id','id');
    }
    public function schoolYear()
    {
    	return $this->belongsTo('App\SchoolYear','school_year_id','id');
    }
}
