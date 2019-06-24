<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;
class Role extends Model
{
    protected $table="roles";
    
    public function userRoles()
    {
        return $this->hasMany('App\Models\UserRole','role_id','id');
    }
    
    public function users()
    {
        return $this->belongsToMany(User::class);
    }
}
