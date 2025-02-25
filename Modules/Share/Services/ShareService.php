<?php

namespace Modules\Share\Services;

use Artesaos\SEOTools\Facades\SEOMeta;
use Artesaos\SEOTools\Facades\SEOTools;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Modules\ACL\Entities\Permission;
use Modules\Comment\Repositories\CommentRepoEloquent;
use Modules\Notify\Repositories\Notification\NotificationRepoEloquent;
use Modules\Setting\Repositories\SettingRepoEloquent;
use Modules\User\Entities\User;

class ShareService
{
    /**
     * @param string|null $route
     * @param string|null $url
     * @return mixed
     */
    public static function sendInternalApiRequestAndGetResponse(string $route = null, array $params = [], string $url = null): mixed
    {
        $request = Request::create($url ?? route($route, $params), 'get');

        return json_decode(Route::dispatch($request)->getContent());
    }

    // Permission
    /******************************************************************************************************************/
    /**
     * @param null $user
     * @return bool
     */
    public static function checkForAdmin($user = null): bool
    {
        return self::checkForUserHasSpecialPermission(Permission::PERMISSION_SUPER_ADMIN, user: $user);
    }

    /**
     * @param $permission
     * @param null $user
     * @param int $type
     * @return bool
     */
    public static function checkForUserHasSpecialPermission($permission, $user = null, int $type = User::TYPE_ADMIN): bool
    {
        if (is_null($user)) {
            $user = auth()->user();
        }
        return !is_null($user) && $user->hasPermissionTo($permission) && ($user->user_type === $type);
    }

    /**
     * @param $permissions
     * @param $user
     * @param int $type
     * @return int
     */
    public static function checkForUserHasSpecialPermissionsCount($permissions, $user = null, int $type = User::TYPE_ADMIN): int
    {
        if (is_null($user)) {
            $user = auth()->user();
        }
        $result = [];
        foreach ($permissions as $permission) {
            if ($user->hasPermissionTo($permission)) {
                $result[] = $permission;
            }
        }
        return $user->user_type === $type ? count($result) : 0;
    }

    // validate Mobile
    /******************************************************************************************************************/
    /**
     * @param $mobileNumber
     * @return array|string|string[]|null
     */
    public static function extractMobileNumber($mobileNumber): array|string|null
    {
        $mobile = convertArabicToEnglish($mobileNumber);
        $mobile = convertPersianToEnglish($mobile);

        if (preg_match('/^(\+98|98|0)9\d{9}$/', $mobile)) {
            $type = 0; // 0 => mobile

            //all mobile numbers in one format (9**********)
            $mobile = ltrim($mobile, '0');
            $mobile = substr($mobile, 0, 2) == '98' ? substr($mobile, 2) : $mobile;
            return str_replace('+98', '', $mobile);
        }
        return null;
    }

    // File upload
    /******************************************************************************************************************/
    /**
     * @param string $directoryName
     * @param $file
     * @param $fileService
     * @param string $saveLocation
     * @return array
     */
    public static function saveFileAndMove(string $directoryName, $file, $fileService, string $saveLocation = 'public'): array
    {
        $fileService->setExclusiveDirectory('files' . DIRECTORY_SEPARATOR . $directoryName);
        $fileService->setFileSize($file);
        $fileSize = $fileService->getFileSize();
        if ($saveLocation = 'public') {
            $result = $fileService->moveToPublic($file);
        } elseif ($saveLocation = 'storage') {
            $result = $fileService->moveToStorage($file);
        } else {
            $result = null;
        }
        $fileFormat = $fileService->getFileFormat();
        return [$result, $fileSize, $fileFormat];
    }

    /******************************************************************************************************************/
    /**
     * the primary timestamp is in ms - we should convert this to second then to date
     *
     * @param $date
     * @return string
     */
    public static function realTimestampDateFormat($date): string
    {
        return date("Y-m-d H:i:s", (int)substr($date, 0, 10));
    }

