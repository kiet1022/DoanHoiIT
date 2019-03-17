<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UnionFee extends Model
{
    protected $table="union_fees";

    public function ofSchoolYear()
    {
    	return $this->belongsTo('App\SchoolYear','school_year_id','id');
    }
}
