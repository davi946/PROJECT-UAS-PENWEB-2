<?php

namespace App\Filament\Widgets;

use App\Models\Pengumuman;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;

class UkmPengumumanTable extends BaseWidget
{
    protected static ?string $heading = 'Pengumuman Terbaru';
    protected static ?int $sort = 4;
    protected int | string | array $columnSpan = 'full';

    public static function canView(): bool
    {
        return auth()->user()->isUkmAdmin();
    }

    public function table(Table $table): Table
    {
        $user = auth()->user();
        
        return $table
            ->query(
                Pengumuman::query()
                    ->where('ukm_id', $user->ukm_id)
                    ->latest('created_at')
                    ->limit(3)
            )
            ->columns([
                Tables\Columns\TextColumn::make('judul')
                    ->label('Judul')
                    ->searchable()
                    ->sortable()
                    ->limit(50),

                Tables\Columns\TextColumn::make('tanggal_mulai')
                    ->label('Mulai')
                    ->date()
                    ->sortable(),

                Tables\Columns\TextColumn::make('tanggal_selesai')
                    ->label('Selesai')
                    ->date()
                    ->sortable(),

                Tables\Columns\IconColumn::make('is_active')
                    ->label('Status')
                    ->boolean()
                    ->trueIcon('heroicon-o-check-circle')
                    ->falseIcon('heroicon-o-x-circle')
                    ->trueColor('success')
                    ->falseColor('danger'),
                    
            ])
            ->actions([
                Tables\Actions\Action::make('view')
                    ->label('Lihat')
                    ->icon('heroicon-o-eye')
                    ->url(fn (Pengumuman $record): string => route('filament.adminku.resources.pengumumen.view', $record)),
            ]);
    }
}
