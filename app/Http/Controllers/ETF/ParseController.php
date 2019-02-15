<?php

namespace App\Http\Controllers\ETF;

use App\Models\ETF;
use App\Http\Controllers\Controller;
use App\Services\Parser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class ParseController extends Controller
{

    /**
     * @param $id
     * @param Parser $parser
     * @return string
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function parseCurrentEtf($id, Parser $parser)
    {
        $etf = ETF::where('id', $id)->with(['holdings', 'countryWeights', 'sectorWeights'])->first();
        activity()
            ->causedBy(auth()->user()->id)
            ->performedOn($etf)
            ->withProperties(['IP' => \Request::ip()])
            ->log($etf->symbol . ' : ' . $etf->name);

        if ($etf->holdings()->count() && $etf->countryWeights()->count() && $etf->sectorWeights()->count()) {
            return $etf;
        }
        return $parser->getParsedETF($etf);
    }

    /**
     * @param Request $request
     * @param Parser $parser
     * @return mixed
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function CheckEtf(Request $request, Parser $parser)
    {
        $etf = ETF::getbytext($request->text)->with(['holdings', 'countryWeights', 'sectorWeights'])->first();
        if ($etf) {
            activity()
                ->causedBy(auth()->user()->id)
                ->performedOn($etf)
                ->withProperties(['IP' => \Request::ip()])
                ->log($etf->symbol . ' : ' . $etf->name);

            if ($etf->holdings()->count() && $etf->countryWeights()->count() && $etf->sectorWeights()->count()) {
                return $etf;
            }
            return $parser->getParsedETF($etf);
        } else {
            abort(404);
        }
    }

}
