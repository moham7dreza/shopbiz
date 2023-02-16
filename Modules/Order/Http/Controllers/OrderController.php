<?php

namespace Modules\Order\Http\Controllers;


use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Modules\ACL\Entities\Permission;
use Modules\Delivery\Entities\Delivery;
use Modules\Order\Entities\Order;
use Modules\Order\Repositories\OrderRepoEloquentInterface;
use Modules\Order\Services\OrderService;
use Modules\Share\Http\Controllers\Controller;
use Modules\Share\Traits\ShowMessageWithRedirectTrait;

class OrderController extends Controller
{
    use ShowMessageWithRedirectTrait;

    /**
     * @var string
     */
    private string $redirectRoute = 'order.index';

    /**
     * @var string
     */
    private string $class = Order::class;

    public OrderRepoEloquentInterface $repo;
    public OrderService $service;

    /**
     * @param OrderRepoEloquentInterface $orderRepoEloquent
     * @param OrderService $orderService
     */
    public function __construct(OrderRepoEloquentInterface $orderRepoEloquent, OrderService $orderService)
    {
        $this->repo = $orderRepoEloquent;
        $this->service = $orderService;

        $this->middleware('can:'. Permission::PERMISSION_NEW_ORDERS)->only(['newOrders']);
        $this->middleware('can:'. Permission::PERMISSION_SENDING_ORDERS)->only(['sending']);
        $this->middleware('can:'. Permission::PERMISSION_CANCELED_ORDERS)->only(['canceled']);
        $this->middleware('can:'. Permission::PERMISSION_ALL_ORDERS)->only(['all']);
        $this->middleware('can:'. Permission::PERMISSION_UNPAID_ORDERS)->only(['unpaid']);
        $this->middleware('can:'. Permission::PERMISSION_RETURNED_ORDERS)->only(['returned']);
        $this->middleware('can:'. Permission::PERMISSION_ORDER_SHOW)->only(['show']);
        $this->middleware('can:'. Permission::PERMISSION_ORDER_SHOW_DETAIL)->only(['detail']);
        $this->middleware('can:'. Permission::PERMISSION_ORDER_CHANGE_STATUS)->only(['changeOrderStatus']);
        $this->middleware('can:'. Permission::PERMISSION_ORDER_CHANGE_SEND_STATUS)->only(['changeSendStatus']);
    }

    /**
     * @return Application|Factory|View|RedirectResponse
     */
    public function newOrders(): Factory|View|Application|RedirectResponse
    {
        if (isset(request()->search)) {
            $orders = $this->repo->search(request()->search, 'newOrders')->paginate(10);
            if (count($orders) > 0) {
                $this->showToastOfFetchedRecordsCount(count($orders));
            } else {
                return $this->showAlertOfNotResultFound();
            }
        } else {
            $orders = $this->repo->newOrders()->paginate(10);
        }

        $this->service->setOrderStatusToAwaitConfirm($orders);
        return view('Order::index', compact(['orders']));
    }

    /**
     * @return Application|Factory|View|RedirectResponse
     */
    public function sending(): View|Factory|Application|RedirectResponse
    {
        if (isset(request()->search)) {
            $orders = $this->repo->search(request()->search, 'sending')->paginate(10);
            if (count($orders) > 0) {
                $this->showToastOfFetchedRecordsCount(count($orders));
            } else {
                return $this->showAlertOfNotResultFound();
            }
        } else {
            $orders = $this->repo->sending()->paginate(10);
        }

        return view('Order::index', compact(['orders']));
    }

    /**
     * @return Application|Factory|View|RedirectResponse
     */
    public function unpaid(): View|Factory|Application|RedirectResponse
    {
        if (isset(request()->search)) {
            $orders = $this->repo->search(request()->search, 'unpaid')->paginate(10);
            if (count($orders) > 0) {
                $this->showToastOfFetchedRecordsCount(count($orders));
            } else {
                return $this->showAlertOfNotResultFound();
            }
        } else {
            $orders = $this->repo->unpaid()->paginate(10);
        }

        return view('Order::index', compact(['orders']));
    }

    /**
     * @return Application|Factory|View|RedirectResponse
     */
    public function canceled(): View|Factory|Application|RedirectResponse
    {
        if (isset(request()->search)) {
            $orders = $this->repo->search(request()->search, 'canceled')->paginate(10);
            if (count($orders) > 0) {
                $this->showToastOfFetchedRecordsCount(count($orders));
            } else {
                return $this->showAlertOfNotResultFound();
            }
        } else {
            $orders = $this->repo->canceled()->paginate(10);
        }

        return view('Order::index', compact(['orders']));
    }

    /**
     * @return Application|Factory|View|RedirectResponse
     */
    public function returned(): View|Factory|Application|RedirectResponse
    {
        if (isset(request()->search)) {
            $orders = $this->repo->search(request()->search, 'returned')->paginate(10);
            if (count($orders) > 0) {
                $this->showToastOfFetchedRecordsCount(count($orders));
            } else {
                return $this->showAlertOfNotResultFound();
            }
        } else {
            $orders = $this->repo->returned()->paginate(10);
        }

        return view('Order::index', compact(['orders']));
    }

    /**
     * @return Application|Factory|View|RedirectResponse
     */
    public function all(): View|Factory|Application|RedirectResponse
    {
        if (isset(request()->search)) {
            $orders = $this->repo->search(request()->search, 'all')->paginate(10);
            if (count($orders) > 0) {
                $this->showToastOfFetchedRecordsCount(count($orders));
            } else {
                return $this->showAlertOfNotResultFound();
            }
        } else {
            $orders = $this->repo->index()->paginate(10);
        }

        return view('Order::index', compact(['orders']));
    }

    /**
     * @param Order $order
     * @return Application|Factory|View
     */
    public function show(Order $order): View|Factory|Application
    {
        return view('Order::show', compact(['order']));
    }

    /**
     * @param Order $order
     * @return Application|Factory|View
     */
    public function detail(Order $order): View|Factory|Application
    {
        return view('Order::detail', compact(['order']));
    }

    /**
     * @param Order $order
     * @return RedirectResponse
     */
    public function changeSendStatus(Order $order): RedirectResponse
    {
        $this->service->changeSendStatus($order);
        return $this->showMessageWithRedirectRoute('وضعیت ارسال کالا با موفقیت تغییر کرد.');
    }

    /**
     * @param Order $order
     * @return RedirectResponse
     */
    public function changeOrderStatus(Order $order): RedirectResponse
    {
        $this->service->changeOrderStatus($order);
        return $this->showMessageWithRedirectRoute('وضعیت سفارش با موفقیت تغییر کرد.');
    }

    /**
     * @param Order $order
     * @return RedirectResponse
     */
    public function cancelOrder(Order $order): RedirectResponse
    {
        $this->service->makeOrderStatusCanceled($order);
        return $this->showMessageWithRedirectRoute('وضعیت سفارش به باطل شده تغییر کرد.');
    }
}
