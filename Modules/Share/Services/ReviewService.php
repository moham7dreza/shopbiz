<?php

namespace Modules\Share\Services;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Modules\Product\Entities\Product;
use Modules\Share\Entities\Review;

class ReviewService
{
    /**
     * @param $model
     * @param $rate
     * @return void
     */
    public function store($model, $rate): void
    {
        $review = Review::query()->where([
            ['user_id', auth()->id()],
            ['reviewable_id', $model->id],
            ['reviewable_type', get_class($model)],
        ])->first();
        if ($review) {
            Review::query()->where([
                ['user_id', auth()->id()],
                ['reviewable_id', $model->id],
                ['reviewable_type', get_class($model)],
            ])->update(['rate' => $rate]);
            $review->refresh();
        } else {
            $review = new Review();
            $review->user_id = auth()->id();
            $review->reviewable_id = $model->id;
            $review->reviewable_type = get_class($model);
            $review->save();
        }
        $rating = $model->calculateRate();
        $product = Product::query()->where('id', $model->id)->first();
        if ($product) {
            Product::query()->where('id', $model->id)->update(['rating' => $rating]);
            $product->refresh();
        }
//        $this->query()->create([
//           'user_id' => auth()->id(),
//            'commentable_id' => $model->id,
//            'commentable_type' => get_class($model),
//            'rate' => $rate,
//        ]);
    }

    /**
     * @return Builder
     */
    private function query(): Builder
    {
        return Review::query();
    }
}
