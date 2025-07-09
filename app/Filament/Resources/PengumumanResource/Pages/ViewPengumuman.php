<?php

namespace App\Filament\Resources\PengumumanResource\Pages;

use App\Filament\Resources\PengumumanResource;
use Filament\Actions;
use Filament\Resources\Pages\ViewRecord;
use Filament\Infolists\Infolist;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Components\Section;
use Filament\Infolists\Components\IconEntry;

class ViewPengumuman extends ViewRecord
{
    protected static string $resource = PengumumanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\EditAction::make(),
        ];
    }

    public function infolist(Infolist $infolist): Infolist
    {
        return $infolist
            ->schema([
                Section::make('Informasi Pengumuman')
                    ->schema([
                        TextEntry::make('judul')
                            ->label('Judul'),
                        TextEntry::make('konten')
                            ->label('Konten')
                            ->markdown(), // kalau pakai RichEditor sebaiknya markdown
                        TextEntry::make('ukm.nama_ukm')
                            ->label('UKM'),
                        TextEntry::make('user.name')
                            ->label('Dibuat Oleh'),
                        TextEntry::make('tanggal_mulai')
                            ->label('Tanggal Mulai')
                            ->date(),
                        TextEntry::make('tanggal_selesai')
                            ->label('Tanggal Selesai')
                            ->date(),
                        IconEntry::make('is_active')
                            ->label('Aktif')
                            ->boolean(),
                        TextEntry::make('created_at')
                            ->label('Dibuat')
                            ->dateTime(),
                    ])
            ]);
    }
}
