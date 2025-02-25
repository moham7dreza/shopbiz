<?php

use Illuminate\Support\Facades\Route;
use Modules\Brand\Http\Controllers\BrandController;
use Modules\Brand\Http\Controllers\Home\BrandController as HomeBrandController;

/*
|--------------------------------------------------------------------------
| Panel routes
|--------------------------------------------------------------------------
|
| Here you can see panel routes.
|
*/

Route::group(['prefix' => 'panel/', 'middleware' => 'auth'], static function ($router) {
    $router->resource('brand', 'BrandController', ['except' => 'show']);
    Route::get('brand/status/{brand}', [BrandController::class, 'status'])->name('brand.status');

    // tags
    Route::get('brand/tags-form/{brand}', [BrandController::class, 'tagsForm'])->name('brand.tags-from');
    Route::put('brand/tags-sync/{brand}', [BrandController::class, 'setTags'])->name('brand.tags.sync');
});
// products of special brand
Route::get('/brand/{brand:slug}/products', [HomeBrandController::class, 'brandProducts'])->name('customer.market.brand.products');
