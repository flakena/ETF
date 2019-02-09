<?php

namespace App\Http\Controllers;

use App\Models\ETF;
use App\Services\Parser;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Cache;
use Spatie\Activitylog\Models\Activity;

class HomeController extends Controller
{

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
     * @param Parser $parser
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function index(Parser $parser)
    {
        if (empty(Cache::get('parsed'))) {
            $parser->getETFs();
        }

        //Remember ETF's list for auto complete
        Cache::remember('etfs', 20, function () {
            return ETF::select('id', 'name', 'symbol')->get();
        });

        //Get user search logs
        $userLogs = Activity::select('description', 'created_at')
            ->where('subject_type', 'App\Models\ETF')
            ->where('causer_id', auth()->user()->id)
            ->orderBy('created_at', 'desc')
            ->get();

        return view('home', compact('userLogs'));
    }

}
