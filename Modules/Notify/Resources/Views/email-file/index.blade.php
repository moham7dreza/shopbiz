@extends('Panel::layouts.master')

@section('head-tag')
    <title>فایل های اطلاعیه ایمیلی </title>
@endsection

@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item font-size-12"><a href="#">خانه</a></li>
            <li class="breadcrumb-item font-size-12"><a href="#">اطلاع رسانی</a></li>
            <li class="breadcrumb-item font-size-12"><a href="#"> اطلاعیه ایمیلی</a></li>
            <li class="breadcrumb-item font-size-12 active" aria-current="page"> فایل های اطلاعیه ایمیلی</li>
        </ol>
    </nav>


    <section class="row">
        <section class="col-12">
            <section class="main-body-container">
                <section class="main-body-container-header">
                    <h5>
                        فایل اطلاعیه ایمیلی
                    </h5>
                </section>

                <section class="d-flex justify-content-between align-items-center mt-4 mb-3 border-bottom pb-2">
                    <a href="{{ route('email-file.create', $email->id) }}" class="btn btn-info btn-sm">ایجاد
                        فایل اطلاعیه ایمیلی</a>
                    <div class="max-width-16-rem">
                        <input type="text" class="form-control form-control-sm form-text" placeholder="جستجو">
                    </div>
                </section>

                <section class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>عنوان ایمیل</th>
                            <th>سایز فایل</th>
                            <th>نوع فایل</th>
                            <th>وضعیت</th>
                            <th class="max-width-16-rem text-center"><i class="fa fa-cogs"></i> تنظیمات</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach ($files as $key => $file)

                            <tr>
                                <th>{{ $key + 1 }}</th>
                                <td>{{ $email->limitedSubject() }}</td>
                                <td>{{ $file->getFaFileSize() }}</td>
                                <td>{{ $file->file_type }}</td>
                                <td>
                                    <label>
                                        <input id="{{ $file->id }}" onchange="changeStatus({{ $file->id }}, 'فایل')"
                                               data-url="{{ route('email-file.status', $file->id) }}"
                                               type="checkbox" @if ($file->status === 1)
                                                   checked
                                            @endif>
                                    </label>
                                </td>
                                <td class="width-16-rem text-left">
                                    <a href="{{ route('email-file.edit', $file->id) }}"
                                       class="btn btn-info btn-sm"><i class="fa fa-edit"></i></a>
                                    <form class="d-inline"
                                          action="{{ route('email-file.destroy', $file->id) }}"
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
                    <section class="border-top pt-3">{{ $files->links() }}</section>
                </section>

            </section>
        </section>
    </section>

@endsection



@section('script')

    @include('Share::ajax-functions.status')

    @include('Share::alerts.sweetalert.delete-confirm', ['className' => 'delete'])

@endsection
