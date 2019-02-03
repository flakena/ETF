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

if (!function_exists('getPermissionCookies')) {
    function getPermissionCookies()
    {
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => config('etf.locationForm'),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HEADER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => ""
        ));

        $response = curl_exec($curl);
        curl_close($curl);
        return getCookies($response);
    }
}

if (!function_exists('getCookies')) {
    /**
     * @param $result
     * @return mixed
     */
    function getCookies($result)
    {
        preg_match_all('/^Set-Cookie:\s*([^;]*)/mi', $result, $matches);
        $cookies = array();
        foreach ($matches[1] as $item) {
            $item = 'Cookie: ' . $item;
            array_push($cookies, $item);
        }
        return $cookies;
    }

}

if (!function_exists('parseETFs')) {
    /**
     * @param $url
     * @param $cookies
     * @return mixed
     */
    function parseETFs($url, $cookies)
    {
        $curl = curl_init();
        $curlOpts = array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_VERBOSE => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_POSTFIELDS => "",
            CURLOPT_COOKIESESSION => 96,
            CURLOPT_HTTPHEADER => array_merge(array(
                "cache-control: no-cache"
            ), $cookies),
        );
        curl_setopt_array($curl, $curlOpts);
        $response = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);
        if ($err) {
            activity()
                ->withProperties([
                    'ip' => getRealIp(),
                ])->log("cURL Error :" . $err);
        } else {
            return $response;
        }
    }
}

if (!function_exists('array_to_string')) {
    function array_to_string($file, $space = '')
    {
        $text = '';
        if ($file) {
            foreach ($file as $key => $value) {
                if (is_array($value)) {
                    if (count($value)) {
                        $text .= "\t" . "'" . $key . "' => [" . "\r\n";
                        $text .= array_to_string($value, "\t");
                        $text .= $space . "\t" . "\t" . "]," . "\r\n";
                    } else {
                        $text .= "\t" . "'" . $key . "' => " . "[]," . "\r\n";
                    }
                } else {
                    if (is_bool($value)) {
                        $text .= $space . "\t" . "'" . $key . "' => " . '' . $value . ',' . "\r\n";
                    } else {
                        $text .= $space . "\t" . "'" . $key . "' => " . '"' . $value . '",' . "\r\n";
                    }
                }
            }
        }
        return $text;
    }
}
