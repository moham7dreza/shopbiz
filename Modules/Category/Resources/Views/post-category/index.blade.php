@extends('Panel::layouts.master')

@section('head-tag')
    <title>دسته بندی</title>
@endsection

@section('content')
    @php $PERMISSION = \Modules\ACL\Entities\Permission::class @endphp
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item font-size-16"><a href="{{ route('panel.home') }}">خانه</a></li>
            <li class="breadcrumb-item font-size-16"><a href="#"> محتوی</a></li>
            <li class="breadcrumb-item font-size-16 active" aria-current="page"> دسته بندی</li>
        </ol>
    </nav>

    <section class="row">
        <section class="col-12">
            <section class="main-body-container">
                <section class="main-body-container-header">
                    <h5>
                        دسته بندی
                    </h5>
                </section>

                <section class="d-flex justify-content-between align-items-center mt-4 mb-3 border-bottom pb-2">
                    <section class="d-flex">
                        @can($PERMISSION::PERMISSION_POST_CATEGORY_CREATE)
                            <a href="{{ route('postCategory.create') }}" class="btn btn-info btn-sm">ایجاد دسته بندی</a>
                        @endcan
                        <x-panel-a-tag route="{{ route($redirectRoute) }}" text="حذف فیلتر"
                                       color="outline-danger"/>
                    </section>

                    <div class="max-width-16-rem">
                        <x-panel-search-form route="{{ route($redirectRoute) }}"/>
                    </div>
                </section>

                <section class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>
                                <x-panel-sort-btn :route="$redirectRoute" title="نام دسته بندی"/>
                            </th>
                            <th>توضیحات</th>
                            <th>عکس</th>
                            <th>تگ ها</th>
                            <th>
                                <x-panel-sort-btn :route="$redirectRoute" title="وضعیت" property="status"/>
                            </th>
                            <th class="max-width-16-rem text-center"><i class="fa fa-cogs"></i> تنظیمات</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach ($postCategories as $key => $postCategory)

                            <tr>
                                <th>{{ $key += 1 }}</th>
                                <td>{{ $postCategory->name }}</td>
                                <td>{!! $postCategory->getLimitedDescription() !!}</td>
                                <td>
                                    <img
                                        src="{{ $postCategory->getImagePath() }}"
                                        alt="" width="100" height="50">
                                </td>
                                <td>
                                    @can($PERMISSION::PERMISSION_POST_CATEGORY_TAGS)
                                        <x-panel-tags :model="$postCategory" related="tags" name="دسته بندی"/>
                                    @endcan
                                </td>
                                <td>
                                    @can($PERMISSION::PERMISSION_POST_CATEGORY_STATUS)
                                        <x-panel-checkbox class="rounded" route="postCategory.status"
                                                          method="changeStatus"
                                                          name="دسته بندی" :model="$postCategory" property="status"/>
                                    @endcan
                                </td>
                                <td class="width-16-rem text-left">
                                    @can($PERMISSION::PERMISSION_POST_CATEGORY_TAGS)
                                        <x-panel-a-tag route="{{ route('postCategory.tags-from', $postCategory->id) }}"
                                                       title="افزودن تگ"
                                                       icon="tag" color="outline-success"/>
                                    @endcan
                                    @can($PERMISSION::PERMISSION_POST_CATEGORY_EDIT)
                                        <x-panel-a-tag route="{{ route('postCategory.edit', $postCategory->id) }}"
                                                       title="ویرایش آیتم"
                                                       icon="edit" color="outline-info"/>
                                    @endcan
                                    @can($PERMISSION::PERMISSION_POST_CATEGORY_DELETE)
                                        <x-panel-delete-form
                                            route="{{ route('postCategory.destroy', $postCategory->id) }}"
                                            title="حذف آیتم"/>
                                    @endcan
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    <section class="border-top pt-3">{{ $postCategories->links() }}</section>
                </section>

            </section>
        </section>
    </section>
@endsection
@section('script')

    @include('Share::ajax-functions.panel.status')

    @include('Share::alerts.sweetalert.delete-confirm', ['className' => 'delete'])

@endsection
