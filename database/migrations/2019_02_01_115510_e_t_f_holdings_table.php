<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ETFHoldingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('holdings', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('weight');
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
       Schema::drop('holdings');
    }
}
