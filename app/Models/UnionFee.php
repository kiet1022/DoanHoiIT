<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UnionFee extends Model
{
    protected $table="union_fees";

    public function ofSchoolYear()
    {
    	return $this->belongsTo('App\Models\SchoolYear','school_year_id','id');
    }
}
