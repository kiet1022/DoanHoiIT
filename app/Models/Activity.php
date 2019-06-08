<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Activity extends Model
{
    protected $table="activities";
    use SoftDeletes;

    public function leadBy()
    {
    	return $this->belongsTo('App\Models\Student','leader','student_id');
    }

    public function attenders()
    {
    	return $this->hasMany('App\Models\Attender','activity_id','id');
    }

    public function workflows()
    {
    	return $this->hasMany('App\Models\WorkFlow','activity_id','id');
    }

    public function checkins()
    {
    	return $this->hasMany('App\Models\Checkin','activity_id','id');
    }

    public function fund()
    {
    	return $this->hasOne('App\Models\ActivityFund','activity_id','id');
    }
}
