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
    protected $fillable = ['label', 'weight', 'order'];

    /**
     * @param $value
     * @return float
     */
    public function getWeightAttribute($value)
    {
        return round($value, 2);
    }
}
