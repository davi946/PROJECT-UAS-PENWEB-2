<?php

namespace App\Filament\Pages;

use App\Filament\Widgets\AdminStatsOverview;
use App\Filament\Widgets\UkmAdminStatsOverview;
use App\Filament\Widgets\PendaftarChart;
use App\Filament\Widgets\UkmPendaftarChart;
use App\Filament\Widgets\LatestPendaftarTable;
use App\Filament\Widgets\UkmPendaftarTable;
use App\Filament\Widgets\UkmPengumumanTable;
use Filament\Pages\Dashboard as BaseDashboard;

class Dashboard extends BaseDashboard
{
    protected static ?string $title = 'Dashboard';
    protected static ?string $navigationLabel = 'Dashboard';
    protected static ?string $navigationIcon = 'heroicon-o-home';

    public function getWidgets(): array
    {
        $user = auth()->user();
        
        if ($user->isAdmin()) {
            return [
                AdminStatsOverview::class,
                PendaftarChart::class,
                LatestPendaftarTable::class,
            ];
        } elseif ($user->isUkmAdmin()) {
            return [
                UkmAdminStatsOverview::class,
                UkmPendaftarChart::class,
                UkmPendaftarTable::class,
                UkmPengumumanTable::class,
            ];
        }

        return [];
    }

    public function getColumns(): int | string | array
    {
        return 2;
    }
}