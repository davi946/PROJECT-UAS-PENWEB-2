<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Ukm;

class UkmSeeder extends Seeder
{
    public function run()
    {
        $ukm_data = [
            [
                'nama_ukm' => 'Basket',
                'deskripsi' => 'Unit Kegiatan Mahasiswa yang fokus pada olahraga bola basket. Mengembangkan kemampuan bermain basket dan
sportivitas.',
                'is_active' => true,
                'ketua_ukm' => 'Ahmad Fauzi',
                'max_anggota' => 30
            ],
            [
                'nama_ukm' => 'Futsal',
                'deskripsi' => 'Unit Kegiatan Mahasiswa yang fokus pada olahraga futsal. Membangun kerjasama tim dan prestasi
olahraga.',
                'is_active' => true,
                'ketua_ukm' => 'Budi Santoso',
                'max_anggota' => 25
            ],
            [
                'nama_ukm' => 'Badminton',
                'deskripsi' => 'Unit Kegiatan Mahasiswa yang mengembangkan kemampuan bermain badminton tingkat universitas.',
                'is_active' => true,
                'ketua_ukm' => 'Sari Dewi',
                'max_anggota' => 20
            ],
            [
                'nama_ukm' => 'Teater',
                'deskripsi' => 'Unit Kegiatan Mahasiswa yang mengembangkan seni peran dan pertunjukan teater.',
                'is_active' => true,
                'ketua_ukm' => 'Rina Maharani',
                'max_anggota' => 35
            ],
            [
                'nama_ukm' => 'Musik',
                'deskripsi' => 'Unit Kegiatan Mahasiswa yang mengembangkan bakat musik dan seni suara mahasiswa.',
                'is_active' => true,
                'ketua_ukm' => 'Dani Pratama',
                'max_anggota' => 40
            ],
            [
                'nama_ukm' => 'Tari',
                'deskripsi' => 'Unit Kegiatan Mahasiswa yang melestarikan dan mengembangkan seni tari tradisional dan modern.',
                'is_active' => true,
                'ketua_ukm' => 'Maya Putri',
                'max_anggota' => 25
            ],
            [
                'nama_ukm' => 'Fotografi',
                'deskripsi' => 'Unit Kegiatan Mahasiswa yang mengembangkan kemampuan fotografi dan dokumentasi.',
                'is_active' => true,
                'ketua_ukm' => 'Riko Mahendra',
                'max_anggota' => 30
            ],
            [
                'nama_ukm' => 'Jurnalistik',
                'deskripsi' => 'Unit Kegiatan Mahasiswa yang mengembangkan kemampuan jurnalistik dan media kampus.',
                'is_active' => true,
                'ketua_ukm' => 'Lisa Handayani',
                'max_anggota' => 35
            ],
            [
                'nama_ukm' => 'Robotika',
                'deskripsi' => 'Unit Kegiatan Mahasiswa yang fokus pada pengembangan teknologi robotika dan automasi.',
                'is_active' => true,
                'ketua_ukm' => 'Arif Nugroho',
                'max_anggota' => 20
            ],
            [
                'nama_ukm' => 'Pecinta Alam',
                'deskripsi' => 'Unit Kegiatan Mahasiswa yang fokus pada kegiatan alam terbuka dan konservasi lingkungan.',
                'is_active' => true,
                'ketua_ukm' => 'Eko Purnomo',
                'max_anggota' => 45
            ]
        ];

        foreach ($ukm_data as $ukm) {
            Ukm::create($ukm);
        }
    }
}