@extends('layouts.app')
@section('content')
    <div class="container">
            <ul class="collapsible">
                <?php
                      foreach ($pedidos as $pedido) {?>
                    <li>
                      <div class="collapsible-header">
                        <i class="material-icons">arrow_drop_down</i>
                        Pedido ##{{$pedido->id}}
                        <input type="hidden" class="ped" name="pedido" id="pedido" value="{{$pedido->id}}">
                        <span class="new badge" data-badge-caption=""><?php echo date('d/m/Y', strtotime($pedido->data_pedido)); ?></span></div>
                      <div class="collapsible-body">
                        <div class="pedido-detalhes">
                        <p>Pedido ##{{$pedido->id}} Detalhes<i class="material-icons left">format_list_bulleted</i></p>

                        <div class="kit-componentes">
                            <table class="highlight-kit">
                            <thead id="thea-{{$pedido->id}}"></thead>
                            <tbody id="tbody-componentes-{{$pedido->id}}"></tbody>
                            </table>
                        </div>
                        <div class="dados-pedido">
                        <table class="striped">
                          <tbody id="table-main-{{$pedido->id}}"></tbody>
                          </table>
                        </div>
                        <div class="historico-pedido">
                          <table class="striped">
                              <thead>
                                  <th>Historico do pedido</th>
                              </thead>
                            <tbody id="td-historico-{{$pedido->id}}">
                              </tbody>
                          </table>
                        </div>
                        </div>
                      </div>
                    </li>
                    <?php }?>
                  </ul>
    </div>
@endsection