<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WorkFlow extends Model
{
    protected $table="workflows";

    public function ofUser()
    {
    	return $this->belongsTo('App\User','user_id','id');
    }

    public function ofActivity()
    {
    	return $this->belongsTo('App\Activity','activity_id','id');
    }
}
