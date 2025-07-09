<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Divisi extends Model
{
    use HasFactory;

    protected $table = 'divisi';

    protected $fillable = [
        'nama_divisi',
        'deskripsi',
        'is_active',
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

    // Scopes
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    // Accessors
    public function getTotalPendaftarAttribute()
    {
        return $this->pendaftar()->count();
    }

    public function getPendaftarDiterimaAttribute()
    {
        return $this->pendaftar()->where('status', 'diterima')->count();
    }

    public function ukms()
    {
        return $this->belongsToMany(Ukm::class, 'ukm_divisi', 'divisi_id', 'ukm_id');
    }

}