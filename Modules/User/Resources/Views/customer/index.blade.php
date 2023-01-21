@extends('Panel::layouts.master')

@section('head-tag')
    <title>مشتریان</title>
@endsection

@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item font-size-12"><a href="#">خانه</a></li>
            <li class="breadcrumb-item font-size-12"><a href="#">بخش کاربران</a></li>
            <li class="breadcrumb-item font-size-12 active" aria-current="page"> مشتریان</li>
        </ol>
    </nav>


    <section class="row">
        <section class="col-12">
            <section class="main-body-container">
                <section class="main-body-container-header">
                    <h5>
                        مشتریان
                    </h5>
                </section>

                <section class="d-flex justify-content-between align-items-center mt-4 mb-3 border-bottom pb-2">
                    <a href="{{ route('customerUser.create') }}" class="btn btn-info btn-sm">ایجاد مشتری جدید</a>
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
                            <th class="max-width-16-rem text-center"><i class="fa fa-cogs"></i> تنظیمات</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach ($users as $key => $user)

                            <tr>
                                <th>{{ $key + 1 }}</th>
                                <td>{{ $user->email }}</td>
                                <td>{{ $user->faMobileNumber() }}</td>
                                <td>{{ $user->first_name }}</td>
                                <td>{{ $user->last_name }}</td>
                                <td>
                                    <label>
                                        <input id="{{ $user->id }}-active" onchange="changeActive({{ $user->id }}, 'مشتری')"
                                               data-url="{{ route('customerUser.activation', $user->id) }}"
                                               type="checkbox" @if ($user->activation === 1)
                                                   checked
                                            @endif>
                                    </label>
                                </td>
                                <td>
                                    <label>
                                        <input id="{{ $user->id }}" onchange="changeStatus({{ $user->id }}, 'مشتری')"
                                               data-url="{{ route('customerUser.status', $user->id) }}" type="checkbox"
                                               @if ($user->status === 1)
                                                   checked
                                            @endif>
                                    </label>
                                </td>
                                <td class="width-16-rem text-left">
                                    <a href="{{ route('customerUser.edit', $user->id) }}"
                                       class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></a>
                                    <form class="d-inline" action="{{ route('customerUser.destroy', $user->id) }}"
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
                    <section class="border-top pt-3">{{ $users->links() }}</section>
                </section>

            </section>
        </section>
    </section>

@endsection



@section('script')
    <script type="text/javascript">
        @include('Panel::functions.status')
        @include('Panel::functions.activation')
        @include('Panel::functions.toasts')
    </script>
    @include('Panel::alerts.sweetalert.delete-confirm', ['className' => 'delete'])
@endsection
