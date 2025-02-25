@extends('Home::layouts.master-profile')

@section('head-tag')
    {!! SEO::generate() !!}
@endsection

@section('content')
    <!-- start body -->
    <section class="">
        <section id="main-body-two-col" class="container-xxl body-container">
            <section class="row">
                @include('Home::layouts.partials.profile-sidebar')

                <main id="main-body" class="main-body col-md-9">
                    <section class="content-wrapper bg-white p-3 rounded-2 mb-2">

                        <!-- start content header -->
                        <section class="content-header">
                            <section class="d-flex justify-content-between align-items-center">
                                <h2 class="content-header-title">
                                    <span>تاریخچه سفارشات</span>
                                </h2>
                                <section class="content-header-link">
                                    <!--<a href="#">مشاهده همه</a>-->
                                </section>
                            </section>
                        </section>
                        <!-- end content header -->

                        <section class="d-flex justify-content-center my-4">
                            <a class="btn btn-outline-primary btn-sm mx-1"
                               href="{{ route('customer.profile.orders') }}">همه</a>
                            <a class="btn btn-info btn-sm mx-1"
                               href="{{ route('customer.profile.orders', 'type=0') }}">بررسی نشده</a>
                            <a class="btn btn-warning btn-sm mx-1"
                               href="{{ route('customer.profile.orders', 'type=1') }}">در انتظار تایید</a>
                            <a class="btn btn-success btn-sm mx-1"
                               href="{{ route('customer.profile.orders', 'type=2') }}">تایید نشده</a>
                            <a class="btn btn-danger btn-sm mx-1"
                               href="{{ route('customer.profile.orders', 'type=3') }}">تایید شده</a>
                            <a class="btn btn-outline-danger btn-sm mx-1"
                               href="{{ route('customer.profile.orders', 'type=4') }}">باطل شده</a>
                            <a class="btn btn-dark btn-sm mx-1"
                               href="{{ route('customer.profile.orders', 'type=5') }}">مرجوع شده</a>
                        </section>

                        <!-- start content header -->
                        <section class="content-header mb-3">
                            <section class="d-flex justify-content-between align-items-center">
                                <h2 class="content-header-title content-header-title-small">
                                    در انتظار پرداخت
                                </h2>
                                <section class="content-header-link">
                                    <!--<a href="#">مشاهده همه</a>-->
                                </section>
                            </section>
                        </section>
                        <!-- end content header -->

                        <section class="order-wrapper">
                            @forelse ($orders as $order)
                                <section class="order-item">
                                    <section class="d-flex justify-content-between">
                                        <section>
                                            <section class="order-item-date"><i class="fa fa-calendar-alt"></i>
                                                {{ $order->getFaCreatedDate() }}
                                            </section>
                                            <section class="order-item-id"><i class="fa fa-id-card-alt"></i>کد سفارش :
                                                {{ $order->getFaId() }}
                                            </section>
                                            <section class="order-item-status"><i class="fa fa-clock"></i>
                                                {{ $order->paymentStatusValue() }}
                                            </section>
                                            <section class="order-item-products">
                                                @foreach($order->orderItems as $orderItem)
                                                    @php
                                                        $product = $orderItem->singleProduct;
                                                    @endphp
                                                    <a href="{{ $product->path() }}"><img
                                                            src="{{ $product->imagePath() }}"
                                                            alt="{{ $product->name }}"
                                                            title="{{ $product->name }}"
                                                            data-bs-toggle="tooltip" data-bs-placement="top"></a>
                                                @endforeach
                                            </section>
                                        </section>
                                        <section class="d-flex flex-column gap-2">
                                            <section class="order-item-link"><a
                                                    class="btn btn-sm btn-outline-warning text-dark" href="#">پرداخت
                                                    سفارش</a></section>
                                            <section class="order-item-link"><a class="btn btn-sm btn-outline-info text-dark"
                                                    href="{{ route('order.received', $order->id) }}">جزئیات سفارش</a>
                                            </section>
                                        </section>

                                    </section>
                                </section>
                            @empty
                                <section class="order-item">
                                    <section class="d-flex justify-content-between">
                                        <p>سفارشی یافت نشد</p>
                                    </section>
                                </section>
                            @endforelse
                        </section>
                    </section>
                </main>
            </section>
        </section>
    </section>
    <!-- end body -->
@endsection
