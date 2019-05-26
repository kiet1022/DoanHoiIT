<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Checkin extends Model
{
    protected $table="checkin";

    public function ofActivity()
    {
    	return $this->belongsTo('App\Activity','activity_id','id');
    }

    public function details()
    {
    	return $this->hasMany('App\CheckinDetail','checkin_id','id');
    }
}
