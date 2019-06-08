<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function activities()
    {
    	return $this->hasMany('App\Models\Activity','leader','id');
    }

    public function userRoles()
    {
    	return $this->hasMany('App\Models\UserRole','user_id','id');
    }

    public function workFlows()
    {
    	return $this->hasMany('App\Models\WorkFlow','user_id','id');
    }

    public function payForFunds()
    {
    	return $this->hasMany('App\Models\ActivitiFundDetail','user_id','id');
    }

    public function news()
    {
    	return $this->hasMany('App\Models\News','created_by','id');
    }

    public function student(){
        return $this->belongsTo('App\Models\Student', 'student_id','student_id');
    }
}
