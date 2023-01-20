@extends('Panel::layouts.master')

@section('head-tag')
    <title>کاربران ادمین</title>
@endsection

@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item font-size-12"><a href="#">خانه</a></li>
            <li class="breadcrumb-item font-size-12"><a href="#">بخش کاربران</a></li>
            <li class="breadcrumb-item font-size-12 active" aria-current="page"> کاربران ادمین</li>
        </ol>
    </nav>


    <section class="row">
        <section class="col-12">
            <section class="main-body-container">
                <section class="main-body-container-header">
                    <h5>
                        کاربران ادمین
                    </h5>
                </section>

                <section class="d-flex justify-content-between align-items-center mt-4 mb-3 border-bottom pb-2">
                    <a href="{{ route('adminUser.create') }}" class="btn btn-info btn-sm">ایجاد ادمین جدید</a>
                    <div class="max-width-16-rem">
                        <input type="text" class="form-control form-control-sm form-text" placeholder="جستجو">
                    </div>
                </section>

                <section class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>ایمیل</th>
                            <th>شماره موبایل</th>
                            <th>نام</th>
                            <th>نام خانوادگی</th>
                            <th>فعال سازی</th>
                            <th>وضعیت</th>
                            <th>نقش</th>
                            <th>سطوح دسترسی</th>
                            <th class="max-width-16-rem text-center"><i class="fa fa-cogs"></i> تنظیمات</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach ($adminUsers as $key => $admin)

                            <tr>
                                <th>{{ $key + 1 }}</th>
                                <td>{{ $admin->email }}</td>
                                <td>{{ $admin->faMobileNumber() }}</td>
                                <td>{{ $admin->first_name }}</td>
                                <td>{{ $admin->last_name }}</td>
                                <td>
                                    <label>
                                        <input id="{{ $admin->id }}-active" onchange="changeActive({{ $admin->id }})"
                                               data-url="{{ route('adminUser.activation', $admin->id) }}"
                                               type="checkbox" @if ($admin->activation === 1)
                                                   checked
                                            @endif>
                                    </label>
                                </td>
                                <td>
                                    <label>
                                        <input id="{{ $admin->id }}" onchange="changeStatus({{ $admin->id }})"
                                               data-url="{{ route('adminUser.status', $admin->id) }}"
                                               type="checkbox" @if ($admin->status === 1)
                                                   checked
                                            @endif>
                                    </label>
                                </td>
                                <td>
                                    @forelse($admin->roles as $role)
                                        <div>
                                            {{ $role->name }}
                                        </div>
                                    @empty
                                        <div class="text-danger">
                                            نقشی یافت نشد
                                        </div>
                                    @endforelse
                                </td>
                                <td>
                                    @forelse($admin->permissions as $permission)
                                        <div>
                                            {{ $permission->name }}
                                        </div>
                                    @empty
                                        <div class="text-danger">
                                            سطوح دسترسی یافت نشد
                                        </div>
                                    @endforelse
                                </td>
                                <td class="width-16-rem text-left">
                                    <a href="{{ route('adminUser.permissions', $admin->id) }}"
                                       class="btn btn-warning btn-sm"><i class="fa fa-user-shield"></i></a>
                                    <a href="{{ route('adminUser.roles', $admin->id) }}"
                                       class="btn btn-info btn-sm"><i class="fa fa-user-check"></i></a>
                                    <a href="{{ route('adminUser.edit', $admin->id) }}"
                                       class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></a>
                                    <form class="d-inline" action="{{ route('adminUser.destroy', $admin->id) }}"
                                          method="post">
                                        @csrf
                                        {{ method_field('delete') }}
                                        <button class="btn btn-danger btn-sm delete" type="submit"><i
                                                class="fa fa-trash-alt"></i></button>
                                    </form>
                                </td>
                            </tr>

                        @endforeach


                        </tbody>
                    </table>
                    <section class="border-top pt-3">{{ $adminUsers->links() }}</section>
                </section>

            </section>
        </section>
    </section>

@endsection

@section('script')

    <script type="text/javascript">
        function changeStatus(id) {
            var element = $("#" + id)
            var url = element.attr('data-url')
            var elementValue = !element.prop('checked');

            $.ajax({
                url: url,
                type: "GET",
                success: function (response) {
                    if (response.status) {
                        if (response.checked) {
                            element.prop('checked', true);
                            successToast('ادمین با موفقیت فعال شد')
                        } else {
                            element.prop('checked', false);
                            warningToast('ادمین با موفقیت غیر فعال شد')
                        }
                    } else {
                        element.prop('checked', elementValue);
                        errorToast('هنگام ویرایش مشکلی بوجود امده است')
                    }
                },
                error: function () {
                    element.prop('checked', elementValue);
                    errorToast('ارتباط برقرار نشد')
                }
            });

            @include('Panel::alerts.toast.functions.toasts')
        }
    </script>


    <script type="text/javascript">
        function changeActive(id) {
            var element = $("#" + id + '-active')
            var url = element.attr('data-url')
            var elementValue = !element.prop('checked');

            $.ajax({
                url: url,
                type: "GET",
                success: function (response) {
                    if (response.activation) {
                        if (response.checked) {
                            element.prop('checked', true);
                            successToast('فعال سازی ادمین با موفقیت انجام شد')
                        } else {
                            element.prop('checked', false);
                            warningToast('غیر فعال سازی ادمین با موفقیت انجام شد')
                        }
                    } else {
                        element.prop('checked', elementValue);
                        errorToast('هنگام ویرایش مشکلی بوجود امده است')
                    }
                },
                error: function () {
                    element.prop('checked', elementValue);
                    errorToast('ارتباط برقرار نشد')
                }
            });

            @include('Panel::alerts.toast.functions.toasts')
        }
    </script>


    @include('Panel::alerts.sweetalert.delete-confirm', ['className' => 'delete'])

@endsection
