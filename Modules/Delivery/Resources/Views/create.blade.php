@extends('Panel::layouts.master')

@section('head-tag')
    <title> ایجاد روش ارسال</title>
    @livewireStyles
@endsection

@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item font-size-16"><a href="{{ route('panel.home') }}">خانه</a></li>
            <li class="breadcrumb-item font-size-16"><a href="#">بخش فروش</a></li>
            <li class="breadcrumb-item font-size-16"><a href="{{ route('delivery.index') }}"> روش های ارسال</a></li>
            <li class="breadcrumb-item font-size-16 active" aria-current="page"> ایجاد روش ارسال</li>
        </ol>
    </nav>


    <section class="row">
        <section class="col-12">
            <section class="main-body-container">
                <section class="main-body-container-header">
                    <h5>
                        ایجاد روش ارسال
                    </h5>
                </section>

                <section class="d-flex justify-content-between align-items-center mt-4 mb-3 border-bottom pb-2">
                    <a href="{{ route('delivery.index') }}" class="btn btn-info btn-sm">بازگشت</a>
                </section>

                <section>
                    <form action="{{ route('delivery.store') }}" method="post">
                        @csrf
                        <section class="row">
                            @php $message = $message ?? null @endphp
                            <x-panel-input col="10" name="name" label="نام روش ارسال"
                                           :message="$message"/>
                            <livewire:fa-price-input col="10" name="amount" label="هزینه روش ارسال"
                                                     class="dir-ltr" :message="$message"/>
                            <x-panel-input col="10" name="delivery_time" label="زمان ارسال"
                                           :message="$message"/>
                            <x-panel-input col="10" name="delivery_time_unit" label="واحد زمان ارسال"
                                           :message="$message"/>
                            <x-panel-select-box col="10" name="status" label="وضعیت"
                                                :message="$message" :hasDefaultStatus="true" />
                            <x-panel-button col="12" title="ثبت"/>
                        </section>
                    </form>
                </section>

            </section>
        </section>
    </section>

@endsection
@section('script')
    @livewireScripts
@endsection
