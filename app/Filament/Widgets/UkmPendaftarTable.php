<?php

namespace App\Filament\Widgets;

use App\Models\Pendaftar;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;

class UkmPendaftarTable extends BaseWidget
{
    protected static ?string $heading = 'Pendaftar UKM Terbaru';
    protected static ?int $sort = 3;
    protected int|string|array $columnSpan = 'full';

    public static function canView(): bool
    {
        return auth()->user()->isUkmAdmin();
    }

    public function table(Table $table): Table
    {
        $user = auth()->user();

        return $table
            ->query(
                Pendaftar::query()
                    ->with(['divisi'])
                    ->where('ukm_id', $user->ukm_id)
                    ->latest('tanggal_daftar')
                    ->limit(5)
            )
            ->columns([
                Tables\Columns\ImageColumn::make('foto_path')
                    ->label('Foto')
                    ->circular()
                    ->size(40),

                Tables\Columns\TextColumn::make('nama_lengkap')
                    ->label('Nama')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('nim')
                    ->label('NIM')
                    ->searchable(),

                Tables\Columns\TextColumn::make('program_studi')
                    ->label('Prodi')
                    ->limit(20),

                Tables\Columns\TextColumn::make('divisi.nama_divisi')
                    ->label('Divisi')
                    ->badge()
                    ->color('success'),

                Tables\Columns\TextColumn::make('status')
                    ->label('Status')
                    ->badge()
                    ->color(fn(string $state): string => match ($state) {
                        'pending' => 'warning',
                        'diterima' => 'success',
                        'ditolak' => 'danger',
                    }),

                Tables\Columns\TextColumn::make('tanggal_daftar')
                    ->label('Tanggal Daftar')
                    ->since()
                    ->sortable(),
            ])
            ->actions([
                Tables\Actions\Action::make('view')
                    ->label('Lihat')
                    ->icon('heroicon-o-eye')
                    ->url(fn(Pendaftar $record): string => route('filament.adminku.resources.pendaftars.view', $record)),

                Tables\Actions\Action::make('approve')
                    ->label('Terima')
                    ->icon('heroicon-o-check')
                    ->color('success')
                    ->action(fn(Pendaftar $record) => $record->update(['status' => 'diterima']))
                    ->visible(fn(Pendaftar $record) => $record->status === 'pending'),

                Tables\Actions\Action::make('reject')
                    ->label('Tolak')
                    ->icon('heroicon-o-x-mark')
                    ->color('danger')
                    ->action(fn(Pendaftar $record) => $record->update(['status' => 'ditolak']))
                    ->visible(fn(Pendaftar $record) => $record->status === 'pending'),
            ]);
    }
}