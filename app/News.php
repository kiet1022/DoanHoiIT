<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class News extends Model
{
	use SoftDeletes;
    protected $table="news";

    public function ofType()
    {
    	return $this->belongsTo('App\NewsType','type_id','id');
    }

    public function ofUser()
    {
    	return $this->belongsTo('App\User','created_by','id');
    }
}
