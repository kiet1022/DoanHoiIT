<?php

use Illuminate\Database\Seeder;

class ClassesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('classes')->insert([
            [
                'class_id' => '151101',
                'class_name' => '151101A'
            ],
            [
                'class_id' => '151101',
                'class_name' => '151101B'
            ],
            [
                'class_id' => '151101',
                'class_name' => '15110C'
            ]
        ]);
    }
}
