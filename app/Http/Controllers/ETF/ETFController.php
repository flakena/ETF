<?php

namespace App\Http\Controllers\ETF;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ETFController extends Controller
{
    public function parse(Request $request)
    {
        return $request->all();
    }
}
