<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class NewsType extends Model
{
	use SoftDeletes;
    protected $table="news_types";

    public function news()
    {
    	return $this->hasMany('App\Models\News','type_id','id');
    }
}
