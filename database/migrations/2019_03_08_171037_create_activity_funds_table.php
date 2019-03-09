<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateActivityFundsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('activity_funds', function (Blueprint $table) {
            $table->charset = 'utf8';
            $table->collation = 'utf8_unicode_ci';
            $table->engine = 'InnoDB';

            $table->increments('id');
            $table->unsignedInteger('activity_id');
            $table->bigInteger('initial_funds');
            $table->bigInteger('actual_funds');
            $table->string('name')->nullable();
            $table->timestamps();
            $table->unsignedInteger('created_by')->nullable();
            $table->unsignedInteger('updated_by')->nullable();
            $table->softDeletes()->nullable();

            // $table->foreign('activity_id')->references('id')->on('activities')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('activity_funds');
    }
}
