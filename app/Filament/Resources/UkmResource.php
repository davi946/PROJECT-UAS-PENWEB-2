<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UkmResource\Pages;
use App\Models\Ukm;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Toggle;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Actions\Action;
use Illuminate\Database\Eloquent\Builder;

class UkmResource extends Resource
{
    protected static ?string $model = Ukm::class;
    protected static ?string $navigationIcon = 'heroicon-o-building-office-2';
    protected static ?string $navigationLabel = 'UKM';
    protected static ?string $modelLabel = 'UKM';
    protected static ?string $pluralModelLabel = 'UKM';
    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Informasi UKM')
                    ->schema([
                        TextInput::make('nama_ukm')
                            ->label('Nama UKM')
                            ->required()
                            ->maxLength(100),

                        Textarea::make('deskripsi')
                            ->label('Deskripsi')
                            ->required()
                            ->rows(4),

                        TextInput::make('ketua_ukm')
                            ->label('Ketua UKM')
                            ->required()
                            ->maxLength(100),

                        TextInput::make('max_anggota')
                            ->label('Maksimal Anggota')
                            ->required()
                            ->numeric()
                            ->minValue(1),

                        FileUpload::make('logo_path')
                            ->label('Logo UKM')
                            ->image()
                            ->directory('logos')
                            ->imageEditor(),

                        Toggle::make('is_active')
                            ->label('Status Aktif')
                            ->default(true),
                    ])
                    ->columns(2),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                ImageColumn::make('logo_path')
                    ->label('Logo')
                    ->circular()
                    ->size(50),

                TextColumn::make('nama_ukm')
                    ->label('Nama UKM')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('ketua_ukm')
                    ->label('Ketua UKM')
                    ->searchable(),

                TextColumn::make('max_anggota')
                    ->label('Maks Anggota')
                    ->numeric()
                    ->sortable(),

                    TextColumn::make('total_pendaftar')
                    ->label('Total Pendaftar')
                    ->badge()
                    ->color('info'),
                
                TextColumn::make('pendaftar_diterima')
                    ->label('Diterima')
                    ->badge()
                    ->color('success'),

                IconColumn::make('is_active')
                    ->label('Status')
                    ->boolean()
                    ->trueIcon('heroicon-o-check-circle')
                    ->falseIcon('heroicon-o-x-circle')
                    ->trueColor('success')
                    ->falseColor('danger'),

                TextColumn::make('created_at')
                    ->label('Dibuat')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                Filter::make('active')
                    ->query(fn(Builder $query): Builder => $query->where('is_active', true))
                    ->label('Hanya Aktif'),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListUkms::route('/'),
            'create' => Pages\CreateUkm::route('/create'),
            'edit' => Pages\EditUkm::route('/{record}/edit'),
        ];
    }

    public static function canAccess(): bool
    {
        return auth()->user()?->role === 'admin';
    }

    public static function shouldRegisterNavigation(): bool
    {
        return auth()->user()?->role === 'admin';
    }
}