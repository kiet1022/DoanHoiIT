<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class ActivityFund extends Model
{
    protected $table="activity_funds";
    use SoftDeletes;
    
    public function activity()
    {
    	return $this->belongsTo('App\Activity','activity_id','id');
    }

    public function details()
    {
    	return $this->hasmany('App\ActivityFundDetail','fund_id','id');
    }

    public function details_with_trashed()
    {
    	return $this->hasmany('App\ActivityFundDetail','fund_id','id')->onlyTrashed();
    }
}
