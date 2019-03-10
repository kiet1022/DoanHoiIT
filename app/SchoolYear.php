<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SchoolYear extends Model
{
    protected $table="school_years";

    public function students()
    {
    	return $this->hasMany('App\Student','school_year_id','id');
    }

    public function unionFee()
    {
    	return $this->hasOne('App\UnionFee','school_year_id','id');
    }

    public function yearFund()
    {
    	return $this->hasOne('App\YearlyFund','school_year_id','id');
    }
}
