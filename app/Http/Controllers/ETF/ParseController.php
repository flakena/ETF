<?php

namespace App\Http\Controllers\ETF;

use App\Models\ETF;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Validator;

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
     * @var string
     */
    private $etfHoldings = '';

    /**
     * @param ETF $ETF
     */
    public function index(ETF $ETF)
    {


        //(Cache::get('ETFCookie') != null) ? Cache::get('ETFCookie') :

    }


    /**
     * @param $etf
     */
    public function getETFInfo($etf)
    {
        $etfArr = [];
        $holdings = [];
        $weightArr = [];
        $sectorsArr = [];

        $dom = new \DOMDocument('1.0');
        @$dom->loadHTML(html_entity_decode($etf->content));
        $xpath = new \DOMXPath($dom);

        //Queries for parsing Current ETF page
        $etfName = $xpath->query('//h1');
        $etfInfo = $xpath->query('//div[@class="keyfeatures"]');
        $etfHoldingsLabels = $xpath->query('//div[@class="col-xs-12 col-sm-6 top-holdings"][1]/descendant::table[1]//td[@class="label"]');
        $etfHoldingsWeights = $xpath->query('//div[@class="col-xs-12 col-sm-6 top-holdings"][1]/descendant::table[1]//td[@class="weight"]');
        $etfSectors = $xpath->query('//div[@id="holdings"][1]/descendant::table[last()]//td');

        $html = $this->etfInfo;
        $xml = get_string_between($html, '<div style="display: none">', '</div>');


        //Get Sector Weights
        if ($xml) {
            foreach ($xml as $string) {
                $string = html_entity_decode($string);
                $xmlArray = new \SimpleXMLElement($string);
                if ($xmlArray->code == 'FUND_SECTOR_ALLOCATION') {
                    foreach ($xmlArray->attributes as $value) {
                        foreach ($value as $item) {
                            $etf->sectorWeights()->create([
                                'label' => $item->label,
                                'weight' => $item->rawValue,
                                'order' => $item->order,
                            ]);
                        }
                    }
                }
            }
        }

        //Get ETF country weight
        $tmpCountryWeightsArr = [];
        if ($etfSectors) {
            $i = 1;
            foreach ($etfSectors as $sector) {
                $tmpCountryWeightsArr += [$i => str_replace('%', '', $sector->nodeValue)];
                $i++;
            }
        }

        for ($i = 1; $i <= count($tmpCountryWeightsArr); $i++) {
            if ($i % 2 == 0) {
                $etf->countryWeights()->create(
                    [
                        'name' => $tmpCountryWeightsArr[$i - 1],
                        'weight' => $tmpCountryWeightsArr[$i]
                    ]);
            }
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
                $etf->holdings()->create(
                    [
                        'name' => $label->nodeValue,
                        'weight' => $weightArr[$i]
                    ]);
                $i++;
            }
        }
        //Get ETF Name

        if (count($etfName)) {
            $etfArr += ['name' => trim($etfName[0]->nodeValue)];
        }

        //Get ETF Description
        if (count($etfInfo)) {
            $etfArr += ['description' => trim($etfInfo[0]->nodeValue)];
        }

        $etf->update($etfArr);

    }
    private function getHtmlContent($url)
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
            return $response;
        }
    }

    /**
     * @param $url
     */
    private function getCurrentETF($url)
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
            echo "cURL Error :" . $err;
        } else {
            $this->etfIndexHtml = $response;
        }
    }



}
