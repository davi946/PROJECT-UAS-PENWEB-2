<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run()
    {
        // Super Admin
        User::create([
            'name' => 'Super Admin',
            'email' => 'admin@ukm.ac.id',
            'password' => Hash::make('password'),
            'role' => 'admin',
            'ukm_id' => null,
            'is_active' => true
        ]);

        // UKM Admin untuk setiap UKM
        $ukm_admins = [
            ['name' => 'Admin Basket', 'email' => 'basket@ukm.ac.id', 'ukm_id' => 1],
            ['name' => 'Admin Futsal', 'email' => 'futsal@ukm.ac.id', 'ukm_id' => 2],
            ['name' => 'Admin Badminton', 'email' => 'badminton@ukm.ac.id', 'ukm_id' => 3],
            ['name' => 'Admin Teater', 'email' => 'teater@ukm.ac.id', 'ukm_id' => 4],
            ['name' => 'Admin Musik', 'email' => 'musik@ukm.ac.id', 'ukm_id' => 5],
            ['name' => 'Admin Tari', 'email' => 'tari@ukm.ac.id', 'ukm_id' => 6],
            ['name' => 'Admin Fotografi', 'email' => 'fotografi@ukm.ac.id', 'ukm_id' => 7],
            ['name' => 'Admin Jurnalistik', 'email' => 'jurnalistik@ukm.ac.id', 'ukm_id' => 8],
            ['name' => 'Admin Robotika', 'email' => 'robotika@ukm.ac.id', 'ukm_id' => 9],
            ['name' => 'Admin Pecinta Alam', 'email' => 'pa@ukm.ac.id', 'ukm_id' => 10],
        ];

        foreach ($ukm_admins as $admin) {
            User::create([
                'name' => $admin['name'],
                'email' => $admin['email'],
                'password' => Hash::make('password'),
                'role' => 'ukm_admin',
                'ukm_id' => $admin['ukm_id'],
                'is_active' => true
            ]);
        }
    }
}