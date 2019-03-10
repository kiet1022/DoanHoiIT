<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class District extends Model
{
    protected $table="districts";

    public function ofProvince()
    {
    	return $this->belongsTo('App\Province','province_id','id');
    }

    public function wards()
    {
    	return $this->hasMany('App\Ward','district_id','id');
    }
}
