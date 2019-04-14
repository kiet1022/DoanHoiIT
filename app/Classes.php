<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Classes extends Model
{
	use SoftDeletes;
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
