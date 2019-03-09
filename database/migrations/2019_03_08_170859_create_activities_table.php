<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateActivitiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('activities', function (Blueprint $table) {
            $table->charset = 'utf8';
            $table->collation = 'utf8_unicode_ci';
            $table->engine = 'InnoDB';

            $table->increments('id');
            $table->string('name')->nullable();
            $table->date('start_regis_date');
            $table->date('end_regis_date');
            $table->date('start_date');
            $table->date('end_date');
            $table->string('content', 500)->nullable();
            $table->tinyInteger('practise_marks')->default(0);
            $table->tinyInteger('social_marks')->default(0);
            $table->integer('max_regis_num')->default(0);
            $table->unsignedInteger('leader');
            $table->timestamps();
            $table->unsignedInteger('created_by')->nullable();
            $table->unsignedInteger('updated_by')->nullable();
            $table->softDeletes()->nullable();

            // $table->foreign('leader')->references('student_id')->on('students')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('activites');
    }
}
