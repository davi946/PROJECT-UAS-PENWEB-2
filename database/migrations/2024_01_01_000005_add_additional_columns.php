<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddAdditionalColumns extends Migration
{
public function up()
{
// Tambahkan kolom ke tabel ukm
Schema::table('ukm', function (Blueprint $table) {
$table->text('deskripsi')->nullable()->after('nama_ukm');
$table->string('logo_path', 255)->nullable()->after('deskripsi');
$table->boolean('is_active')->default(true)->after('logo_path');
$table->string('ketua_ukm', 100)->nullable()->after('is_active');
$table->integer('max_anggota')->nullable()->after('ketua_ukm');
});

// Tambahkan kolom ke tabel divisi
Schema::table('divisi', function (Blueprint $table) {
$table->text('deskripsi')->nullable()->after('nama_divisi');
$table->boolean('is_active')->default(true)->after('deskripsi');
$table->integer('max_anggota')->nullable()->after('is_active');
});

// Tambahkan kolom ke tabel pendaftar
Schema::table('pendaftar', function (Blueprint $table) {
$table->string('email', 100)->nullable()->after('nim');
$table->string('no_telp', 20)->nullable()->after('email');
$table->enum('jenis_kelamin', ['L', 'P'])->nullable()->after('no_telp');
$table->date('tanggal_lahir')->nullable()->after('jenis_kelamin');
$table->text('alamat')->nullable()->after('tanggal_lahir');
$table->enum('status', ['pending', 'diterima', 'ditolak'])->default('pending')->after('alasan_bergabung');
$table->text('keterangan')->nullable()->after('status');
$table->timestamp('tanggal_daftar')->default(DB::raw('CURRENT_TIMESTAMP'))->after('keterangan');
});
}

public function down()
{
Schema::table('ukm', function (Blueprint $table) {
$table->dropColumn(['deskripsi', 'logo_path', 'is_active', 'ketua_ukm', 'max_anggota']);
});

Schema::table('divisi', function (Blueprint $table) {
$table->dropColumn(['deskripsi', 'is_active', 'max_anggota']);
});

Schema::table('pendaftar', function (Blueprint $table) {
$table->dropColumn(['email', 'no_telp', 'jenis_kelamin', 'tanggal_lahir', 'alamat', 'status', 'keterangan',
'tanggal_daftar']);
});
}
}