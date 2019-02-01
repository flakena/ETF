<?php

if (!function_exists('getRealIp')) {
    function getRealIp()
    {
        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        return $ip;
    }
}

if (!function_exists('get_string_between')) {
    function get_string_between($string, $start, $end)
    {
        $contents = array();
        $startDelimiterLength = strlen($start);
        $endDelimiterLength = strlen($end);
        $startFrom = $contentStart = $contentEnd = 0;
        while (false !== ($contentStart = strpos($string, $start, $startFrom))) {
            $contentStart += $startDelimiterLength;
            $contentEnd = strpos($string, $end, $contentStart);
            if (false === $contentEnd) {
                break;
            }
            $contents[] = substr($string, $contentStart, $contentEnd - $contentStart);

            $startFrom = $contentEnd + $endDelimiterLength;
        }

        if (count($contents)) {
            foreach ($contents as $key => $value) {
                if (trim($value) == '__construct') {
                    unset($contents[$key]);
                }
            }
        }
        return $contents;
    }
}