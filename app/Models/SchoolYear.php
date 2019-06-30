<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class SchoolYear extends Model
{
    protected $table="school_years";
    use SoftDeletes;
    public function students()
    {
    	return $this->hasMany('App\Models\Student','school_year_id','id');
    }

    public function unionFee()
    {
    	return $this->hasOne('App\Models\UnionFee','school_year_id','id');
    }

    public function yearFund()
    {
    	return $this->hasOne('App\Models\YearlyFund','school_year_id','id');
    }
    public function classes()
    {
        return $this->hasMany('App\Models\Classes','school_year_id','id');
    }
}