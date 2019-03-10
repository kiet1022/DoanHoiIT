<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Province extends Model
{
    protected $table="practise_marks";

    public function districts()
    {
    	return $this->hasMany('App\District','province_id','id');
    }
}
