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
        'name', 'description', 'sybmot',
    ];

    /**
     * @var string
     */
    protected $table = 'etfs';
}