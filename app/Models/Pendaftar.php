<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Pendaftar extends Model
{
use HasFactory;

protected $table = 'pendaftar';

protected $fillable = [
'nama_lengkap',
'nim',
'email',
'no_telp',
'jenis_kelamin',
'tanggal_lahir',
'alamat',
'angkatan',
'program_studi',
'foto_path',
'alasan_bergabung',
'ukm_id',
'divisi_id',
'status',
'keterangan',
'tanggal_daftar'
];

protected $casts = [
'tanggal_lahir' => 'date',
'tanggal_daftar' => 'datetime'
];

// Relationships
public function ukm()
{
return $this->belongsTo(Ukm::class);
}

public function divisi()
{
return $this->belongsTo(Divisi::class);
}

// Scopes
public function scopePending($query)
{
return $query->where('status', 'pending');
}

public function scopeDiterima($query)
{
return $query->where('status', 'diterima');
}

public function scopeDitolak($query)
{
return $query->where('status', 'ditolak');
}

public function scopeByUkm($query, $ukmId)
{
return $query->where('ukm_id', $ukmId);
}

public function scopeByDivisi($query, $divisiId)
{
return $query->where('divisi_id', $divisiId);
}

// Accessors
public function getFotoUrlAttribute()
{
return $this->foto_path ? asset('storage/' . $this->foto_path) : null;
}

public function getStatusBadgeAttribute()
{
$badges = [
'pending' => 'warning',
'diterima' => 'success',
'ditolak' => 'danger'
];

return $badges[$this->status] ?? 'secondary';
}

    public function getUmurAttribute()
    {
        return ($this->tanggal_lahir instanceof \Carbon\Carbon)
            ? $this->tanggal_lahir->age
            : null;
    }
}