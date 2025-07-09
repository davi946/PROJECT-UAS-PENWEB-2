<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PendaftarResource\Pages;
use App\Models\Pendaftar;
use App\Models\Ukm;
use App\Models\Divisi;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Forms\Components\Select;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Actions\Action;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Columns\ImageColumn;

class PendaftarResource extends Resource
{
    protected static ?string $model = Pendaftar::class;
    protected static ?string $navigationIcon = 'heroicon-o-user-group';
    protected static ?string $navigationLabel = 'Pendaftar';
    protected static ?int $navigationSort = 3;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Data Pribadi')
                    ->schema([
                        Forms\Components\TextInput::make('nama_lengkap')
                            ->label('Nama Lengkap')
                            ->required()
                            ->maxLength(100),

                        Forms\Components\TextInput::make('nim')
                            ->label('NIM')
                            ->required()
                            ->maxLength(20)
                            ->unique(ignoreRecord: true),

                        Forms\Components\TextInput::make('email')
                            ->label('Email')
                            ->email()
                            ->required()
                            ->maxLength(100),

                        Forms\Components\TextInput::make('no_telp')
                            ->label('No. Telepon')
                            ->required()
                            ->maxLength(20),

                        Forms\Components\Select::make('jenis_kelamin')
                            ->label('Jenis Kelamin')
                            ->options([
                                'L' => 'Laki-laki',
                                'P' => 'Perempuan',
                            ])
                            ->required(),

                        Forms\Components\DatePicker::make('tanggal_lahir')
                            ->label('Tanggal Lahir')
                            ->required(),

                        Forms\Components\Textarea::make('alamat')
                            ->label('Alamat')
                            ->required()
                            ->rows(3),
                    ])
                    ->columns(2),

                Forms\Components\Section::make('Data Akademik')
                    ->schema([
                        Forms\Components\TextInput::make('angkatan')
                            ->label('Angkatan')
                            ->required()
                            ->maxLength(10),

                        Forms\Components\TextInput::make('program_studi')
                            ->label('Program Studi')
                            ->required()
                            ->maxLength(100),
                    ])
                    ->columns(2),

                Forms\Components\Section::make('Data Pendaftaran')
                    ->schema([
                        Forms\Components\Select::make('ukm_id')
                            ->label('UKM')
                            ->relationship('ukm', 'nama_ukm')
                            ->required()
                            ->reactive()
                            ->afterStateUpdated(fn(callable $set) => $set('divisi_id', null)),

                        Forms\Components\Select::make('divisi_id')
                            ->label('Divisi')
                            ->relationship('divisi', 'nama_divisi')
                            ->required(),

                        Forms\Components\Textarea::make('alasan_bergabung')
                            ->label('Alasan Bergabung')
                            ->required()
                            ->rows(4),

                            Forms\Components\FileUpload::make('foto_path')
                            ->label('Foto')
                            ->disk('public')              // gunakan storage disk public
                            ->directory('fotos')          // folder di storage/app/public/fotos
                            ->image()                     // memastikan hanya file gambar
                            ->imageEditor()               // editor gambar bawaan
                            ->required(),
                        

                        Forms\Components\Select::make('status')
                            ->label('Status')
                            ->options([
                                'pending' => 'Pending',
                                'diterima' => 'Diterima',
                                'ditolak' => 'Ditolak',
                            ])
                            ->default('pending')
                            ->required(),

                        Forms\Components\Textarea::make('keterangan')
                            ->label('Keterangan')
                            ->rows(2),
                    ])
                    ->columns(2),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('foto_path')
    ->label('Foto')
    ->disk('public')
    ->getStateUsing(function ($record) {
        \Log::info('Foto path: ' . $record->foto_path);
        return $record->foto_path;
    })
    ->circular()
    ->height(60)
    ->width(60),

                Tables\Columns\TextColumn::make('nama_lengkap')
                    ->label('Nama Lengkap')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('nim')
                    ->label('NIM')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('ukm.nama_ukm')
                    ->label('UKM')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('divisi.nama_divisi')
                    ->label('Divisi')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('program_studi')
                    ->label('Prodi')
                    ->searchable()
                    ->toggleable(),

                Tables\Columns\TextColumn::make('angkatan')
                    ->label('Angkatan')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\SelectColumn::make('status')
                    ->label('Status')
                    ->options([
                        'pending' => 'Pending',
                        'diterima' => 'Diterima',
                        'ditolak' => 'Ditolak',
                    ])
                    ->selectablePlaceholder(false),

                Tables\Columns\TextColumn::make('tanggal_daftar')
                    ->label('Tanggal Daftar')
                    ->dateTime()
                    ->sortable(),
            ])
            ->filters([
                SelectFilter::make('ukm_id')
                    ->label('UKM')
                    ->relationship('ukm', 'nama_ukm'),

                SelectFilter::make('divisi_id')
                    ->label('Divisi')
                    ->relationship('divisi', 'nama_divisi'),

                SelectFilter::make('status')
                    ->label('Status')
                    ->options([
                        'pending' => 'Pending',
                        'diterima' => 'Diterima',
                        'ditolak' => 'Ditolak',
                    ]),

                SelectFilter::make('angkatan')
                    ->label('Angkatan')
                    ->options(function () {
                        return Pendaftar::distinct()->pluck('angkatan', 'angkatan')->toArray();
                    }),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),

                Action::make('approve')
                    ->label('Terima')
                    ->icon('heroicon-o-check')
                    ->color('success')
                    ->requiresConfirmation()
                    ->action(function (Pendaftar $record) {
                        $record->update(['status' => 'diterima']);
                    })
                    ->visible(fn(Pendaftar $record) => $record->status === 'pending'),

                Action::make('reject')
                    ->label('Tolak')
                    ->icon('heroicon-o-x-mark')
                    ->color('danger')
                    ->requiresConfirmation()
                    ->form([
                        Forms\Components\Textarea::make('keterangan')
                            ->label('Alasan Penolakan')
                            ->required(),
                    ])
                    ->action(function (Pendaftar $record, array $data) {
                        $record->update([
                            'status' => 'ditolak',
                            'keterangan' => $data['keterangan'],
                        ]);
                    })
                    ->visible(fn(Pendaftar $record) => $record->status === 'pending'),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->defaultSort('tanggal_daftar', 'desc');
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPendaftars::route('/'),
            'create' => Pages\CreatePendaftar::route('/create'),
            'view' => Pages\ViewPendaftar::route('/{record}'),
            'edit' => Pages\EditPendaftar::route('/{record}/edit'),
        ];
    }
}