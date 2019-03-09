<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStudentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('students', function (Blueprint $table) {
            $table->charset = 'utf8';
            $table->collation = 'utf8_unicode_ci';
            $table->engine = 'InnoDB';

            $table->char('student_id',20);
            $table->string('name',200)->nullable();
            $table->unsignedInteger('class_id');
            $table->unsignedInteger('school_year_id');
            $table->string('address',500)->nullable();
            $table->date('birthday')->nullable();
            $table->boolean('sex')->default(true);
            $table->integer('phone_no')->default(true);
            $table->boolean('is_youth_union_member')->default(true);
            $table->boolean('is_study')->default(true);
            $table->date('date_on_union')->nullable();
            $table->boolean('is_payed_union_fee')->default(true);
            $table->timestamps();
            $table->unsignedInteger('created_by')->nullable();
            $table->unsignedInteger('updated_by')->nullable();
            $table->softDeletes()->nullable();

            $table->primary('student_id');
            // $table->foreign('class_id')->references('id')->on('classes')->onDelete('cascade');
            // $table->foreign('school_year_id')->references('id')->on('school_years')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('students');
    }
}
