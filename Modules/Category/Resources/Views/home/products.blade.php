@extends('Home::layouts.master-two-col')
@section('head-tag')
    <title>
        محصولات دسته بندی {{ $productCategory->name }}
    </title>
@endsection
@php
    $user = auth()->user();
@endphp
@section('content')
    <section class="content-wrapper bg-white p-3 rounded-2 mb-2">
        <section class="filters mb-3">
            <span class="d-inline-block border p-1 rounded bg-light">نتیجه جستجو برای : <span
                    class="badge bg-info text-dark">_</span></span>
            <span class="d-inline-block border p-1 rounded bg-light">برند : <span
                    class="badge bg-info text-dark">"کتاب"</span></span>
            <span class="d-inline-block border p-1 rounded bg-light">دسته : <span
                    class="badge bg-info text-dark">"کتاب"</span></span>
            <span class="d-inline-block border p-1 rounded bg-light">قیمت از : <span class="badge bg-info text-dark">25,000 تومان</span></span>
            <span class="d-inline-block border p-1 rounded bg-light">قیمت تا : <span class="badge bg-info text-dark">360,000 تومان</span></span>

        </section>
        <section class="sort ">
            <span>مرتب سازی بر اساس : </span>
            <a href="{{ route('customer.market.category.products', [$productCategory, 'type=newest']) }}"
               class="btn btn-info btn-sm px-1 py-0" type="button">جدیدترین</a>
            <a href="{{ route('customer.market.category.products', [$productCategory, 'type=popular']) }}"
               class="btn btn-light btn-sm px-1 py-0" type="button">محبوب ترین</a>
            <a href="{{ route('customer.market.category.products', [$productCategory, 'type=expensive']) }}"
               class="btn btn-light btn-sm px-1 py-0" type="button">گران ترین</a>
            <a href="{{ route('customer.market.category.products', [$productCategory, 'type=cheapest']) }}"
               class="btn btn-light btn-sm px-1 py-0" type="button">ارزان ترین</a>
            <a href="{{ route('customer.market.category.products', [$productCategory, 'type=mostVisited']) }}"
               class="btn btn-light btn-sm px-1 py-0" type="button">پربازدیدترین</a>
            <a href="{{ route('customer.market.category.products', [$productCategory, 'type=bestSales']) }}"
               class="btn btn-light btn-sm px-1 py-0" type="button">پرفروش ترین</a>
            <a href="{{ route('customer.market.category.products', [$productCategory]) }}"
               class="btn btn-light btn-sm px-1 py-0" type="button"><i class="fa fa-times mx-2 my-1 text-danger"></i>حذف
                فیلتر</a>
        </section>


        <section class="main-product-wrapper row my-4">

            @foreach($products as $product)
                <section class="col-md-3 p-0">
                    <section class="product">
                        @guest
                            <section class="product-add-to-favorite">
                                <button class="btn btn-light btn-sm text-decoration-none"
                                        data-url="{{ route('customer.market.add-to-favorite', $product) }}"
                                        data-bs-toggle="tooltip" data-bs-placement="left" title="اضافه از علاقه مندی">
                                    <i class="fa fa-heart"></i>
                                </button>
                            </section>
                        @endguest
                        @auth
                            <section class="product-add-to-cart">
                                @php
                                    $defaultSelectedColor = !empty($product->colors[0]) ? $product->colors[0]->id : null;
                                    $defaultSelectedGuarantee = !empty($product->guarantees[0]) ? $product->guarantees[0]->id : null;
                                    $productIsInCart = in_array($product->id, $userCartItemsProductIds);
                                @endphp
                                <form
                                    action="{{ route('customer.sales-process.add-to-cart', $product) }}"
                                    method="post" data-bs-toggle="tooltip"
                                    data-bs-placement="left"
                                    title="{{ $productIsInCart ? 'کالا در حال حاظر در سبد خرید شما موجود است' : 'افزودن به سبد خرید' }}">
                                    @csrf
                                    <input type="hidden" name="color_id"
                                           value="{{ $defaultSelectedColor }}">
                                    <input type="hidden" name="guarantee_id"
                                           value="{{ $defaultSelectedGuarantee }}">
                                    <input type="hidden" name="number" value="1">
                                    <button type="submit"
                                            class="btn btn-light btn-sm add-to-cart-btn {{ $productIsInCart ? 'text-danger' : '' }}">
                                        <i class="fa fa-cart-plus"></i>
                                    </button>
                                </form>
                            </section>
                            @if ($product->user->contains(auth()->user()->id))
                                <section class="product-add-to-favorite">
                                    <button class="btn btn-light btn-sm text-decoration-none"
                                            data-url="{{ route('customer.market.add-to-favorite', $product) }}"
                                            data-bs-toggle="tooltip" data-bs-placement="left" title="حذف از علاقه مندی">
                                        <i class="fa fa-heart text-danger"></i>
                                    </button>
                                </section>
                            @else
                                <section class="product-add-to-favorite">
                                    <button class="btn btn-light btn-sm text-decoration-none"
                                            data-url="{{ route('customer.market.add-to-favorite', $product) }}"
                                            data-bs-toggle="tooltip" data-bs-placement="left"
                                            title="اضافه به علاقه مندی">
                                        <i class="fa fa-heart"></i>
                                    </button>
                                </section>
                            @endif
                        @endauth
                        <a class="product-link" href="{{ $product->path() }}">
                            <section class="product-image">
                                <img class="" src="{{ $product->imagePath() }}"
                                     alt="{{ $product->name }}">
                            </section>
                            <section class="product-colors"></section>
                            <section class="product-name"><h3>{{ $product->limitedName() }}</h3></section>
                            <section class="product-price-wrapper">
                                @if($product->activeAmazingSales())
                                    <section class="product-discount">
                                        <span class="product-old-price">{{ $product->getActualFaPrice() }}</span>
                                        <span
                                            class="product-discount-amount">{{ $product->getFaAmazingSalesPercentage() }}</span>
                                    </section>
                                    <section class="product-price">{{ $product->getFinalFaPrice() }}</section>
                                @else
                                    <section class="product-price">{{ $product->getActualFaPrice() }}</section>
                                @endif
                            </section>
                            <section class="product-colors">
                                @foreach ($product->colors()->get() as $color)
                                    <section class="product-colors-item"
                                             style="background-color: {{ $color->color }};"></section>
                                @endforeach
                            </section>
                        </a>
                    </section>
                </section>
                <section class="pt-3">{{ $products->links() }}</section>
            @endforeach



            @if(count($products) > 20)
                <section class="col-12">
                    <section class="my-4 d-flex justify-content-center">
                        <nav>
                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </section>
                </section>
            @endif
        </section>

    </section>
@endsection
@section('script')
    @include('Share::ajax-functions.product-add-to-favorite')
@endsection
