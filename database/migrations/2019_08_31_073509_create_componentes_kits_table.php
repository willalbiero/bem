<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateComponentesKitsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('componentes_kits', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_kits');
            $table->unsignedBigInteger('id_componentes');
            $table->foreign('id_kits')->references('id')->on('kits');
            $table->foreign('id_componentes')->references('id')->on('componentes');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('componentes_kits');
    }
}
