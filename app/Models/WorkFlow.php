<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WorkFlow extends Model
{
    protected $table="workflows";

    public function ofUser()
    {
    	return $this->belongsTo('App\Models\User','user_id','id');
    }

    public function ofActivity()
    {
    	return $this->belongsTo('App\Models\Activity','activity_id','id');
    }
}
