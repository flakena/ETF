<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ETFSectorWeightsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sector_weights', function (Blueprint $table) {
            $table->increments('id');
            $table->string('label');
            $table->string('weight');
            $table->tinyInteger('order');
            $table->unsignedInteger('etf_id')->nullable();
            $table->foreign('etf_id')->references('id')->on('etfs')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('sector_weights');
    }
}
