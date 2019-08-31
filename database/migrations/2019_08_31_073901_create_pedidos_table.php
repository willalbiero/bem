<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePedidosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pedidos', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_user');
            $table->unsignedBigInteger('id_endereco_envio');
            $table->string('status_pedido');
            $table->decimal('preco_total', 8, 2);
            $table->timestamp('data_pedido');
            $table->string('comentario_pedido', 250);
            $table->foreign('id_user')->references('id')->on('users');
            $table->foreign('id_endereco_envio')->references('id')->on('endereco_envio');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pedidos');
    }
}
