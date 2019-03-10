<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ActivityFund extends Model
{
    protected $table="activity_funds";

    public function activity()
    {
    	return $this->belongsTo('App\Activity','activity_id','id');
    }

    public function details()
    {
    	return $this->hasmany('App\ActivityFundDetail','fund_id','id');
    }
}
