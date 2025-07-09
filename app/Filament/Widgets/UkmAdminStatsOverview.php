<?php

namespace App\Filament\Widgets;

use App\Models\Pendaftar;
use App\Models\Pengumuman;
use App\Models\Divisi;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class UkmAdminStatsOverview extends BaseWidget
{
protected static ?string $pollingInterval = '15s';
protected static bool $isLazy = false;
protected static ?int $sort = 1;

public static function canView(): bool
{
return auth()->user()->isUkmAdmin();
}

protected function getStats(): array
{
$user = auth()->user();
$ukmId = $user->ukm_id;

$totalPendaftar = Pendaftar::where('ukm_id', $ukmId)->count();
$pendaftarPending = Pendaftar::where('ukm_id', $ukmId)
->where('status', 'pending')->count();
$pendaftarDiterima = Pendaftar::where('ukm_id', $ukmId)
->where('status', 'diterima')->count();
$pendaftarDitolak = Pendaftar::where('ukm_id', $ukmId)
->where('status', 'ditolak')->count();

$maxAnggota = $user->ukm->max_anggota ?? 0;
$sisaKuota = $maxAnggota - $pendaftarDiterima;
$pengumumanAktif = Pengumuman::where('ukm_id', $ukmId)
->where('is_active', true)->count();

return [
Stat::make('Total Pendaftar', $totalPendaftar)
->description($pendaftarPending . ' Menunggu Review')
->descriptionIcon('heroicon-m-user-group')
->chart([15, 4, 10, 2, 12, 4, 12])
->color('info'),

Stat::make('Pendaftar Diterima', $pendaftarDiterima)
->description('Dari ' . $maxAnggota . ' kuota maksimal')
->descriptionIcon('heroicon-m-check-circle')
->chart([3, 2, 12, 13, 24, 8, 25])
->color('success'),

Stat::make('Sisa Kuota', $sisaKuota)
->description($sisaKuota > 0 ? 'Masih tersedia' : 'Kuota penuh')
->descriptionIcon('heroicon-m-users')
->chart([7, 2, 10, 3, 15, 4, 17])
->color($sisaKuota > 0 ? 'success' : 'danger'),

Stat::make('Pengumuman Aktif', $pengumumanAktif)
->description($pendaftarDitolak . ' Pendaftar Ditolak')
->descriptionIcon('heroicon-m-megaphone')
->chart([2, 10, 3, 15, 4, 17, 7])
->color('warning'),
];
}
}