<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePendaftarTable extends Migration
{
    public function up()
    {
        Schema::create('pendaftar', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('nama_lengkap', 100);
            $table->string('nim', 20);
            $table->string('angkatan', 10);
            $table->string('program_studi', 100);
            $table->string('foto_path', 255)->nullable();
            $table->text('alasan_bergabung');

            // Foreign keys
            $table->unsignedBigInteger('ukm_id');
            $table->unsignedBigInteger('divisi_id');

            $table->timestamps();

            // Indexes dan foreign key constraints
            $table->index('ukm_id');
            $table->index('divisi_id');
            $table->index('nim');

            $table->foreign('ukm_id')->references('id')->on('ukm')->onDelete('cascade');
            $table->foreign('divisi_id')->references('id')->on('divisi')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('pendaftar');
    }
}