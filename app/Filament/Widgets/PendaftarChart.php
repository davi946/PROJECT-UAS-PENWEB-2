<?php

namespace App\Filament\Widgets;

use App\Models\Pendaftar;
use Filament\Widgets\ChartWidget;
use Illuminate\Support\Carbon;

class PendaftarChart extends ChartWidget
{
    protected static ?string $heading = 'Grafik Pendaftar per Bulan';
    protected static ?int $sort = 2;

    public static function canView(): bool
    {
        return auth()->user()->isAdmin();
    }

    protected function getData(): array
    {
        $data = [];
        $labels = [];

        // Ambil data 6 bulan terakhir
        for ($i = 5; $i >= 0; $i--) {
            $month = Carbon::now()->subMonths($i);
            $labels[] = $month->format('M Y');

            $count = Pendaftar::whereYear('tanggal_daftar', $month->year)
                ->whereMonth('tanggal_daftar', $month->month)
                ->count();

            $data[] = $count;
        }

        return [
            'datasets' => [
                [
                    'label' => 'Pendaftar',
                    'data' => $data,
                    'borderColor' => 'rgb(59, 130, 246)',
                    'backgroundColor' => 'rgba(59, 130, 246, 0.1)',
                    'fill' => true,
                ],
            ],
            'labels' => $labels,
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }
}