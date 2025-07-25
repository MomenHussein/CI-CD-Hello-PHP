<?php

use Illuminate\Support\Facades\Route;

// كل الروابط توجه لملف index.html الخاص بـ React
Route::get('/{any}', function () {
    return file_get_contents(public_path('react-app/build/index.html'));
})->where('any', '.*');
