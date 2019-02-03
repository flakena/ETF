<?php

namespace App\Console\Commands;

use App\Models\ETF;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Validator;

class GetETFs extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'etf:get';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Get all etf names and symbols from website';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        try {
            $cookies = getPermissionCookies();
            $url = config('etf.seamFile');
            $response = parseETFs($url, $cookies);
            $dom = new \DOMDocument('1.0');
            @$dom->loadHTML(htmlspecialchars_decode($response));
            $xpath = new \DOMXPath($dom);
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
                        ETF::create($arr);
                    }
                }
                $config = @include(app()->configPath('etf.php'));
                $config['parsed'] = true;
                file_put_contents(app()->configPath('etf.php'), '<?php' . "\r\n" . ' return [' . "\r\n" . array_to_string($config) . '];' . "\r\n");
                Artisan::call('config:cache');
            }
        } catch (\Exception $exception) {
            activity()
                ->withProperties([
                    'code' => $exception->getCode()
                ])->log($exception->getMessage());
        }
    }
}
