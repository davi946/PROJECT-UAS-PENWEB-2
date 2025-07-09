<?php

namespace App\Filament\Widgets;

use App\Models\Pendaftar;
use Filament\Widgets\ChartWidget;

class UkmPendaftarChart extends ChartWidget
{
    protected static ?string $heading = 'Status Pendaftar UKM';
    protected static ?int $sort = 2;

    public static function canView(): bool
    {
        return auth()->user()->isUkmAdmin();
    }

    protected function getData(): array
    {
        $user = auth()->user();
        $ukmId = $user->ukm_id;

        $pending = Pendaftar::where('ukm_id', $ukmId)
            ->where('status', 'pending')->count();
        $diterima = Pendaftar::where('ukm_id', $ukmId)
            ->where('status', 'diterima')->count();
        $ditolak = Pendaftar::where('ukm_id', $ukmId)
            ->where('status', 'ditolak')->count();

        return [
            'datasets' => [
                [
                    'data' => [$pending, $diterima, $ditolak],
                    'backgroundColor' => [
                        'rgb(234, 179, 8)',
                        'rgb(34, 197, 94)',
                        'rgb(239, 68, 68)',
                    ],
                ],
            ],
            'labels' => ['Pending', 'Diterima', 'Ditolak'],
        ];
    }

    protected function getType(): string
    {
        return 'doughnut';
    }
}