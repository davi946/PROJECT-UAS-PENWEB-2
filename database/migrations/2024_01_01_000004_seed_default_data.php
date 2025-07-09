<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class SeedDefaultData extends Migration
{
    public function up()
    {
        // Insert default UKM
        DB::table('ukm')->insert([
            ['nama_ukm' => 'Basket', 'created_at' => now(), 'updated_at' => now()],
            ['nama_ukm' => 'Futsal', 'created_at' => now(), 'updated_at' => now()],
            ['nama_ukm' => 'Badminton', 'created_at' => now(), 'updated_at' => now()],
            ['nama_ukm' => 'Teater', 'created_at' => now(), 'updated_at' => now()],
            ['nama_ukm' => 'Musik', 'created_at' => now(), 'updated_at' => now()],
            ['nama_ukm' => 'Tari', 'created_at' => now(), 'updated_at' => now()],
            ['nama_ukm' => 'Fotografi', 'created_at' => now(), 'updated_at' => now()],
            ['nama_ukm' => 'Jurnalistik', 'created_at' => now(), 'updated_at' => now()],
        ]);

        // Insert default Divisi
        DB::table('divisi')->insert([
            ['nama_divisi' => 'Umum', 'created_at' => now(), 'updated_at' => now()],
            ['nama_divisi' => 'Humas', 'created_at' => now(), 'updated_at' => now()],
            ['nama_divisi' => 'Sekretaris', 'created_at' => now(), 'updated_at' => now()],
            ['nama_divisi' => 'Bendahara', 'created_at' => now(), 'updated_at' => now()],
            ['nama_divisi' => 'Acara', 'created_at' => now(), 'updated_at' => now()],
            ['nama_divisi' => 'Dokumentasi', 'created_at' => now(), 'updated_at' => now()],
            ['nama_divisi' => 'Publikasi', 'created_at' => now(), 'updated_at' => now()],
        ]);
    }

    public function down()
    {
        DB::table('pendaftar')->truncate();
        DB::table('divisi')->truncate();
        DB::table('ukm')->truncate();
    }
}