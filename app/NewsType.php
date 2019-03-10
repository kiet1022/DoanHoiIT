<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class NewsType extends Model
{
    protected $table="news_types";

    public function news()
    {
    	return $this->hasMany('App\News','type_id','id');
    }
}
