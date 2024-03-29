<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateExecCommTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('exec_comm', function (Blueprint $table) {
            $table->charset = 'utf8';
            $table->collation = 'utf8_unicode_ci';
            $table->engine = 'InnoDB';

            $table->increments('id');
            $table->char('student_id',20);
            $table->integer('level')->default(0)->comment('0: UV BCH Đoàn, 1: Bí Thư, 2: Phó bí thư, 3:Phó BT+LCH Trưởng, 4: LCH Phó 5:UV BCH LCH, 6: CTV');
            $table->integer('type')->default(0)->comment('0: BCH Đoàn, 1: BCH LCH, 2: CTV, 3: Đoàn + Hội (LCH Phó)');
            $table->timestamps();
            $table->unsignedInteger('created_by')->nullable();
            $table->unsignedInteger('updated_by')->nullable();
            $table->softDeletes()->nullable();
            //$table->foreign('student_id')->references('student_id')->on('students')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('exec_comm');
    }
}
