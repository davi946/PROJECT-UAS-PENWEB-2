<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UkmDivisi extends Model
{
    protected $table = 'ukm_divisi';

    protected $fillable = [
        'ukm_id',
        'divisi_id',
    ];

    public $timestamps = false;

    // Relasi ke UKM
    public function ukm()
    {
        return $this->belongsTo(Ukm::class);
    }

    // Relasi ke Divisi
    public function divisi()
    {
        return $this->belongsTo(Divisi::class);
    }
}