    // Image intervention
    /******************************************************************************************************************/
    /**
     * @param string $directoryName
     * @param $imageFile
     * @param $imageService
     * @return mixed
     */
    public static function saveImage(string $directoryName, $imageFile, $imageService): mixed
    {
        $imageService->setExclusiveDirectory('images' . DIRECTORY_SEPARATOR . $directoryName);
        return $imageService->save($imageFile);
    }

    /**
     * @param string $directoryName
     * @param $imageFile
     * @param $imageService
     * @return mixed
     */
    public static function createIndexAndSaveImage(string $directoryName, $imageFile, $imageService): mixed
    {
        $directoryCreate = $imageService->setExclusiveDirectory('images' . DIRECTORY_SEPARATOR . $directoryName);
//        if (!$directoryCreate) {
//            return 'directory creation failed';
//        }
        return $imageService->createIndexAndSave($imageFile);
    }

    /**
     * @param string $directoryName
     * @param $imageFile
     * @param $width
     * @param $height
     * @param $imageService
     * @return mixed
     */
    public static function fitAndSaveImage(string $directoryName, $imageFile, $width, $height, $imageService): mixed
    {
        $imageService->setExclusiveDirectory('images' . DIRECTORY_SEPARATOR . $directoryName);
        return $imageService->fitAndSave($imageFile, $width, $height);
    }

    /**
     * @param string $directoryName
     * @param $imageFile
     * @param $imageName
     * @param $imageService
     * @return mixed
     */
    public static function saveImageWithName(string $directoryName, $imageFile, $imageName, $imageService): mixed
    {
        $imageService->setExclusiveDirectory('images' . DIRECTORY_SEPARATOR . $directoryName);
        $imageService->setImageName($imageName);
        return $imageService->save($imageFile);
    }

    // image uploads
    /******************************************************************************************************************/

    /**
     * @param $request
     * @param $imageService
     * @param $folderName
     * @param string $imageName
     * @param string $uploadFunctionName
     * @return string|null
     */
    public static function uploadImageOfModel($request, $imageService, $folderName,
                                              string $imageName = 'image', string $uploadFunctionName = 'saveImage'): ?string
    {
        if ($request->hasFile($imageName)) {
            $result = self::$uploadFunctionName($folderName, $request->file($imageName), $imageService);
            if (!$result) {
                return 'upload failed';
            }
            $request->image = $result;
        } else {
            $request->image = null;
        }
        return $request->image;
    }


    // ajax change
    /******************************************************************************************************************/
    /**
     * @param Model $model
     * @return JsonResponse
     */
    public static function changeStatus(Model $model): JsonResponse
    {
        $model->status = $model->status == 0 ? 1 : 0;
        $result = $model->save();
        if ($result) {
            if ($model->status == 0) {
                return response()->json(['status' => true, 'checked' => false]);
            } else {
                return response()->json(['status' => true, 'checked' => true]);
            }
        } else {
            return response()->json(['status' => false]);
        }
    }

    /**
     * @param Model $model
     * @param string $fieldName
     * @return JsonResponse
     */
    public static function ajaxChangeModelSpecialField(Model $model, string $fieldName = 'status'): JsonResponse
    {
        $model->$fieldName = $model->$fieldName == 0 ? 1 : 0;
        $result = $model->save();
        if ($result) {
            if ($model->$fieldName == 0) {
                return response()->json([$fieldName => true, 'checked' => false]);
            } else {
                return response()->json([$fieldName => true, 'checked' => true]);
            }
        } else {
            return response()->json([$fieldName => false]);
        }
    }


    // Sweet Alert
    /******************************************************************************************************************/

