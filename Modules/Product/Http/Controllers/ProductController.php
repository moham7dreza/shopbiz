<?php

namespace Modules\Product\Http\Controllers;

use Modules\Share\Http\Controllers\Controller;

class ProductController extends Controller
{
    public function index()
    {
        dd(1);
        return view('Product::index');
    }

    public function show($id)
    {
dd('show');
    }
}
