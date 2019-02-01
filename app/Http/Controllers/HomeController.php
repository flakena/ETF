<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\DomCrawler\Crawler;

class HomeController extends Controller
{
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


}
