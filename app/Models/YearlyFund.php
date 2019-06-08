<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class YearlyFund extends Model
{
    protected $table="yearly_funds";

    public function ofSchoolYear()
    {
    	return $this->belongsTo('App\Models\SchoolYear','school_year_id','id');
    }
}
