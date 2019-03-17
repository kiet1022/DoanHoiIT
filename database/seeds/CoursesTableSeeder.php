<?php

use Illuminate\Database\Seeder;

class CoursesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('courses')->insert([
            [
                'name'=>'K15'
            ],
            [
                'name'=>'K16'
            ],
            [
                'name'=>'K17'
            ],
            [
                'name'=>'K18'
            ]
        ]);
    }
}
