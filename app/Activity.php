<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Activity extends Model
{
    protected $table="activities";

    public function leadBy()
    {
    	return $this->belongsTo('App\User','leader','id');
    }

    public function attenders()
    {
    	return $this->hasMany('App\Attender','activity_id','id');
    }

    public function workflows()
    {
    	return $this->hasMany('App\WorkFlow','activity_id','id');
    }

    public function checkins()
    {
    	return $this->hasMany('App\Checkin','activity_id','id');
    }

    public function fund()
    {
    	return $this->hasOne('App\ActivityFund','activity_id','id');
    }
}