    // example:
//        toast('Signed in successfully','success')->timerProgressBar();
    // example:
//        alert()->success('Post Created', 'Successfully')->iconHtml('<i class="far fa-thumbs-up"></i>');
// example:
//       alert()->info('InfoAlert','Lorem ipsum dolor sit amet.')
//            ->animation('animate__animated animate__fadeInDown','animate__animated animate__fadeOutUp')->autoClose(2000);
// example:
//        alert('Title','Lorem Lorem Lorem', 'success')->background('#fff');
// example:
//        alert('Title','Lorem Lorem Lorem', 'success')->width('300px');
// example:
//        alert('Title','Lorem Lorem Lorem', 'success')->width('300px')->padding('50px');
// example:
//        alert()->error('Oops...', 'Something went wrong!')->footer('<a href="#">Why do I have this issue?</a>');
// example:

    // Toast
    /**
     * @param $title
     * @param string $type
     * @param int $timer
     * @return mixed
     */
    public static function showToast($title, string $type = 'success', int $timer = 5000): mixed
    {
        return toast($title, $type)->autoClose($timer)->timerProgressBar();
    }

    /**
     * @param $title
     * @param string $type
     * @param int $timer
     * @return mixed
     */
    public static function showAnimatedToast($title, string $type = 'success', int $timer = 5000): mixed
    {
        return toast($title, $type)->animation('animate__animated animate__fadeInDown', 'animate__animated animate__fadeOutUp')->autoClose($timer)->timerProgressBar();
    }

    /**
     * @param $header
     * @param $body
     * @param string $type
     * @param int $timer
     * @return mixed
     */
    public static function showAnimatedToastWithHtml($header, $body, string $type = 'success', int $timer = 5000): mixed
    {
        return toast()->html($header, $body, $type)->animation('animate__animated animate__fadeInDown', 'animate__animated animate__fadeOutUp')->autoClose($timer)->timerProgressBar();
    }


    // Alert

    /**
     * @param $msg
     * @param string $title
     * @param string $type
     * @param int $timer
     * @return mixed
     */
    public static function showAlert($msg, string $title = 'موفقیت آمیز', string $type = 'success', int $timer = 5000): mixed
    {
        return alert($title, $msg, $type)->autoClose($timer);
    }

    /**
     * @param $msg
     * @param string $title
     * @param string $type
     * @param int $timer
     * @return mixed
     */
    public static function showAnimatedAlert($msg, string $title = 'موفقیت آمیز', string $type = 'success', int $timer = 5000): mixed
    {
        return alert($title, $msg, $type)->animation('animate__animated animate__fadeInDown', 'animate__animated animate__fadeOutUp')->autoClose($timer);
    }

    /**
     * @param $msg
     * @param string $title
     * @param string $type
     * @param int $timer
     * @return mixed
     */
    public static function showAnimatedAlertWithFooter($msg, string $title = 'موفقیت آمیز', string $type = 'success', int $timer = 5000): mixed
    {
        return alert($title, $msg, $type)->animation('animate__animated animate__fadeInDown', 'animate__animated animate__fadeOutUp')
            ->footer('برای ویرایش وارد <a class="text-decoration-none" href="/cart"> <strong>سبد خرید</strong> </a> خود شوید')->autoClose($timer);
    }

    /**
     * @return string
     */
    public static function getSweetTime(): string
    {
        $nowHour = Carbon::parse(now())->format('H');
        $bamdadEndHour = Carbon::parse('05:00:00')->format('H');
        $sobhStartHour = Carbon::parse('07:00:00')->format('H');
        $zohrStartHour = Carbon::parse('12:00:00')->format('H');
        $asrStartHour = Carbon::parse('17:00:00')->format('H');
        $shabStartHour = Carbon::parse('20:00:00')->format('H');
        $payaneRozStartHour = Carbon::parse('24:00:00')->format('H');
        if ($bamdadEndHour <= $nowHour && $sobhStartHour > $nowHour) {
            return 'سلام جغد.';
        } elseif ($sobhStartHour <= $nowHour && $zohrStartHour > $nowHour) {
            return 'صبح بخیر.';
        } elseif ($zohrStartHour <= $nowHour && $asrStartHour > $nowHour) {
            return 'ظهر بخیر.';
        } elseif ($asrStartHour <= $nowHour && $shabStartHour > $nowHour) {
            return 'عصر بخیر.';
        } elseif ($shabStartHour <= $nowHour && $payaneRozStartHour > $nowHour) {
            return 'شب بخیر.';
        } elseif ($payaneRozStartHour <= $nowHour && $bamdadEndHour > $nowHour) {
            return 'بامداد بخیر.';
        }
        return '';
    }
    // Greeting

