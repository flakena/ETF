<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SectorWeights extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'label', 'weight','order'
    ];

    /**
     * @var string
     */
    protected $table = 'etf_sector_weights';

}
