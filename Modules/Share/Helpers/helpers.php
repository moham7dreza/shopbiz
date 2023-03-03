<?php

use Morilog\Jalali\Jalalian;

/**
 * @param $date
 * @param string $format
 * @return string
 */
function jalaliDate($date, string $format = '%A, %d %B %Y'): string
{
    return convertEnglishToPersian(Jalalian::forge($date)->format($format));
}

/**
 * @param $number
 * @return array|string
 */
function convertPersianToEnglish($number): array|string
{
    $number = str_replace('۰', '0', $number);
    $number = str_replace('۱', '1', $number);
    $number = str_replace('۲', '2', $number);
    $number = str_replace('۳', '3', $number);
    $number = str_replace('۴', '4', $number);
    $number = str_replace('۵', '5', $number);
    $number = str_replace('۶', '6', $number);
    $number = str_replace('۷', '7', $number);
    $number = str_replace('۸', '8', $number);
    return str_replace('۹', '9', $number);
}


/**
 * @param $number
 * @return array|string
 */
function convertArabicToEnglish($number): array|string
{
    $number = str_replace('۰', '0', $number);
    $number = str_replace('۱', '1', $number);
    $number = str_replace('۲', '2', $number);
    $number = str_replace('۳', '3', $number);
    $number = str_replace('۴', '4', $number);
    $number = str_replace('۵', '5', $number);
    $number = str_replace('۶', '6', $number);
    $number = str_replace('۷', '7', $number);
    $number = str_replace('۸', '8', $number);
    return str_replace('۹', '9', $number);
}


/**
 * @param $number
 * @return array|string
 */
function convertEnglishToPersian($number): array|string
{
    $number = str_replace('0', '۰', $number);
    $number = str_replace('1', '۱', $number);
    $number = str_replace('2', '۲', $number);
    $number = str_replace('3', '۳', $number);
    $number = str_replace('4', '۴', $number);
    $number = str_replace('5', '۵', $number);
    $number = str_replace('6', '۶', $number);
    $number = str_replace('7', '۷', $number);
    $number = str_replace('8', '۸', $number);
    return str_replace('9', '۹', $number);
}


/**
 * @param $price
 * @return array|string|string[]
 */
function priceFormat($price): array|string
{
    $price = number_format($price, 0, '/', '،');
    return convertEnglishToPersian($price);
}


/**
 * @param $nationalCode
 * @return bool
 */
function validateNationalCode($nationalCode): bool
{
    $nationalCode = trim($nationalCode, ' .');
    $nationalCode = convertArabicToEnglish($nationalCode);
    $nationalCode = convertPersianToEnglish($nationalCode);
    $bannedArray = ['0000000000', '1111111111', '2222222222', '3333333333', '4444444444', '5555555555', '6666666666', '7777777777', '8888888888', '9999999999'];

    if (empty($nationalCode)) {
        return false;
    } else if (count(str_split($nationalCode)) != 10) {
        return false;
    } else if (in_array($nationalCode, $bannedArray)) {
        return false;
    } else {

        $sum = 0;

        for ($i = 0; $i < 9; $i++) {
            // 1234567890
            $sum += (int)$nationalCode[$i] * (10 - $i);
        }

        $divideRemaining = $sum % 11;

        if ($divideRemaining < 2) {
            $lastDigit = $divideRemaining;
        } else {
            $lastDigit = 11 - ($divideRemaining);
        }

        if ((int)$nationalCode[9] == $lastDigit) {
            return true;
        } else {
            return false;
        }

    }
}

/**
 * @param $size
 * @param $unit
 * @return array|string
 */
function convert($size, $unit): array|string
{
    $fileSize = 0;

    if ($unit == "Byte") {
        $fileSize = round($size, 4);
        if ($fileSize > 1024) {
            convert($fileSize, "KB");
        } else {
            return convertEnglishToPersian($fileSize) . ' بایت ';
        }
    } elseif ($unit == "KB") {
        $fileSize = round($size / 1024, 4);
        if ($fileSize > 1024) {
            convert($fileSize, "MB");
        } else {
            return convertEnglishToPersian($fileSize) . ' کیلوبایت ';
        }
    } elseif ($unit == "MB") {
        $fileSize = round($size / 1024 / 1024, 4);
        if ($fileSize > 1024) {
            convert($fileSize, "GB");
        } else {
            return convertEnglishToPersian($fileSize) . ' مگابایت ';
        }
    } elseif ($unit == "GB") {
        $fileSize = round($size / 1024 / 1024 / 1024, 4);
        return convertEnglishToPersian($fileSize) . ' گیگابایت ';
    }
    return convertEnglishToPersian($fileSize);
}

if (!function_exists('get_value_enums')) {
    /**
     * Get value from enums file.
     *
     * @param array $data
     * @return array
     */
    function get_value_enums(array $data): array
    {
        $values = [];

        foreach ($data as $value) {
            $values[] = $value->value;
        }

        return $values;
    }
}

if (!function_exists('startWith')) {
    /**
     * Check start with character.
     *
     * @param string $string
     * @param string $startString
     * @return bool
     */
    function startWith(string $string, string $startString): bool
    {
        return (str_starts_with($string, $startString));
    }
}

if (!function_exists('router')) {
    /**
     * Check start with character.
     *
     * @param string $key
     * @return string
     */
    function router(string $key): string
    {
        return route(config($key));
    }
}

/**
 * @param $permission
 * @return mixed
 */
function get_per_name($permission): mixed
{
    return $permission['name'];
}

