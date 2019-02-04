<?php

namespace App\Http\Controllers\ETF;

use App\Models\ETF;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Cache;

class ParseController extends Controller
{

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
            ->log($ETF->symbol . ' : ' . $ETF->name);

        if ($ETF->holdings()->count() && $ETF->countryWeights()->count() && $ETF->sectorWeights()->count()) {
            return $ETF;
        }
        $cookies = getPermissionCookies();
        if ($cookies) {
            $url = config('etf.currentETFLink') . $ETF->symbol;
            $html = parseETF($url, $cookies);
            if ($html) {
                $dom = new \DOMDocument('1.0');
                @$dom->loadHTML(html_entity_decode($html));
                $xpath = new \DOMXPath($dom);
                $cwNames = $xpath->query('//h2[normalize-space(text()) = "Fund Country Weights"]//following-sibling::table[1]//td[@class="label"]');
                $cwWeights = $xpath->query('//h2[normalize-space(text()) = "Fund Country Weights"]//following-sibling::table[1]//td[@class="data"]');
                $hdsNames = $xpath->query('//div[@class="col-xs-12 col-sm-6 top-holdings"][1]/descendant::table[1]//td[@class="label"]');
                $hdsWeights = $xpath->query('//div[@class="col-xs-12 col-sm-6 top-holdings"][1]/descendant::table[1]//td[@class="weight"]');

                //Set description for ETF
                if (empty($ETF->description)) {
                    $description = $xpath->query('//div[@class="keyfeatures"]');
                    if ($description->length) {
                        $ETF->update(['description' => $description[0]->nodeValue]);
                    }
                }

                //Set sector Weights
                $this->getSectorWeights($html, $ETF);


                //Set Country Weights for ETF
                $this->getCountryWeights($cwNames,$cwWeights, $ETF);

                //Set Holdings for ETF
                $this->getHoldings($hdsNames,$hdsWeights, $ETF);

            }
            return $ETF->load(['holdings', 'countryWeights', 'sectorWeights']);
        }
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
     * @param $cwNames
     * @param $cwWeights
     * @param $ETF
     */
    private function getCountryWeights($cwNames,$cwWeights, $ETF)
    {
        if (!$ETF->countryWeights()->count()) {
            if ($cwNames) {
                for ($i = 0; $i < $cwNames->length; $i++) {
                    $ETF->countryWeights()->create(
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
     * @param $ETF
     */
    private function getHoldings($hdsNames,$hdsWeights, $ETF)
    {
        if (!$ETF->holdings()->count()) {
            if ($hdsNames) {
                for ($i = 0; $i < $hdsNames->length; $i++) {
                    $ETF->holdings()->create(
                        [
                            'name' => $hdsNames[$i]->nodeValue,
                            'weight' => str_replace('%', '', $hdsWeights[$i]->nodeValue)
                        ]);
                }
            }
        }
    }

}
