<?php
use Illuminate\Support\Facades\File;
use App\Http\Controllers\mobile\auth_controller;
use App\Http\Controllers\mobile\categories_controller;
use App\Http\Controllers\mobile\favorite_controller;
use App\Http\Controllers\mobile\movie_controller;
use App\Http\Controllers\mobile\slider_controller;
use App\Http\Controllers\mobile\subcategories_controller;
use Illuminate\Support\Facades\Route;
Route::post('/login', [auth_controller::class, 'login']);
Route::post('/register', [auth_controller::class, 'register']);
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user',[auth_controller::class,'user']);
    Route::post('/user/profile',[auth_controller::class,'profile']);
    Route::post('/user/changes_password',[auth_controller::class,'changes_password']);
    Route::post('/user/logout',[auth_controller::class,'logout']);
    Route::get('/slider', [slider_controller::class, 'index']);
    Route::get('/categories', [categories_controller::class, 'index']);
    Route::get('/subcategories/{id}', [subcategories_controller::class, 'index']);
    Route::get('/movie', [movie_controller::class, 'index']);
    Route::get('/movie/{id}', [movie_controller::class, 'movie_id']);
    Route::get('/movie/detail/{id}', [movie_controller::class, 'detail']);
    Route::get('/favorite', [favorite_controller::class, 'index']);
    Route::get('/favorite/remove/{id}', [favorite_controller::class, 'remove']);
});
