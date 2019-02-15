<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Etf extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name', 'description', 'symbol'];

    /*
     * Relations
     */
    /**
     * Get the comments for the blog post.
     */
    public function sectorWeights()
    {
        return $this->hasMany(SectorWeights::class);
    }
    /**
     * Get the comments for the blog post.
     */
    public function holdings()
    {
        return $this->hasMany(Holdings::class);
    }
    /**
     * Get the comments for the blog post.
     */
    public function countryWeights()
    {
        return $this->hasMany(CountryWeight::class);
    }

    /**
     * @param $query
     * @param $text
     * @return mixed
     */
    public function scopeGetByText($query, $text)
    {
        $text = '%'.strtoupper($text).'%';
        return $query->orWhere('symbol','like',$text)->orWhere('description', $text);
    }
}