    /**
     * @return void
     */
    public static function showGreetingToast(): void
    {
        if (self::checkForAdmin()) {
            $body = '';
            $header = '<h5>با سلام ' . self::getSweetTime() . ' ادمین عزیز خوش آمدید.</h5>';

            // 1. get new notifs count
            $notif_repo = new NotificationRepoEloquent();
            $newNotifsCount = $notif_repo->newNotifications()->count();
            if ($newNotifsCount > 0) {
                $body .= '<section class="">';
                $body .= '<i class="fa fa-check mx-2"></i>';
                $body .= '<p class="d-inline">شما ' . '<strong>' . convertEnglishToPersian($newNotifsCount) . '</strong>' . ' پیام جدید دارید.</p>';
                $body .= '</section>';
            }
//            $body .= '<br>';

            // 2. get comments count
            $comment_repo = new CommentRepoEloquent();
            $unseenCommentCount = $comment_repo->latestUnseenCommentWithoutAdmin()->count();
            if ($unseenCommentCount > 0) {
                $body .= '<section class="">';
                $body .= '<i class="fa fa-check mx-2"></i>';
                $body .= '<p class="d-inline">به تعداد ' . '<strong>' . convertEnglishToPersian($unseenCommentCount) . '</strong>' . ' نظر جدید ثبت شده است.</p>';
                $body .= '</section>';
            }

            // 3. get products with low marketable number
            $settingRepo = new SettingRepoEloquent();
            $productCounter = $settingRepo->getSystemSetting()->low_count_products;
            if ($productCounter > 0) {
                $body .= '<section class="">';
                $body .= '<i class="fa fa-check mx-2"></i>';
                $body .= '<p class="d-inline">موجودی ' . '<strong>' . convertEnglishToPersian($productCounter) . '</strong>' . ' تا از کالاها رو به اتمام است.</p>';
                $body .= '</section>';
            }
            self::showAnimatedToastWithHtml($header, $body, 'info', 8000);
        } elseif (auth()->check() && auth()->user()->user_type == User::TYPE_ADMIN) {
            self::showAnimatedToast('با سلام ' . self::getSweetTime() . ' ادمین عزیز خوش آمدید.')->position('top-left');
        } else {
            self::showAnimatedToast('با سلام ' . self::getSweetTime() . ' کاربر عزیز به فروشگاه ما خوش آمدید.')->position('top-left');
        }
    }

    // activity log
    /******************************************************************************************************************/

    /**
     * @param $request
     * @param $model
     * @param string $table
     * @param string $event
     * @return void
     */
    public static function ProductWarehouseReport($request, $model, string $table = "products", string $event = "add-to-store"): void
    {
        switch ($event) {
            case "add-to-store" :
                activity()->causedBy(auth()->id())->performedOn($model)->useLog($table)
                    ->withProperties([
                        'نام کالا ' => $model->name,
                        'فرد دریافت کننده کالا ' => $request->receiver,
                        'فرد تحویل دهنده کالا ' => $request->deliverer,
                        'توضیحات ' => $request->description,
                        'تعداد دریافت شده ' => convertEnglishToPersian($request->marketable_number),
                        'تعداد کالاهای قابل فروش ' => convertEnglishToPersian($model->marketable_number),
                    ])->log('موجودی انبار کالا افزایش یافت');
                break;
            case "update-store" :
                activity()->causedBy(auth()->id())->performedOn($model)->useLog($table)
                    ->withProperties([
                        'نام کالا ' => $model->name,
                        'تعداد کالاهای قابل فروش ' => convertEnglishToPersian($request->marketable_number),
                        'تعداد کالاهای رزرو ' => convertEnglishToPersian($request->frozen_number),
                        'تعداد کالاهای فروخته شده ' => convertEnglishToPersian($request->sold_number),
                    ])->log('موجودی انبار کالا بروزرسانی شد');
                break;
        }
    }

