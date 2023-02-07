@extends('Panel::layouts.master')

@section('head-tag')
    <title>فرم کالا</title>
@endsection

@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item font-size-12"><a href="#">خانه</a></li>
            <li class="breadcrumb-item font-size-12"><a href="#">بخش فروش</a></li>
            <li class="breadcrumb-item font-size-12 active" aria-current="page"> فرم کالا</li>
        </ol>
    </nav>


    <section class="row">
        <section class="col-12">
            <section class="main-body-container">
                <section class="main-body-container-header">
                    <h5>
                        فرم کالا
                    </h5>
                </section>

                <section class="d-flex justify-content-between align-items-center mt-4 mb-3 border-bottom pb-2">
                    <a href="{{ route('attribute.create') }}" class="btn btn-info btn-sm">ایجاد فرم جدید</a>
                    <div class="max-width-16-rem">
                        <form action="{{ route('attribute.index') }}" class="d-flex">
                            <input type="text" name="search" class="form-control form-control-sm form-text" placeholder="جستجو">
                            <button type="submit" class="btn btn-light btn-sm"><i class="fa fa-check"></i></button>
                        </form>
                    </div>
                </section>

                <section class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>نام فرم</th>
                            <th>واحد اندازه گیری</th>
                            <th>دسته بندی ها</th>
                            <th>وضعیت</th>
                            <th class="max-width-16-rem text-center"><i class="fa fa-cogs"></i> تنظیمات</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach ($attributes as $attribute)

                            <tr>
                                <th>{{ $loop->iteration }}</th>
                                <td>{{ $attribute->name }}</td>
                                <td>{{ $attribute->unit }}</td>
                                <td>
                                    @if(empty($attribute->categories()->get()->toArray()))
                                        <span class="text-danger">برای این فرم کالا هیچ دسته بندی تعریف نشده است</span>
                                    @else
                                        @foreach($attribute->categories as $category)
                                            {{ $category->name }} <br>
                                        @endforeach
                                    @endif
                                </td>
                                <td>
                                    <label>
                                        <input id="{{ $attribute->id }}" onchange="changeStatus({{ $attribute->id }}, 'فرم کالا')"
                                               data-url="{{ route('attribute.status', $attribute->id) }}" type="checkbox"
                                               @if ($attribute->status === 1)
                                                   checked
                                            @endif>
                                    </label>
                                </td>
                                <td class="width-22-rem text-left">
                                    <a href="{{ route('attribute.category-form', $attribute->id) }}"
                                       class="btn btn-info btn-sm" title="تعریف دسته بندی"><i class="fa fa-leaf"></i></a>
                                    <a href="{{ route('attributeValue.index', $attribute->id) }}"
                                       class="btn btn-warning btn-sm" title="مقادیر فرم کالا"><i class="fa fa-weight"></i></a>
                                    <a href="{{ route('attribute.edit', $attribute->id) }}"
                                       class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></a>
                                    <form class="d-inline"
                                          action="{{ route('attribute.destroy', $attribute->id) }}"
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
                    <section class="border-top pt-3">{{ $attributes->links() }}</section>
                </section>

            </section>
        </section>
    </section>

@endsection


@section('script')

    @include('Share::ajax-functions.status')

    @include('Share::alerts.sweetalert.delete-confirm', ['className' => 'delete'])

@endsection
