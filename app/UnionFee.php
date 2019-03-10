<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UnionFee extends Model
{
    protected $table="practise_marks";

    public function ofSchoolYear()
    {
    	return $this->belongsTo('App\SchoolYear','school_year_id','id');
    }
}
