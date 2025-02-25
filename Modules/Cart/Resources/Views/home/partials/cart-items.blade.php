<!-- start cart -->
<section class="mb-4">
    <section class="container-xxl">
        <section class="row">
            <section class="col">
                <!-- start content header -->
                <section class="content-header">
                    <section class="d-flex justify-content-between align-items-center">
                        <h2 class="content-header-title">
                            <span>سبد خرید شما</span>
                        </h2>
                        <section class="content-header-link">
                            <!--<a href="#">مشاهده همه</a>-->
                        </section>
                    </section>
                </section>

                <section class="row mt-4">
                    <section class="col-md-9 mb-3">
                        <form action="" id="cart_items" method="post"
                              class="content-wrapper bg-white p-3 rounded-2">
                            @csrf
                            @php
                                $totalProductPrice = 0;
                                $totalDiscount = 0;
                            @endphp

                            @foreach ($cartItems as $cartItem)
                                @php
                                    $totalProductPrice += $cartItem->cartItemProductPrice();
                                    $totalDiscount += $cartItem->cartItemProductDiscount();
                                @endphp

                                <section class="cart-item d-md-flex py-3">
                                    <section class="cart-img align-self-start flex-shrink-1">
                                        <a href="{{ $cartItem->product->path() }}">
                                            <img src="{{ $cartItem->getProductImagePath() }}"
                                                 alt="{{ $cartItem->getProductName() }}"
                                                 title="{{ $cartItem->product->getTagLessIntroduction() }}"
                                                 data-bs-toggle="tooltip"
                                                 data-bs-placement="top">
                                        </a>
                                    </section>
                                    <section class="align-self-start w-100">
                                        <section class="d-flex">
                                            <p class="fw-bold me-3">{{ $cartItem->getProductName() }}</p>
                                            <section class="product-rate">
                                                <span class="text-muted">(</span>
                                                <span><i class="fa fa-star text-yellow" title="محبوبیت"
                                                         data-bs-toggle="tooltip"
                                                         data-bs-placement="top"></i></span>
                                                <strong
                                                    class="text-muted">{{ $cartItem->product->getFaProductRating() }}</strong>
                                                <span class="text-muted">)</span>
                                            </section>
                                        </section>
                                        <p>
                                            @if (!empty($cartItem->color))
                                                <span style="background-color: {{ $cartItem->color->getColorCode() }};"
                                                      class="cart-product-selected-color me-1"
                                                      title="افزایش قیمت : {{ $cartItem->color->getFaPriceIncrease() }}"
                                                      data-bs-toggle="tooltip"
                                                      data-bs-placement="top">
                                                </span>
                                                <span title="رنگ"
                                                      data-bs-toggle="tooltip"
                                                      data-bs-placement="top">{{ $cartItem->color->getColorName() }}</span>
                                            @else
                                                <span>رنگ منتخب وجود ندارد</span>
                                            @endif
                                        </p>
                                        <p>
                                            @if (!empty($cartItem->guarantee))
                                                <i class="fa fa-shield-alt cart-product-selected-warranty me-1"
                                                   title="افزایش قیمت : {{ $cartItem->guarantee->getFaPriceIncrease() }}"
                                                   data-bs-toggle="tooltip"
                                                   data-bs-placement="top"></i>
                                                <span title="گارانتی"
                                                      data-bs-toggle="tooltip"
                                                      data-bs-placement="top">{{ $cartItem->guarantee->getFaFullName() }}</span>
                                            @else
                                                <i class="fa fa-shield-alt cart-product-selected-warranty me-1"></i>
                                                <span title="گارانتی"
                                                      data-bs-toggle="tooltip"
                                                      data-bs-placement="top"> گارانتی ندارد</span>
                                            @endif
                                        </p>
                                        <p><i class="fa fa-store-alt cart-product-selected-store me-1"></i> <span>کالا
                                                    موجود در انبار</span></p>
                                        <section>
                                            <section class="cart-product-number d-inline-block ">
                                                <button class="cart-number cart-number-down" type="button">-
                                                </button>
                                                <input class="number" name="number[{{ $cartItem->id }}]"
                                                       data-product-price={{ $cartItem->cartItemProductPrice() }}
                                                        data-product-discount={{ $cartItem->cartItemProductDiscount() }}
                                                        type="number" min="1" max="5" step="1"
                                                       value="{{ $cartItem->number }}" readonly="readonly">
                                                <button class="cart-number cart-number-up" type="button">+</button>
                                            </section>
                                            {{--                                            <button class="btn btn-light btn-sm text-muted p-1"--}}
                                            {{--                                                    onclick="document.getElementById('delete-cart-item-form').submit();"><i class="fa fa-trash-alt"></i> حذف از سبد</button>--}}
                                            <a class="text-decoration-none ms-4 cart-delete"
                                               {{--                                               id="delete-{{ $cartItem->id }}"--}}
                                               href="{{ route('customer.sales-process.remove-from-cart', $cartItem) }}"><i
                                                    class="fa fa-trash-alt"></i> حذف از سبد</a>
                                            {{--                                            <a class="d-none" id="delete-route-{{ $cartItem->id }}"--}}
                                            {{--                                               href="">--}}
                                            {{--                                            </a>--}}
                                        </section>

                                    </section>
                                    <section class="align-self-end flex-shrink-1">
                                        @if ($cartItem->hasActiveAmazingSale())
                                            <section class="cart-item-discount text-danger text-nowrap mb-1">تخفیف :
                                                {{ $cartItem->getFaProductDiscount() }}</section>
                                        @endif
                                        <section class="text-nowrap fw-bold">
                                            {{ $cartItem->getFaProductPrice() }}
                                        </section>
                                    </section>
                                </section>
                            @endforeach


                        </form>
                        <form action="{{ route('customer.sales-process.remove-from-cart', $cartItem) }}"
                              id="delete-cart-item-form">

                        </form>
                    </section>
                    <section class="col-md-3">
                        <x-home-cart-price :cartItems="$cartItems" formId="cart_items"
                                           buttonText="انتخاب آدرس و روش ارسال کالا"/>
                    </section>
                </section>
            </section>
        </section>

    </section>
</section>
<!-- end cart -->
