<?php

namespace Modules\Page\Http\Controllers;

use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Response;
use Modules\ACL\Entities\Permission;
use Modules\Page\Entities\Page;
use Modules\Page\Http\Requests\PageRequest;
use Modules\Page\Repositories\PageRepoEloquentInterface;
use Modules\Page\Services\PageService;
use Modules\Share\Http\Controllers\Controller;
use Modules\Share\Services\ShareService;
use Modules\Share\Traits\ShowMessageWithRedirectTrait;
use Modules\Tag\Repositories\TagRepositoryEloquentInterface;

class PageController extends Controller
{
    use ShowMessageWithRedirectTrait;

    /**
     * @var string
     */
    private string $redirectRoute = 'page.index';

    /**
     * @var string
     */
    private string $class = Page::class;

    public PageRepoEloquentInterface $repo;
    public PageService $service;

    /**
     * @param PageRepoEloquentInterface $pageRepoEloquent
     * @param PageService $pageService
     */
    public function __construct(PageRepoEloquentInterface $pageRepoEloquent, PageService $pageService)
    {
        $this->repo = $pageRepoEloquent;
        $this->service = $pageService;

        $this->middleware('can:' . Permission::PERMISSION_FAQS)->only(['index']);
        $this->middleware('can:' . Permission::PERMISSION_FAQ_CREATE)->only(['create', 'store']);
        $this->middleware('can:' . Permission::PERMISSION_FAQ_EDIT)->only(['edit', 'update']);
        $this->middleware('can:' . Permission::PERMISSION_FAQ_DELETE)->only(['destroy']);
        $this->middleware('can:' . Permission::PERMISSION_FAQ_STATUS)->only(['status']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return Application|Factory|View|RedirectResponse
     */
    public function index(): Factory|View|Application|RedirectResponse
    {
        if (isset(request()->search)) {
            $pages = $this->repo->search(request()->search)->paginate(10);
            if (count($pages) > 0) {
                $this->showToastOfFetchedRecordsCount(count($pages));
            } else {
                return $this->showAlertOfNotResultFound();
            }
        } elseif (isset(request()->sort)) {
            $pages = $this->repo->sort(request()->sort, request()->dir)->paginate(10);
            if (count($pages) > 0) {
                $this->showToastOfSelectedDirection(request()->dir);
            }
            else { $this->showToastOfNotDataExists(); }
        } else {
            $pages = $this->repo->index()->paginate(10);
        }

        return view('Page::index', compact(['pages']));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Application|Factory|View
     */
    public function create(): View|Factory|Application
    {
        return view('Page::create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param PageRequest $request
     * @return RedirectResponse
     */
    public function store(PageRequest $request): RedirectResponse
    {
        $this->service->store($request);
        return $this->showMessageWithRedirectRoute('صفحه جدید شما با موفقیت ثبت شد');
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return Response
     */
    public function show(int $id): Response
    {
        abort(403);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Page $page
     * @return Application|Factory|View
     */
    public function edit(Page $page): View|Factory|Application
    {
        return view('Page::edit', compact(['page']));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param PageRequest $request
     * @param Page $page
     * @return RedirectResponse
     */
    public function update(PageRequest $request, Page $page): RedirectResponse
    {
        $this->service->update($request, $page);
        return $this->showMessageWithRedirectRoute('صفحه شما با موفقیت ویرایش شد');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Page $page
     * @return RedirectResponse
     */
    public function destroy(Page $page): \Illuminate\Http\RedirectResponse
    {
        $result = $page->delete();
        return $this->showMessageWithRedirectRoute('صفحه شما با موفقیت حذف شد');
    }


    /**
     * @param Page $page
     * @return JsonResponse
     */
    public function status(Page $page): JsonResponse
    {
        return ShareService::changeStatus($page);
    }

    /**
     * @param Page $page
     * @param TagRepositoryEloquentInterface $tagRepositoryEloquent
     * @return Application|Factory|View
     */
    public function tagsForm(Page $page, TagRepositoryEloquentInterface $tagRepositoryEloquent): View|Factory|Application
    {
        $tags = $tagRepositoryEloquent->index()->get();
        return view('Page::tags-form', compact(['page', 'tags']));
    }

    /**
     * @param PageRequest $request
     * @param Page $page
     * @return RedirectResponse
     */
    public function setTags(PageRequest $request, Page $page): RedirectResponse
    {
        $page->tags()->sync($request->tags);
        return $this->showMessageWithRedirectRoute('تگ های پیج با موفقیت بروزرسانی شد');
    }
}
