<?php

if (!function_exists('get_string_between')) {
    function get_string_between($string, $start, $end)
    {
        $regex = '/' . $start . '(.*)' . $end .'/';
        preg_match($regex,$string,$match);
        return !empty($match[1]);
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
            CURLOPT_NOBODY => true,
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
    function parseETF($url, $cookies)
    {
        $curl = curl_init();
        $curlOpts = array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
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
