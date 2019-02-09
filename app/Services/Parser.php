<?php

namespace App\Services;

use App\Models\Etf;
use \GuzzleHttp\Client;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Validator;

class Parser
{
    protected $disclaimerUrl;
    protected $http;
    protected $cookies;
    protected $listUrl;

    /**
     * Parser constructor.
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function __construct()
    {
        $this->disclaimerUrl = config('etf.disclaimerUrl');
        $this->http = new Client(['cookies' => true]);
        $this->cookies = $this->getCookies();
        $this->listUrl = config('etf.listUrl');
    }

    /**
     * @return array|mixed|null
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    private function getCookies()
    {
        try {
            $this->http->request('POST', $this->disclaimerUrl);
            $cookieJar = $this->http->getConfig('cookies');
            $cookieJar->toArray();
        } catch (\Exception $exception) {
            activity()
                ->withProperties([
                    'code' => $exception->getCode()
                ])->log($exception->getMessage());
        }
        return ($cookieJar) ? $cookieJar : null;
    }

    /**
     * @param $url
     * @return \DOMDocument|string
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    private function getResponse($url)
    {
        $response = '';
        try {
            $response = $this->http->request('GET', $url, [
                'cookies' => $this->cookies
            ]);
        } catch (\Exception $exception) {
            activity()
                ->withProperties([
                    'code' => $exception->getCode()
                ])->log($exception->getMessage());
        }
        return ($response) ? $this->loadHtml($response->getBody()->getContents()) : '';
    }

    /**
     * @param $etf
     * @return mixed
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    function getParsedETF($etf)
    {
        $url = config('etf.currentETFUrl') . $etf->symbol;
        $response = $this->getResponse($url);
        $xpath = new \DOMXPath($this->loadHtml($response->saveXML()));
        $cwNames = $xpath->query('//h2[normalize-space(text()) = "Fund Country Weights"]//following-sibling::table[1]//td[@class="label"]');
        $cwWeights = $xpath->query('//h2[normalize-space(text()) = "Fund Country Weights"]//following-sibling::table[1]//td[@class="data"]');

        $hdsNames = $xpath->query('//div[@class="col-xs-12 col-sm-6 top-holdings"][1]/descendant::table[1]//td[@class="label"]');
        $hdsWeights = $xpath->query('//div[@class="col-xs-12 col-sm-6 top-holdings"][1]/descendant::table[1]//td[@class="weight"]');

        //Set description for ETF
        if (empty($etf->description)) {
            $description = $xpath->query('//div[@class="keyfeatures"]');
            if ($description->length) {
                $etf->update(['description' => $description[0]->nodeValue]);
            }
        }

        //Set sector Weights
        $this->getSectorWeights($response, $etf);

        //Set Country Weights for ETF
        $this->getCountryWeights($cwNames, $cwWeights, $etf);

        //Set Holdings for ETF
        $this->getHoldings($hdsNames, $hdsWeights, $etf);

        return $etf->load(['holdings', 'countryWeights', 'sectorWeights']);
    }

    /**
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    function getETFs()
    {
        try {
            $response = $this->getResponse($this->listUrl);
            if ($response) {
                $xpath = new \DOMXPath($response);

                $etfSymbols = $xpath->query('//tr[@class="fund"]/td[@class="f_ticker"]');
                $etfNames = $xpath->query('//tr[@class="fund"]/td[@class="f_name"]');

                if ($etfSymbols) {
                    for ($i = 0; $i < $etfSymbols->length; $i++) {

                        $arr = [
                            'name' => trim($etfNames[$i]->nodeValue),
                            'symbol' => $etfSymbols[$i]->nodeValue
                        ];

                        $validator = Validator::make($arr, [
                            'symbol' => 'required|unique:etfs'
                        ]);

                        if (!$validator->fails()) {
                            Etf::create($arr);
                        }
                    }
                    Cache::rememberForever('parsed', function () {
                        return true;
                    });
                }
            }
        } catch
        (\Exception $exception) {
            activity()
                ->withProperties([
                    'code' => $exception->getCode()
                ])->log($exception->getMessage());
        }
    }

    /**
     * @param $response
     * @return \DOMDocument
     */
    private function loadHtml($response)
    {
        $dom = new \DOMDocument('1.0');
        try {
            $dom->loadHTML($response);
        } catch (\Exception $exception) {
            activity()
                ->withProperties([
                    'code' => $exception->getCode()
                ])->log($exception->getMessage());
        }
        return $dom;
    }

    /**
     * @param $html
     * @param $Etf
     */
    private function getSectorWeights($html, $Etf)
    {
        if (!$Etf->sectorWeights()->count()) {
            $xml = $this->get_string_between($html->saveXML(), '<div style="display: none">', '<\/div>');
            if (!empty($xml)) {
                $xmlObject = html_entity_decode($xml);
                $xmlArray = new \SimpleXMLElement($xmlObject);
                if ($xmlArray->code == 'FUND_SECTOR_ALLOCATION') {
                    foreach ($xmlArray->attributes as $value) {
                        foreach ($value as $item) {
                            $Etf->sectorWeights()->create([
                                'label' => $item->label,
                                'weight' => $item->rawValue,
                                'order' => $item->order,
                            ]);
                        }
                    }
                }
            }
        }
    }

    /**
     * @param $cwNames
     * @param $cwWeights
     * @param $Etf
     */
    private function getCountryWeights($cwNames, $cwWeights, $Etf)
    {
        if (!$Etf->countryWeights()->count()) {
            if ($cwNames) {
                for ($i = 0; $i < $cwNames->length; $i++) {
                    $Etf->countryWeights()->create(
                        [
                            'name' => $cwNames[$i]->nodeValue,
                            'weight' => str_replace('%', '', $cwWeights[$i]->nodeValue)
                        ]);
                }
            }
        }
    }

    /**
     * @param $hdsNames
     * @param $hdsWeights
     * @param $Etf
     */
    private function getHoldings($hdsNames, $hdsWeights, $Etf)
    {
        if (!$Etf->holdings()->count()) {
            if ($hdsNames) {
                for ($i = 0; $i < $hdsNames->length; $i++) {
                    $Etf->holdings()->create(
                        [
                            'name' => $hdsNames[$i]->nodeValue,
                            'weight' => str_replace('%', '', $hdsWeights[$i]->nodeValue)
                        ]);
                }
            }
        }
    }

    private function get_string_between($string, $start, $end)
    {
        $regex = '/' . $start . '(.*)' . $end . '/';
        preg_match($regex, $string, $match);
        return !empty($match[1]) ? $match[1] : '';
    }

}

