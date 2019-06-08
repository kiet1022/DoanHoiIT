<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Checkin extends Model
{
    protected $table="checkin";

    public function ofActivity()
    {
    	return $this->belongsTo('App\Models\Activity','activity_id','id');
    }

    public function details()
    {
    	return $this->hasMany('App\Models\CheckinDetail','checkin_id','id');
    }
}
