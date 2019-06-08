<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserRole extends Model
{
    protected $table="user_roles";

    public function ofUser()
    {
    	return $this->belongsTo('App\Models\User','user_id','id');
    }

    public function ofRole()
    {
    	return $this->belongsTo('App\Models\Role','role_id','id');
    }
}
