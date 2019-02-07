<?php

namespace App\Http\Controllers;

use App\Models\ETF;
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
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        if (empty(Cache::get('parsed'))) {
            Artisan::call('etf:get');
        }
        //Remember ETF's list for autocomplete
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
