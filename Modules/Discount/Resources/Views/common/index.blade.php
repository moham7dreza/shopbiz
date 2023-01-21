@extends('Panel::layouts.master')

@section('head-tag')
    <title>تخفیف عمومی</title>
@endsection

@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item font-size-12"><a href="#">خانه</a></li>
            <li class="breadcrumb-item font-size-12"><a href="#">بخش فروش</a></li>
            <li class="breadcrumb-item font-size-12 active" aria-current="page">تخفیف عمومی</li>
        </ol>
    </nav>


    <section class="row">
        <section class="col-12">
            <section class="main-body-container">
                <section class="main-body-container-header">
                    <h5>
                        تخفیف عمومی
                    </h5>
                </section>

                <section class="d-flex justify-content-between align-items-center mt-4 mb-3 border-bottom pb-2">
                    <a href="{{ route('commonDiscount.create') }}" class="btn btn-info btn-sm">ایجاد تخفیف
                        عمومی</a>
                    <div class="max-width-16-rem">
                        <input type="text" class="form-control form-control-sm form-text" placeholder="جستجو">
                    </div>
                </section>

                <section class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>درصد تخفیف</th>
                            <th>سقف تخفیف</th>
                            <th>عنوان مناسبت</th>
                            <th>تاریخ شروع</th>
                            <th>تاریخ پایان</th>
                            <th>وضعیت</th>
                            <th class="max-width-16-rem text-center"><i class="fa fa-cogs"></i> تنظیمات</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach ($commonDiscounts as $commonDiscount)

                            <tr>
                                <th>{{ $loop->iteration }}</th>
                                <th>{{ $commonDiscount->getFaPercentage() }}</th>
                                <th>{{ $commonDiscount->getFaDiscountCeiling() }}</th>
                                <th>{{ $commonDiscount->limitedTitle() }}</th>
                                <td>{{ $commonDiscount->getFaStartDate() }}</td>
                                <td>{{ $commonDiscount->getFaEndDate() }}</td>
                                <td>
                                    <label>
                                        <input id="{{ $commonDiscount->id }}" onchange="changeStatus({{ $commonDiscount->id }}, 'تخفیف عمومی')"
                                               data-url="{{ route('commonDiscount.status', $commonDiscount->id) }}"
                                               type="checkbox"
                                               @if ($commonDiscount->status === 1)
                                                   checked
                                            @endif>
                                    </label>
                                </td>
                                <td class="width-16-rem text-left">
                                    <a href="{{ route('commonDiscount.edit', $commonDiscount->id) }}"
                                       class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></a>
                                    <form class="d-inline"
                                          action="{{ route('commonDiscount.destroy', $commonDiscount->id) }}"
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
                    <section class="border-top pt-3">{{ $commonDiscounts->links() }}</section>
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
