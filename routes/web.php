<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/daftar-ukm', function () {
    return view('daftar-ukm');
})->name('daftar.ukm');
