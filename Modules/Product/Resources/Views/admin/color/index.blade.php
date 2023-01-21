@extends('Panel::layouts.master')

@section('head-tag')
    <title>مدیریت رنگ های محصول</title>
@endsection

@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item font-size-12"><a href="#">خانه</a></li>
            <li class="breadcrumb-item font-size-12"><a href="#">بخش فروش</a></li>
            <li class="breadcrumb-item font-size-12 active" aria-current="page"> رنگ</li>
        </ol>
    </nav>


    <section class="row">
        <section class="col-12">
            <section class="main-body-container">
                <section class="main-body-container-header">
                    <h5>
                        رنگ
                    </h5>
                </section>

                <section class="d-flex justify-content-between align-items-center mt-4 mb-3 border-bottom pb-2">
                    <a href="{{ route('product.color.create', $product->id) }}" class="btn btn-info btn-sm">ایجاد
                        رنگ جدید </a>
                    <div class="max-width-16-rem">
                        <input type="text" class="form-control form-control-sm form-text" placeholder="جستجو">
                    </div>
                </section>

                <section class="table-responsive">
                    <table class="table table-striped table-hover h-150px">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>نام کالا</th>
                            <th>رنگ کالا</th>
                            <th>افزایش قیمت</th>
                            <th>تعداد قابل فروش</th>
                            <th>تعداد فروخته شده</th>
                            <th>تعداد رزرو شده</th>
                            <th>وضعیت</th>
                            <th class="max-width-16-rem text-center"><i class="fa fa-cogs"></i> تنظیمات</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach ($colors as $color)

                            <tr>
                                <th>{{ $loop->iteration }}</th>
                                <td>{{ $product->name }}</td>
                                <td>
                                    {{ $color->color_name }}
                                </td>
                                <td>
                                    {{ $color->getFaPriceIncrease() }}
                                </td>
                                <td>{{ $color->getFaMarketableNumber() }}</td>
                                <td>{{ $color->getFaSoldNumber() }}</td>
                                <td>{{ $color->getFaFrozenNumber() }}</td>
                                <td>
                                    <label>
                                        <input id="{{ $color->id }}" onchange="changeStatus({{ $color->id }}, 'رنگ')"
                                               data-url="{{ route('product.color.status', $color->id) }}" type="checkbox"
                                               @if ($color->status === 1)
                                                   checked
                                            @endif>
                                    </label>
                                </td>

                                <td class="width-12-rem text-center">
                                    <a href="{{ route('product.color.edit', ['product' => $product->id , 'color' => $color->id]) }}" class="btn btn-primary btn-sm"><i
                                            class="fa fa-edit"></i></a>
                                    <form class="d-inline"
                                          action="{{ route('product.color.destroy', ['product' => $product->id , 'color' => $color->id] ) }}"
                                          method="post">
                                        @csrf
                                        {{ method_field('delete') }}
                                        <button class="btn btn-danger btn-sm delete" type="submit"><i
                                                class="fa fa-trash-alt"></i>
                                        </button>
                                    </form>

                                </td>
                            </tr>

                        @endforeach


                        </tbody>
                    </table>
                    <section class="border-top pt-3">{{ $colors->links() }}</section>
                </section>

            </section>
        </section>
    </section>

@endsection


@section('script')

    <script type="text/javascript">
        @include('Panel::functions.status')
        @include('Panel::functions.toasts')
    </script>

    @include('Panel::alerts.sweetalert.delete-confirm', ['className' => 'delete'])

@endsection
