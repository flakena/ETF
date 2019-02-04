<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CountryWeight extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name', 'weight'];
    /**
     * @var string
     */
    protected $table = 'etf_country_weights';

}
