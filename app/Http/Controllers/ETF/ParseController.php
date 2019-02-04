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
     * @param $id
     * @return mixed
     */
    public function parseCurrentEtf($id)
    {
        $ETF = ETF::where('id', $id)->with(['holdings', 'countryWeights', 'sectorWeights'])->first();
        activity()
            ->causedBy(auth()->user()->id)
            ->performedOn($ETF)
            ->withProperties(['IP' => getRealIp()])
            ->log($ETF->symbol.' : '.$ETF->name);

        if ($ETF->holdings()->count() && $ETF->countryWeights()->count() && $ETF->sectorWeights()->count()) {
            return $ETF;
        }
        $cookies = getPermissionCookies();
        $url = config('etf.currentETFLink') . $ETF->symbol;
        $html = parseETF($url, $cookies);

        $dom = new \DOMDocument('1.0');
        @$dom->loadHTML(html_entity_decode($html));
        $xpath = new \DOMXPath($dom);
        $cw = $xpath->query('//div[@id="holdings"][1]/descendant::table[last()]//td');
        $hds = $xpath->query('//div[@class="col-xs-12 col-sm-6 top-holdings"][1]/descendant::table[1]//td');

        //Set description for ETF
        if (empty($ETF->description)) {
            $description = $xpath->query('//div[@class="keyfeatures"]');
            $ETF->update(['description' => $description[0]->nodeValue]);
        }

        //Set sector Weights
        $this->getSectorWeights($html, $ETF);


        //Set Country Weights for ETF
        $this->getCountryWeights($cw, $ETF);

        //Set Holdings for ETF
        $this->getHoldings($hds, $ETF);

        return $ETF->load(['holdings', 'countryWeights', 'sectorWeights']);
    }

    /**
     * @param $html
     * @param $ETF
     */
    private function getSectorWeights($html, $ETF)
    {
        if (!$ETF->sectorWeights()->count()) {
            $xml = get_string_between($html, '<div style="display: none">', '</div>');
            if ($xml) {
                foreach ($xml as $string) {
                    $string = html_entity_decode($string);
                    $xmlArray = new \SimpleXMLElement($string);
                    if ($xmlArray->code == 'FUND_SECTOR_ALLOCATION') {
                        foreach ($xmlArray->attributes as $value) {
                            foreach ($value as $item) {
                                $ETF->sectorWeights()->create([
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
    }

    /**
     * @param $cw
     * @param $ETF
     */
    private function getCountryWeights($cw, $ETF)
    {
        if (!$ETF->countryWeights()->count()) {
            if ($cw) {
                for ($i = 0; $i < $cw->length; $i += 2) {
                    $ETF->countryWeights()->create(
                        [
                            'name' => $cw[$i]->nodeValue,
                            'weight' => str_replace('%', '', $cw[$i + 1]->nodeValue)
                        ]);
                }
            }
        }
    }

    /**
     * @param $cw
     * @param $ETF
     */
    private function getHoldings($cw, $ETF)
    {
        if (!$ETF->holdings()->count()) {
            if ($cw) {
                for ($i = 0; $i < $cw->length; $i += 3) {
                    $ETF->holdings()->create(
                        [
                            'name' => $cw[$i]->nodeValue,
                            'weight' => str_replace('%', '', $cw[$i + 1]->nodeValue)
                        ]);
                }
            }
        }
    }

}
