<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ETF extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'description', 'symbol'
    ];

    /**
     * @var string
     */
    protected $table = 'etfs';



    /*
     * Relations
     */
    /**
     * Get the comments for the blog post.
     */
    public function sectorWeights()
    {
        return $this->hasMany(SectorWeights::class,'etf_id');
    }
    /**
     * Get the comments for the blog post.
     */
    public function holdings()
    {
        return $this->hasMany(Holdings::class,'etf_id');
    }
    /**
     * Get the comments for the blog post.
     */
    public function countryWeights()
    {
        return $this->hasMany(CountryWeight::class,'etf_id');
    }
}
