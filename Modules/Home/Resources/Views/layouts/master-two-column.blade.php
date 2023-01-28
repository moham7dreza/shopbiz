<!DOCTYPE html>
<html lang="en">
<head>
    @include('Home::layouts.head-tag')
    @yield('head-tag')
</head>
<body>

@include('Home::layouts.header')

<section id="main-body-two-col" class="container-xxl body-container">
    <section class="row">

        @include('Home::layouts.sidebar-for-two-column')

        <main id="main-body" class="main-body col-md-9">
            @yield('content')
        </main>

    </section>
</section>


@include('Home::layouts.footer')

@include('Home::layouts.script')
@yield('script')
@include('sweetalert::alert')
<section class="toast-wrapper low-z-index flex-row-reverse"></section>
<section class="login-toast-wrapper flex-row-reverse"></section>
</body>
</html>
