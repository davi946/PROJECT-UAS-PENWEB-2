<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUkmTable extends Migration
{
    public function up()
    {
        Schema::create('ukm', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('nama_ukm', 100);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('ukm');
    }
}
