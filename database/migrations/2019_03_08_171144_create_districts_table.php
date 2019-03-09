<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDistrictsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('districts', function (Blueprint $table) {
            $table->charset = 'utf8';
            $table->collation = 'utf8_unicode_ci';
            $table->engine = 'InnoDB';

            $table->char('id', 20);
            $table->string('name')->nullable();
            $table->string('type')->nullable();
            $table->char('province_id');
            $table->timestamps();
            $table->unsignedInteger('created_by')->nullable();
            $table->unsignedInteger('updated_by')->nullable();
            $table->softDeletes()->nullable();
            $table->primary('id');
            

            // $table->foreign('province_id')->references('id')->on('provinces')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('districts');
    }
}
