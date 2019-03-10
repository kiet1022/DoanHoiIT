<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserRole extends Model
{
    protected $table="user_roles";

    public function ofUser()
    {
    	return $this->belongsTo('App\User','user_id','id');
    }

    public function ofRole()
    {
    	return $this->belongsTo('App\Role','role_id','id');
    }
}
