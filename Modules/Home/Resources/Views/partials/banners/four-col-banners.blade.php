<!-- start ads section -->
<section class="">
    <section class="container-xxl">
        <!-- four column-->
        <section class="row py-4">
            @foreach ($repo->fourColumnBanners() as $colBanner)
                <section class="col-12 col-md-6 col-lg-3 p-5 p-md-1">
                    <a href="{{ urldecode($colBanner->url) }}">
                        <img class="d-block rounded-2 w-100" src="{{ $colBanner->image() }}"
                             alt="{{ $colBanner->title }}" title="{{ $colBanner->title }}" data-bs-toggle="tooltip"
                             data-bs-placement="top">
                    </a>
                </section>
            @endforeach
        </section>
    </section>
</section>
<!-- end ads section -->
