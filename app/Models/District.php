<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class District extends Model
{
    protected $table="districts";

    public function ofProvince()
    {
    	return $this->belongsTo('App\Models\Province','province_id','id');
    }

    public function wards()
    {
    	return $this->hasMany('App\Models\Ward','district_id','id');
    }
}
