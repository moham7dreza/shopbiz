<?php

namespace Modules\Product\Http\Controllers\Home;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Modules\Product\Entities\Product;
use Modules\Share\Http\Controllers\Controller;

class ProductController extends Controller
{
    public function product(Product $product)
    {
        $relatedProducts = Product::all();
        return view('Product::home.product', compact('product', 'relatedProducts'));
    }

    public function addComment(Product $product, Request $request)
    {
        $request->validate([
            'body' => 'required|max:2000'
        ]);

        $inputs['body'] = str_replace(PHP_EOL, '<br/>', $request->body);
        $inputs['author_id'] = Auth::user()->id;
        $inputs['commentable_id'] = $product->id;
        $inputs['commentable_type'] = Product::class;
        Comment::create($inputs);
        return back();
    }


    public function addToFavorite(Product $product)
    {
       if(Auth::check())
       {
        $product->user()->toggle([Auth::user()->id]);
        if($product->user->contains(Auth::user()->id)){
            return response()->json(['status' => 1]);
        }
        else{
            return response()->json(['status' => 2]);
        }
       }
       else{
        return response()->json(['status' => 3]);
       }
    }
}
