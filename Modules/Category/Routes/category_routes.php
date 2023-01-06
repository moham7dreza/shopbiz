<?php

use Illuminate\Support\Facades\Route;
use Modules\Category\Http\Controllers\ProductCategoryController;
use Modules\Category\Http\Controllers\PropertyValueController;

/*
|--------------------------------------------------------------------------
| Panel routes
|--------------------------------------------------------------------------
|
| Here you can see panel routes.
|
*/

Route::group(['prefix' => 'panel', 'middleware' => 'auth'], static function ($router) {
    $router->resource('product-category', 'ProductCategoryController', ['except' => 'show']);
    $router->resource('post-category', 'PostCategoryController', ['except' => 'show']);
    $router->resource('category-property', 'PropertyController');

    Route::prefix('property')->group(static function () {
        Route::get('/value/{categoryAttribute}', [PropertyValueController::class, 'index'])->name('property-value.index');
        Route::get('/value/create/{categoryAttribute}', [PropertyValueController::class, 'create'])->name('property-value.create');
        Route::post('/value/store/{categoryAttribute}', [PropertyValueController::class, 'store'])->name('property-value.store');
        Route::get('/value/edit/{categoryAttribute}/{value}', [PropertyValueController::class, 'edit'])->name('property-value.edit');
        Route::put('/value/update/{categoryAttribute}/{value}', [PropertyValueController::class, 'update'])->name('property-value.update');
        Route::delete('/value/destroy/{categoryAttribute}/{value}', [PropertyValueController::class, 'destroy'])->name('property-value.destroy');
    });
});
