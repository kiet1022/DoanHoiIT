<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class NewsType extends Model
{
	use SoftDeletes;
    protected $table="news_types";

    public function news()
    {
    	return $this->hasMany('App\News','type_id','id');
    }
}
