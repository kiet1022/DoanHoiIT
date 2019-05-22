<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ActivityFundDetail extends Model
{
    protected $table="activity_fund_details";
    use SoftDeletes;
    public function fund()
    {
    	return $this->belongsTo('App\ActivityFund','fund_id','id');
    }

    public function payer()
    {
    	return $this->belongsTo('App\User','user_id','id');
    }
}
