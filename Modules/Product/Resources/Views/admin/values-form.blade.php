@extends('Panel::layouts.master')

@section('head-tag')
    <title>مقادیر محصول</title>
@endsection

@section('content')
    @php $PERMISSION = \Modules\ACL\Entities\Permission::class @endphp
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item font-size-16"><a href="{{ route('panel.home') }}">خانه</a></li>
            <li class="breadcrumb-item font-size-16"><a href="#"> بخش فروش</a></li>
            <li class="breadcrumb-item font-size-16"><a href="{{ route('product.index') }}"> کالاها</a></li>
            <li class="breadcrumb-item font-size-16 active" aria-current="page"> مقادیر محصول</li>
        </ol>
    </nav>

    <section class="row">
        <section class="col-12">
            <section class="main-body-container">
                <section class="main-body-container-header">
                    <h5>
                        مقادیر محصول
                    </h5>
                </section>

                <section class="d-flex justify-content-between align-items-center mt-4 mb-3 border-bottom pb-2">
                    <a href="{{ route('product.index') }}" class="btn btn-info btn-sm">بازگشت</a>
                    <div class="max-width-16-rem">
                        <x-panel-search-form route="{{ route('product.index') }}"/>
                    </div>
                </section>
                <section class="row mb-4">
                    <x-panel-section col="5" id="product-name" label="نام محصول" text="{{ $product->name }}"/>
                    <x-panel-section col="5" id="product-intro" label="توضیح محصول"
                                     text="{!! strip_tags($product->introduction) !!}"/>
                </section>
                <section class="table-responsive">
                    <table class="table table-striped table-hover h-150px">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>نام فرم</th>
                            <th>مقدار</th>
                            <th> مقدار لاتین</th>
                            <th class="max-width-16-rem text-center"><i class="fa fa-cogs"></i> تنظیمات</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach ($product->values()->get() as $value)
                            <tr>
                                <th>{{ $loop->iteration }}</th>
                                <th>{{ $value->attribute()->first()->name }}</th>
                                <td>{{ $value->getFaValue() . ' ' . $value->attribute()->first()->unit }}</td>
                                <td>{{ json_decode($value->value)->value }} {{ $value->attribute()->first()->unit_en }}</td>
                                <td class="width-12-rem text-left">
                                    @can($PERMISSION::PERMISSION_PRODUCT_VALUE_SELECT)
                                        <x-panel-a-tag route="{{ route('brand.tags-from', 1) }}"
                                                       title="افزودن تگ"
                                                       icon="tag" color="outline-success"/>
                                    @endcan
                                    @can($PERMISSION::PERMISSION_BRAND_EDIT)
                                        <x-panel-a-tag route="{{ route('brand.edit', 1) }}" title="ویرایش آیتم"
                                                       icon="edit" color="outline-info"/>
                                    @endcan
                                    @can($PERMISSION::PERMISSION_BRAND_DELETE)
                                        <x-panel-delete-form route="{{ route('brand.destroy', 1) }}"
                                                             title="حذف آیتم"/>
                                    @endcan
                                </td>
                            </tr>
                        @endforeach
                        {{--                        @foreach ($product->metas()->get() as $meta)--}}
                        {{--                            <tr>--}}
                        {{--                                <td>{{ $meta->meta_key }}</td>--}}
                        {{--                                <td>{{ $meta->meta_value }}</td>--}}
                        {{--                            </tr>--}}
                        {{--                        @endforeach--}}
                        </tbody>
                    </table>
{{--                    <section class="border-top pt-3">{{ $products->links() }}</section>--}}
                </section>
            </section>
        </section>
    </section>
@endsection