    /**
     * @param $request
     * @param $model
     * @param $color
     * @param string $table
     * @param string $event
     * @return void
     */
    public static function ProductColorWarehouseReport($request, $model, $color, string $table = "product_color", string $event = "create"): void
    {
        switch ($event) {
            case "create" :
                activity()->causedBy(auth()->id())->performedOn($model)->useLog($table)
                    ->withProperties([
                        'نام کالا ' => $model->name,
                        'رنگ کالا ' => $color->getColorName(),
                        'تعداد کالاهای قابل فروش ' => convertEnglishToPersian($request->marketable_number),
                        'تعداد کالاهای رزرو ' => convertEnglishToPersian($request->frozen_number),
                        'تعداد کالاهای فروخته شده ' => convertEnglishToPersian($request->sold_number),
                    ])->log('موجودی انبار کالا افزایش یافت');
                break;
            case "update" :
                activity()->causedBy(auth()->id())->performedOn($model)->useLog($table)
                    ->withProperties([
                        'نام کالا ' => $model->name,
                        'تعداد کالاهای قابل فروش ' => convertEnglishToPersian($request->marketable_number),
                        'تعداد کالاهای رزرو ' => convertEnglishToPersian($request->frozen_number),
                        'تعداد کالاهای فروخته شده ' => convertEnglishToPersian($request->sold_number),
                    ])->log('موجودی انبار کالا بروزرسانی شد');
                break;
        }
    }

    /******************************************************************************************************************/
    /**
     * Convert string to slug.
     *
     * @param string $title
     * @return string
     */
    public static function makeSlug(string $title): string
    {
        return preg_replace('/\s+/', '-', str_replace('_', '', $title));
    }

    /**
     * Make unique sku.
     *
     * @param  $model
     * @return string
     * @throws \Exception
     */
    public static function makeUniqueSku($model): string
    {
        $number = random_int(10000, 99999);

        if ((new self)->checkSKU($model, $number)) {
            return self::makeUniqueSku($model);
        }

        return (string)$number;
    }

    /**
     * Check sku is exists.
     *
     * @param  $model
     * @param int $number
     * @return bool
     */
    private function checkSKU($model, int $number): bool
    {
        return $model::query()->where('sku', $number)->exists();
    }

    /**
     * Upload media with add in request.
     *
     * @param  $request
     * @param string $file
     * @param string $field
     * @return mixed
     */
    public static function uploadMediaWithAddInRequest($request, string $file = 'image', string $field = 'media_id')
    {
        return $request->request->add([$field => MediaFileService::publicUpload($request->file($file))->id]);
    }

    /**
     * Convert text to read minute.
     *
     * @param string $text
     * @return float
     */
    public static function convertTextToReadMinute(string $text): float
    {
        return ceil(str_word_count(strip_tags($text)) / 250);
    }


    /******************************************************************************************************************/
    /**
     * @param $text
     * @return array|string|string[]
     */
    public static function replaceNewLineWithTag($text): array|string
    {
        return str_replace(PHP_EOL, '<br/>', $text);
    }

