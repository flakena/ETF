<?php

namespace App\Http\Controllers;

use App\Http\Resources\ETFResource;
use App\Models\ETF;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Cache;
use Symfony\Component\DomCrawler\Crawler;

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
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        if (!config('etf.parsed')) {
            Artisan::call('etf:get');
        }
        //remember etfs for autocomplete
        Cache::remember('etfs', 20, function () {
            return ETF::select('id','name','symbol')->get();
        });

        return view('home');

    }


}
