<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Ukm extends Model
{
    use HasFactory;

    protected $table = 'ukm';

    protected $fillable = [
        'nama_ukm',
        'deskripsi',
        'logo_path',
        'is_active',
        'ketua_ukm',
        'max_anggota'
    ];

    protected $casts = [
        'is_active' => 'boolean',
        'max_anggota' => 'integer'
    ];

    // Relationships
    public function pendaftar()
    {
        return $this->hasMany(Pendaftar::class);
    }

    public function users()
    {
        return $this->hasMany(User::class);
    }

    public function pengumuman()
    {
        return $this->hasMany(Pengumuman::class);
    }

    // Scopes
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    // Accessors
    public function getLogoUrlAttribute()
    {
        return $this->logo_path ? asset('storage/' . $this->logo_path) : null;
    }

    public function getTotalPendaftarAttribute()
    {
        return $this->pendaftar()->count();
    }

    public function getPendaftarDiterimaAttribute()
    {
        return $this->pendaftar()->where('status', 'diterima')->count();
    }

    public function divisis()
    {
        return $this->belongsToMany(Divisi::class, 'ukm_divisi', 'ukm_id', 'divisi_id');
    }
}