<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\DomCrawler\Crawler;

class HomeController extends Controller
{
    /**
     * @var string
     */
    private  $seamFile = 'https://www.spdrs.com/product/fund.seam?ticker=';
    /**
     * @var string
     */
    private  $formUrl = 'https://us.spdrs.com/seam/resource/isdResource?investorForm=investorForm&investorForm:selectedKey=us&investorForm:selectedLanguage=en&investorForm:selectedRole=DEFAULT&investorForm:selectedRoleKey=DEF&investorForm:selectedAction=&investorForm:selectedURL=https://us.spdrs.com&investorForm:currentURL=https://global.spdrs.com/&javax.faces.ViewState=9G/oCv3xPobM0IGeD4F46OGtMgPRPckB4mkne/K3XM8SbrrsOx1wqwfsS51UfYQqXtCp274p9OD25ZJK+RjD/FjdTYEYTnu0OMrLsKRUgSLcD6pSaTcx0Cky//wZJh6PcBH0wW85Ytd38k/S2AIHZkp1SQfRiiSl70UBYeoLeEAU74MGcqenm8jI8WsR3UicuAwejVk9ubgjma1lcM9B/0IoKKhLj6Tbrw7XtJ2rr+VFw1Mt71zxEtH3u9gogowq7ceNxer22dOjIYZ9x/lsucz/f/Hvi9Ts8EEhf9DnhzoDwp3AUTaJfnetFCmgpNqyXyw3TRWk1IbfpB9HXFwWRGaSWZC8iwW0Pm924xhPeCV4wkmZgKEfoL89nBmHTd0hBKQ6jO/yi7JIb/kQyVh0q+5az/DljnKCihrUIwcMPGSxNUjME8DIfl7b4uIhc7r+GntlwnUcLBcZBidM0G3Z1RRNAOy85zsqT87KANsijmkRQYx396VPNewQRIR47a0t/1U9hPVLYgISRhCBXJSdKY4SSdYmr252JEOmyZYbaWQsJ5KTTifnvRxCMa0LzRnw2fs8ccPo8Sn7fPOoo4RoBWBhircurIWHDHw8hyz26u5GaspR/ccLc4s1eie84S66cxsJIN+H0w9QHxPx6UEn5HQs4G/fuyliV53sh5P1v+wP0Lc9ar45npK6TtVEp2rxZCYE1CcTcilXixX3Mtjkgz3nsFNdsy9jOneQ8kmqRXxpaeq4NU6w8dUE7ONLh/ZINEsoyPRFiYKDZGfNV84gdYxRh/g89HxsqkEU2vQwpI+7neO64OezuQOTNXWP6yksIMKxcI502ZevRkVTB13KW0j8od73Zk6qxEz2y80QWCQzaWgSIfsjZghKfAhvTzQZ5NcnBGikvRfLRSFoqY4Te5Zj5tsJW5wYJf/fL4VVjsxAUUzVnuDxrAcXsCh4yBUpxdIQ9VwadwUIRAz9p4UKxvKYYK7BNfH6I8BnXveQ4tq7D0tSIYpGPS6Kn/AYzb6fMmR8ydUdwLsK2ohR7inabAZ2rhVSCQMoQtQtJDR63dWFe9vvQn2Sw7mGg1uaqVPcFNMhxlGlV7RKEB7Cz6mdKQ==';

    /**
     * Var for storing all the cookies returned from parsed website
     *
     * @var array
     */
    private $brCookies = array();

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
//        $this->getPermissionCookies();
//        $this->parseETFs($this->seamFile);

        return view('home');
    }


    private function parseETFs($url)
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
            ), $this->brCookies),
        );
        curl_setopt_array($curl, $curlOpts);
        $response = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);
        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
            return $response;
        }
    }

    private function getPermissionCookies()
    {

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => $this->formUrl,
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
        $this->getCookies($response);
        curl_close($curl);
        $this->parseETFs($this->seamFile);
    }

    private function getCookies($result){
        preg_match_all('/^Set-Cookie:\s*([^;]*)/mi', $result, $matches);
        $cookies = array();

        foreach($matches[1] as $item) {
            $item = 'Cookie: '. $item;
//            parse_str($item, $cookie);
            array_push($cookies,$item);
        }

        $this->brCookies = array_merge($this->brCookies, $cookies);

    }
}
