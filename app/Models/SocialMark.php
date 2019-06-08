<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SocialMark extends Model
{
    protected $table="social_marks";

    public function ofActivity()
    {
    	return $this->belongsTo('App\Models\Activity','activity_id','id');
    }

    public function ofStudent()
    {
        return $this->belongsTo('App\Models\Student','student_id','id');
    }
}
