<?php

namespace Modules\Home\Providers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\ServiceProvider;
use Modules\Cart\Entities\CartItem;
use Modules\Category\Entities\ProductCategory;
use Modules\Home\Repositories\HomeRepoEloquent;
use Modules\Home\Repositories\HomeRepoEloquentInterface;
use Modules\Menu\Entities\Menu;
use Modules\Setting\Entities\Setting;

class HomeServiceProvider extends ServiceProvider
{
    /**
     * Get namespace for panel controller.
     *
     * @var string
     */
    public string $namespace = 'Modules\Home\Http\Controllers';

    /**
     * Get view path.
     *
     * @var string
     */
    public string $viewPath = '/../Resources/Views/';

    /**
     * Get name.
     *
     * @var string
     */
    public string $name = 'Home';

    /**
     * Get middleware route.
     *
     * @var array|string[]
     */
    public array $middlewareRoute = ['web'];

    /**
     * Get route path.
     *
     * @var string
     */
    public string $routePath = '/../Routes/home_routes.php';

    /**
     * Register panel files.
     *
     * @return void
     */
    public function register(): void
    {
        $this->loadViewFiles();
        $this->loadRouteFiles();
        $this->bindRepository();
    }

    /**
     * Boot panel service provider.
     *
     * @return void
     */
    public function boot(): void
    {
        $this->app->booted(function () {
            $this->setMenuForPanel();
            $this->sendVarsToViews();
        });
    }

    /**
     * Load panel view files.
     *
     * @return void
     */
    private function loadViewFiles(): void
    {
        $this->loadViewsFrom(__DIR__ . $this->viewPath, $this->name);
    }

    /**
     * Load panel route files.
     *
     * @return void
     */
    private function loadRouteFiles(): void
    {
        Route::middleware($this->middlewareRoute)
            ->namespace($this->namespace)
            ->group(__DIR__ . $this->routePath);
    }

    /**
     * Set menu for panel.
     *
     * @return void
     */
    private function setMenuForPanel(): void
    {
        config()->set('panelConfig.menus.home', [
            'title' => 'فروشگاه',
            'icon' => 'fa-store',
//            'url' => route('customer.home'),
        ]);
    }

    private function sendVarsToViews()
    {
        view()->composer('Home::layouts.header', function ($view) {
            if (Auth::check()) {
                $cartItems = CartItem::query()->where('user_id', Auth::user()->id)->get();
                $view->with('cartItems', $cartItems);
            }
            $view->with('menus', Menu::query()->where([['status', 1], ['parent_id', NULL]])->orderBy('created_at')->get());
            $view->with('categories', ProductCategory::query()->where([['status', 1], ['show_in_menu', 1], ['parent_id', NULL]])->orderBy('created_at')->get());
            $view->with('logo', Setting::query()->where('id', 1)->pluck('logo')->first());
        });
    }

    /**
     * @return void
     */
    private function bindRepository()
    {
        $this->app->bind(HomeRepoEloquentInterface::class, HomeRepoEloquent::class);
    }
}
