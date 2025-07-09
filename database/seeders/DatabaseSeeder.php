<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $this->call([
            UkmSeeder::class,
            DivisiSeeder::class,
            UserSeeder::class,
        ]);
    }
}