/**
 * @param $count
 * @return float
 */
function getAdditionalRateNumber($count): float
{
    $rate = 1;
    if ($count <= 10) {
        return $rate += 0.05;
    } elseif ($count > 11 && $count <= 100) {
        return $rate += 0.1;
    } else if ($count > 101 && $count <= 200) {
        return $rate += 0.2;
    } else {
        return $rate += 0.3;
    }
}

function hezarGan($price, $index)
{

}

/**
 * @param $price
 * @return string
 */
function sadGan($price): string
{
    return match ($price) {
        1 => 'صد',
        2 => 'دویست',
        3 => 'سیصد',
        4 => 'چهارصد',
        5 => 'پانصد',
        6 => 'ششصد',
        7 => 'هفتصد',
        8 => 'هشتصد',
        9 => 'نهصد',
        default => ' ',
    };
}

/**
 * @param $array
 * @param $index
 * @return string
 */
function dahGan($array, $index): string
{
    if ($array[$index] == 1) {
        return match ($array[$index + 1]) {
            0 => 'ده',
            1 => 'یازده',
            2 => 'دوازده',
            3 => 'سیزده',
            4 => 'چهارده',
            5 => 'پانزده',
            6 => 'شانزده',
            7 => 'هفده',
            8 => 'هجده',
            9 => 'نوزده',
            default => ' ',
        };
    } else {
        $result = match ($array[$index]) {
            2 => 'بیست',
            3 => 'سی',
            4 => 'چهل',
            5 => 'پنجاه',
            6 => 'شصت',
            7 => 'هفتاد',
            8 => 'هشتاد',
            9 => 'نود',
            default => ' ',
        };
        if ($array[$index + 1] != 0) {
            $result .= ' و ';
            $result .= yekan($array[$index + 1]);
        }
        return $result;
    }
}

/**
 * @param $price
 * @return string
 */
function yekan($price): string
{
    return match ($price) {
        1 => 'یک',
        2 => 'دو',
        3 => 'سه',
        4 => 'چهار',
        5 => 'پنج',
        6 => 'شش',
        7 => 'هفت',
        8 => 'هشت',
        9 => 'نه',
        default => ' ',
    };
}

/**
 * @param $price
 * @return string
 */
function generateReadingPrice($price): string
{
    $result = '';
    $array = array_map('intval', str_split($price));
    $len = count($array);
    if ($len <= 3) {
        $result .= sadGan($array[0]); // صد
        if ($array[1] != 0 || $array[2] != 0) {
            $result .= ' و ';   // صد و
        }
        if ($array[1] != 0) {   // 121
            $result .= dahGan($array, 1);   // صد و بیست و یک
        } elseif ($array[2] != 0) {    // 101
            $result .= yekan($array[2]);    // صد و یک
        }
    }
    elseif ($len <= 4) {
        $result .= yekan($array[0]);
        $result .= ' هزار';
        if ($array[1] != 0 || $array[2] != 0 || $array[3] != 0) {
            $result .= ' و ';   // صد و
        }
        $result .= generateReadingPrice(implode("", array_splice($array, 1, $len - 1)));
    } elseif ($len <= 5) {
        $result .= dahGan($array, 0);
        $result .= ' هزار';
        if ($array[2] != 0 || $array[3] != 0 || $array[4] != 0) {
            $result .= ' و ';   // صد و
        }
        $result .= generateReadingPrice(implode("", array_splice($array, 2, $len - 2)));
    } elseif ($len <= 6) {
        // 121
        $result .= sadGan($array[0]); // صد
        if ($array[1] != 0 || $array[2] != 0) {
            $result .= ' و ';   // صد و
        }
        if ($array[1] != 0) {   // 121
            $result .= dahGan($array, 1);   // صد و بیست و یک
        } elseif ($array[2] != 0) {    // 101
            $result .= yekan($array[2]);    // صد و یک
        }
        $result .= ' هزار';
        if ($array[3] != 0 || $array[4] != 0 || $array[5] != 0) {
            $result .= ' و ';   // صد و
        }
        $result .= generateReadingPrice(implode("", array_splice($array, 3, $len - 3)));
    } elseif ($len <= 7) {
        // 2 600 000
        $result .= yekan($array[0]);
        $result .= ' میلیون';
        if ($array[1] != 0 || $array[2] != 0 || $array[3] != 0) {
            $result .= ' و ';   // صد و
        }
        $result .= generateReadingPrice(implode("", array_splice($array, 1, $len - 1)));
    } elseif ($len <= 8) {
        $result .= dahGan($array, 0);
        $result .= ' میلیون';
        if ($array[2] != 0 || $array[3] != 0 || $array[4] != 0) {
            $result .= ' و ';   // صد و
        }
        $result .= generateReadingPrice(implode("", array_splice($array, 2, $len - 2)));
    } elseif ($len <= 9) {
        $result .= sadGan($array[0]); // صد
        if ($array[1] != 0 || $array[2] != 0) {
            $result .= ' و ';   // صد و
        }
        if ($array[1] != 0) {   // 121
            $result .= dahGan($array, 1);   // صد و بیست و یک
        } elseif ($array[2] != 0) {    // 101
            $result .= yekan($array[2]);    // صد و یک
        }
        $result .= ' میلیون';
        if ($array[3] != 0 || $array[4] != 0 || $array[5] != 0) {
            $result .= ' و ';   // صد و
        }
        $result .= generateReadingPrice(implode("", array_splice($array, 3, $len - 3)));
    }
    return $result;
}