    /**
     * @param $string
     * @param string $separator
     * @return array|string|null
     */
    public static function GeneratePersianSlug($string, string $separator = '-'): array|string|null
    {
        $_transliteration = array(
            '/ä|æ|ǽ/' => 'ae',
            '/ö|œ/' => 'oe',
            '/ü/' => 'ue',
            '/Ä/' => 'Ae',
            '/Ü/' => 'Ue',
            '/Ö/' => 'Oe',
            '/À|Á|Â|Ã|Å|Ǻ|Ā|Ă|Ą|Ǎ/' => 'A',
            '/à|á|â|ã|å|ǻ|ā|ă|ą|ǎ|ª/' => 'a',
            '/Ç|Ć|Ĉ|Ċ|Č/' => 'C',
            '/ç|ć|ĉ|ċ|č/' => 'c',
            '/Ð|Ď|Đ/' => 'D',
            '/ð|ď|đ/' => 'd',
            '/È|É|Ê|Ë|Ē|Ĕ|Ė|Ę|Ě/' => 'E',
            '/è|é|ê|ë|ē|ĕ|ė|ę|ě/' => 'e',
            '/Ĝ|Ğ|Ġ|Ģ/' => 'G',
            '/ĝ|ğ|ġ|ģ/' => 'g',
            '/Ĥ|Ħ/' => 'H',
            '/ĥ|ħ/' => 'h',
            '/Ì|Í|Î|Ï|Ĩ|Ī|Ĭ|Ǐ|Į|İ/' => 'I',
            '/ì|í|î|ï|ĩ|ī|ĭ|ǐ|į|ı/' => 'i',
            '/Ĵ/' => 'J',
            '/ĵ/' => 'j',
            '/Ķ/' => 'K',
            '/ķ/' => 'k',
            '/Ĺ|Ļ|Ľ|Ŀ|Ł/' => 'L',
            '/ĺ|ļ|ľ|ŀ|ł/' => 'l',
            '/Ñ|Ń|Ņ|Ň/' => 'N',
            '/ñ|ń|ņ|ň|ŉ/' => 'n',
            '/Ò|Ó|Ô|Õ|Ō|Ŏ|Ǒ|Ő|Ơ|Ø|Ǿ/' => 'O',
            '/ò|ó|ô|õ|ō|ŏ|ǒ|ő|ơ|ø|ǿ|º/' => 'o',
            '/Ŕ|Ŗ|Ř/' => 'R',
            '/ŕ|ŗ|ř/' => 'r',
            '/Ś|Ŝ|Ş|Ș|Š/' => 'S',
            '/ś|ŝ|ş|ș|š|ſ/' => 's',
            '/Ţ|Ț|Ť|Ŧ/' => 'T',
            '/ţ|ț|ť|ŧ/' => 't',
            '/Ù|Ú|Û|Ũ|Ū|Ŭ|Ů|Ű|Ų|Ư|Ǔ|Ǖ|Ǘ|Ǚ|Ǜ/' => 'U',
            '/ù|ú|û|ũ|ū|ŭ|ů|ű|ų|ư|ǔ|ǖ|ǘ|ǚ|ǜ/' => 'u',
            '/Ý|Ÿ|Ŷ/' => 'Y',
            '/ý|ÿ|ŷ/' => 'y',
            '/Ŵ/' => 'W',
            '/ŵ/' => 'w',
            '/Ź|Ż|Ž/' => 'Z',
            '/ź|ż|ž/' => 'z',
            '/Æ|Ǽ/' => 'AE',
            '/ß/' => 'ss',
            '/Ĳ/' => 'IJ',
            '/ĳ/' => 'ij',
            '/Œ/' => 'OE',
            '/ƒ/' => 'f'
        );

        $quotedReplacement = preg_quote($separator, '/');
        $merge = array(
            '/[^\s\p{Zs}\p{Ll}\p{Lm}\p{Lo}\p{Lt}\p{Lu}\p{Nd}]/mu' => ' ',
            '/[\s\p{Zs}]+/mu' => $separator,
            sprintf('/^[%s]+|[%s]+$/', $quotedReplacement, $quotedReplacement) => '',
        );
        $map = $_transliteration + $merge;
        unset($_transliteration);
        return preg_replace(array_keys($map), array_values($map), $string);
    }

    /**
     * @param $title
     * @param $description
     * @param $keywords
     * @return void
     */
    public static function setBasicSeoMetas($title, $description, $keywords): void
    {
        SEOMeta::setKeywords($keywords);
        SEOTools::setTitle($title);
        SEOTools::setDescription($description);
    }
}
