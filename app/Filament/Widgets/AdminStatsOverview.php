<?php

namespace App\Filament\Widgets;

use App\Models\Ukm;
use App\Models\Pendaftar;
use App\Models\Divisi;
use App\Models\Pengumuman;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class AdminStatsOverview extends BaseWidget
{
protected static ?string $pollingInterval = '15s';
protected static bool $isLazy = false;
protected static ?int $sort = 1;

public static function canView(): bool
{
return auth()->user()->isAdmin();
}

protected function getStats(): array
{
$totalUkm = Ukm::count();
$totalUkmAktif = Ukm::where('is_active', true)->count();
$totalPendaftar = Pendaftar::count();
$totalPendaftarPending = Pendaftar::where('status', 'pending')->count();
$totalPendaftarDiterima = Pendaftar::where('status', 'diterima')->count();
$totalDivisi = Divisi::count();
$totalPengumuman = Pengumuman::where('is_active', true)->count();

return [
Stat::make('Total UKM', $totalUkm)
->description($totalUkmAktif . ' UKM Aktif')
->descriptionIcon('heroicon-m-building-office-2')
->chart([7, 2, 10, 3, 15, 4, 17])
->color('success'),

Stat::make('Total Pendaftar', $totalPendaftar)
->description($totalPendaftarPending . ' Menunggu Persetujuan')
->descriptionIcon('heroicon-m-user-group')
->chart([15, 4, 10, 2, 12, 4, 12])
->color('info'),

Stat::make('Pendaftar Diterima', $totalPendaftarDiterima)
->description('Dari ' . $totalPendaftar . ' total pendaftar')
->descriptionIcon('heroicon-m-check-circle')
->chart([3, 2, 12, 13, 24, 8, 25])
->color('success'),

Stat::make('Total Divisi', $totalDivisi)
->description($totalPengumuman . ' Pengumuman Aktif')
->descriptionIcon('heroicon-m-squares-2x2')
->chart([2, 10, 3, 15, 4, 17, 7])
->color('warning'),
];
}
}