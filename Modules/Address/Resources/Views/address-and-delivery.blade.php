@extends('Home::layouts.master-one-col')

@section('head-tag')
    <title>مدیریت آدرس ها</title>
@endsection


@section('content')

    <!-- start cart -->
    <section class="mb-4">
        <section class="container-xxl">

{{--            notifs--}}
            @if(session('success'))
                <div class="alert alert-success">
                    {{ session('success') }}
                </div>
            @endif

            @if(session('danger'))
                <div class="alert alert-danger">
                    {{ session('danger') }}
                </div>
            @endif

            @if(session('info'))
                <div class="alert alert-info">
                    {{ session('info') }}
                </div>
            @endif

            <section class="row">
                <section class="col">
                    <!-- start content header -->
                    <section class="content-header">
                        <section class="d-flex justify-content-between align-items-center">
                            <h2 class="content-header-title">
                                <span>تکمیل اطلاعات ارسال کالا (آدرس گیرنده، مشخصات گیرنده، نحوه ارسال) </span>
                            </h2>
                            <section class="content-header-link">
                                <!--<a href="#">مشاهده همه</a>-->
                            </section>
                        </section>
                    </section>

                    <section class="row mt-4">

                        @if ($errors->any())
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li class="alert alert-danger list-style-none">{{ $error }}</li>
                                @endforeach
                            </ul>
                        @endif

                        <section class="col-md-9">
                            @include('Address::partials.address-select')

                            @include('Address::partials.delivery-select')

                        </section>

                        @include('Address::partials.checkout')
                    </section>
                </section>
            </section>

        </section>
    </section>
    <!-- end cart -->

@endsection


@section('script')
    @include('Address::partials.scripts')
@endsection
