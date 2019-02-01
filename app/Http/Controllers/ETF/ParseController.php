<?php

namespace App\Http\Controllers\ETF;

use App\Models\ETF;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ParseController extends Controller
{
    /**
     * Var for storing all the cookies returned from parsed website
     *
     * @var array
     */
    private $brCookies = [];

    /**
     * Var for storing etf index html response from parsed website
     * @var string
     */
    private $etfIndexHtml = '';

    /**
     * Var for storing etf information from parsed website
     * @var string
     */
    private $etfInfo = '';

    /**
     *
     */
    public function index(ETF $ETF)
    {
        $this->getPermissionCookies();
        $this->parseETFs(config('etf.parseLinks')['seamFile']);

        $dom = new \DOMDocument('1.0');
        @$dom->loadHTML(htmlspecialchars_decode($this->etfIndexHtml));
        $xpath = new \DOMXPath($dom);
        $etfs = $xpath->query('//tr[@class="fund"]/td[@class="f_ticker"]');
        if ($etfs) {
            foreach ($etfs as $etf) {
//                $arr = $this->getETFInfo($etf->nodeValue);
//                $ETF->create(['name' => $etf->nodeValue]);
            }
        }
    }


    /**
     *
     */
    public function getETFInfo()
    {
        $etfArr = [];
        $holdings = [];
        $weightArr = [];
        $sectorsArr = [];

        $this->getPermissionCookies();
        $this->getCurrentETF(config('etf.parseLinks')['currentETFLink'] . 'CWI');
        $dom = new \DOMDocument('1.0');
        @$dom->loadHTML(htmlspecialchars_decode($this->etfInfo));
        $xpath = new \DOMXPath($dom);
        $etfName = $xpath->query('//h1');
        $etfInfo = $xpath->query('//div[@class="keyfeatures"]');
//        [//td[@class="data"] and //td[@class="label"] and //td[@class="weight"]]
        $etfHoldingsLabels = $xpath->query('//div[@class="col-xs-12 col-sm-6 top-holdings"][1]/descendant::table[1]//td[@class="label"]');
        $etfHoldingsWeights = $xpath->query('//div[@class="col-xs-12 col-sm-6 top-holdings"][1]/descendant::table[1]//td[@class="weight"]');
        $etfSectors = $xpath->query('//div[@id="holdings"][1]/descendant::table[last()]//td');

        $tmpSectArr = [];
        if ($etfSectors) {
            $i = 1;
            foreach ($etfSectors as $sector) {
                $tmpSectArr += [$i => str_replace('%', '', $sector->nodeValue)];
                $i++;
            }
        }
        for ($i = 1; $i <= count($tmpSectArr); $i++) {
            if ($i % 2 == 0) {
                $sectorsArr += [$tmpSectArr[$i - 1] => $tmpSectArr[$i]];
            }
        }



        if ($etfName) {
            $etfArr += ['name' => trim($etfName[0]->nodeValue)];
        }
        if ($etfInfo) {
            $etfArr += ['description' => trim($etfInfo[0]->nodeValue)];
        }
        if ($etfHoldingsWeights) {
            $i = 1;
            foreach ($etfHoldingsWeights as $weight) {
                $weightArr += [$i => str_replace('%', '', $weight->nodeValue)];
                $i++;
            }
        }

        if ($etfHoldingsLabels) {
            $i = 1;
            foreach ($etfHoldingsLabels as $label) {
                $holdings += [$label->nodeValue => [
                    'name' => $label->nodeValue,
                    'weight' => $weightArr[$i]
                ]];
                $i++;
            }
        }
        dump($holdings);

    }


    /**
     * @param $url
     */
    private
    function getCurrentETF($url)
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
            echo "cURL Error :" . $err;
        } else {
            $this->etfInfo = $response;
        }
    }

    /**
     * @param $url
     * @return mixed
     */
    private
    function parseETFs($url)
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
            echo "cURL Error :" . $err;
        } else {
            $this->etfIndexHtml = $response;
        }
    }

    /**
     *
     */
    private
    function getPermissionCookies()
    {
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => config('etf.parseLinks')['locationForm'],
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
    }

    /**
     * @param $result
     */
    private
    function getCookies($result)
    {
        preg_match_all('/^Set-Cookie:\s*([^;]*)/mi', $result, $matches);
        $cookies = array();
        foreach ($matches[1] as $item) {
            $item = 'Cookie: ' . $item;
            array_push($cookies, $item);
        }
        $this->brCookies = array_merge($this->brCookies, $cookies);
    }

}
