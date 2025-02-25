<?php

namespace Modules\Brand\Entities;

use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Product\Entities\Product;
use Modules\Share\Traits\HasDefaultStatus;
use Modules\Share\Traits\HasFaDate;
use Modules\Share\Traits\HasImageTrait;
use Spatie\Tags\HasTags;

class Brand extends Model
{
    use HasFactory, SoftDeletes, Sluggable, HasFaDate, HasDefaultStatus, HasTags;

    /**
     * @return array[]
     */
    public function sluggable(): array
    {
        return[
            'slug' =>[
                'source' => 'original_name'
            ]
        ];
    }

    /**
     * @var string[]
     */
    protected $casts = ['logo' => 'array'];


    /**
     * @var string[]
     */
    protected $fillable = ['persian_name', 'original_name', 'slug', 'logo', 'status'];

    // ********************************************* Relations

    /**
     * @return HasMany
     */
    public function products(): HasMany
    {
        return $this->hasMany(Product::class);
    }

    // ********************************************* Methods

    // ********************************************* paths

    /**
     * @return string
     */
    public function path(): string
    {
        return route('customer.market.brand.products', $this->slug);
    }

    /**
     * @return string
     */
    public function logo(): string
    {
        return asset($this->logo);
    }

    // ********************************************* FA Properties
}
