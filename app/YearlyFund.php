<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class YearlyFund extends Model
{
    protected $table="yearly_funds";

    public function ofSchoolYear()
    {
    	return $this->belongsTo('App\SchoolYear','school_year_id','id');
    }
}
