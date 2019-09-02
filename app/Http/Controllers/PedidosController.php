<?php

namespace App\Http\Controllers;

use App\Pedidos;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class PedidosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        $pedidos = Pedidos::all();


        return view('layouts.pages.pedidos', ['pedidos' => $pedidos]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Pedidos  $pedidos
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $pedido = DB::select('SELECT DISTINCT p.id, p.status_pedido, p.preco_total, p.data_pedido, 
        k.nome, ee.estado, ee.pais, ee.endereco, ee.zip_code, p.comentario_pedido, 
        cl.data_contrato, cl.contrato, hp.descricao, 
        hp.data_modificacao, GROUP_CONCAT(c.nome) AS nome_componentes, 
        u.documento, u.telefone        
        FROM pedidos AS p 
        INNER JOIN detalhe_pedido AS dp ON dp.id_pedido = p.id
        INNER JOIN kits AS k ON k.id = dp.id_kits
        INNER JOIN endereco_envio AS ee ON ee.id = p.id_endereco_envio
        INNER JOIN contrato_licenca AS cl ON cl.id_pedido = p.id
        INNER JOIN historico_pedido AS hp ON hp.id_pedido = p.id
        INNER JOIN componentes_kits AS cp ON cp.id_kits = dp.id_kits
        INNER JOIN componentes AS c ON c.id = cp.id_componentes
        INNER JOIN users AS u ON u.id = p.id_user
        WHERE p.id = :id', ['id' => $id]);

        $pedido = json_encode($pedido, true);
        return view('layouts.pages.busca', ['pedido' => $pedido]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Pedidos  $pedidos
     * @return \Illuminate\Http\Response
     */
    public function edit(Pedidos $pedidos)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Pedidos  $pedidos
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pedidos $pedidos)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Pedidos  $pedidos
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pedidos $pedidos)
    {
        //
    }
}
