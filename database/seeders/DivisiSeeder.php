<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Divisi;

class DivisiSeeder extends Seeder
{
    public function run()
    {
        $divisi_data = [
            [
                'nama_divisi' => 'Ketua',
                'deskripsi' => 'Divisi kepemimpinan dan koordinasi UKM',
                'is_active' => true,
                'max_anggota' => 1
            ],
            [
                'nama_divisi' => 'Wakil Ketua',
                'deskripsi' => 'Divisi yang membantu ketua dalam menjalankan organisasi',
                'is_active' => true,
                'max_anggota' => 1
            ],
            [
                'nama_divisi' => 'Sekretaris',
                'deskripsi' => 'Divisi yang menangani administrasi dan kesekretariatan',
                'is_active' => true,
                'max_anggota' => 2
            ],
            [
                'nama_divisi' => 'Bendahara',
                'deskripsi' => 'Divisi yang menangani keuangan dan anggaran UKM',
                'is_active' => true,
                'max_anggota' => 2
            ],
            [
                'nama_divisi' => 'Humas',
                'deskripsi' => 'Divisi hubungan masyarakat dan eksternal',
                'is_active' => true,
                'max_anggota' => 5
            ],
            [
                'nama_divisi' => 'Acara',
                'deskripsi' => 'Divisi yang menangani perencanaan dan pelaksanaan acara',
                'is_active' => true,
                'max_anggota' => 8
            ],
            [
                'nama_divisi' => 'Dokumentasi',
                'deskripsi' => 'Divisi yang menangani dokumentasi kegiatan UKM',
                'is_active' => true,
                'max_anggota' => 4
            ],
            [
                'nama_divisi' => 'Publikasi',
                'deskripsi' => 'Divisi yang menangani publikasi dan promosi UKM',
                'is_active' => true,
                'max_anggota' => 5
            ],
            [
                'nama_divisi' => 'Anggota',
                'deskripsi' => 'Anggota biasa UKM',
                'is_active' => true,
                'max_anggota' => 50
            ]
        ];

        foreach ($divisi_data as $divisi) {
            Divisi::create($divisi);
        }
    }
}