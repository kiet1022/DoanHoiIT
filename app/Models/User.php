<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Models\Role;
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
    
    public function roles()
    {
        return $this->belongsToMany(Role::class);
    }
    
    /**
    * @param string|array $roles
    */
    public function authorizeRoles($roles)
    {
        if (is_array($roles)) {
            return $this->hasAnyRole($roles) || 
            abort(403);
        }
        return $this->hasRole($roles) || 
        abort(403);
    }
    /**
    * Check multiple roles
    * @param array $roles
    */
    public function hasAnyRole($roles)
    {
        return null !== $this->roles()->whereIn('name', $roles)->first();
    }
    /**
    * Check one role
    * @param string $role
    */
    public function hasRole($role)
    {
        return null !== $this->roles()->where('name', $role)->first();
    }
}
