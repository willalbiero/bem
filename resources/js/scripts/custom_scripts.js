$(document).ready(function () {
  $('.collapsible').collapsible();
});
$(document).ready(function () {
  $('.sidenav').sidenav();
});

function pegaDados(value){
	var view;
	$.ajax({
		type: 'GET',
		url: 'http://localhost/site/public/buscapedidos/'+value,
		async: true,
		dataType: 'JSON',
		success: function(response){
		var id = response[0].id;
		var status = response[0].status_pedido;
		var preco = response[0].preco_total;
		var data = response[0].data_pedido;
		var nomeKit = response[0].nome;
		var comentario = response[0].comentario_pedido;
		var contrato = response[0].contrato;
		var dataContrato = response[0].data_contrato;
		var documento = response[0].documento;
		var endereco = response[0].endereco;
		var estado = response[0].estado;
		var pais = response[0].pais;
		var telefone = response[0].telefone;
		var code = response[0].zip_code;

		var dataModifica = response[0].data_modificacao;
		var descriHistorico = response[0].descricao;
		var strNomeCompo = response[0].nome_componentes;

		var nomeComponentes = strNomeCompo.split(",");

		/**
		 * Constroi table do kit e seus componentes
		 */
		var thead_str ="<tr class='name-kit'>" +
		"<td>" + nomeKit + "</td>" + 
		"</tr>";
		
		$("#thea-"+id).empty();
		$("#thea-"+id).append(thead_str);

		var len = nomeComponentes.length;
		$("#tbody-componentes-"+id).empty();
		for(var i = 0; i < len; i++){
			var tbody_componentes = "<tr>" +
			"<td>" + nomeComponentes[i] + "</td>" +
			"</tr>";
			
			$("#tbody-componentes-"+id).append(tbody_componentes);
		}

		var tableMain_str = "<tr>" +
		"<th> Contrato de Licença: </th>" +
		"<td><a href='" + contrato + "'> baixar </a></td>" +
		"</tr>" +

		"<tr>" +
		"<th> Status: </th>" +
		"<td>" + status + "</td>" +
		"</tr>" +

		"<tr>" +
		"<th> Preço: </th>" +
		"<td>" + preco + "</td>" +
		"</tr>" +

		"<tr>" +
		"<th> Data Criação: </th>" +
		"<td>" + data + "</td>" +
		"</tr>" +

		"<tr>" +
		"<th> CNJP para envio: </th>" +
		"<td>" + documento + "</td>" +
		"</tr>" +

		"<tr>" +
		"<th> Estado para envio: </th>" +
		"<td>" + estado + "</td>" +
		"</tr>" +

		"<tr>" +
		"<th> Telefone para envio: </th>" +
		"<td>" + telefone + "</td>" +
		"</tr>" + 

		"<tr>" +
		"<th> CEP: </th>" +
		"<td>" + code + "</td>" +

		"</tr>" + 
		"<tr>" +
		"<th> Endereço para envio: </th>" +
		"<td>" + endereco + "</td>" +
		"</tr>" + 
		"<tr>" +
		"<th> País para envio: </th>" +
		"<td>" + pais + "</td>" +
		"</tr>" + 
		"<tr>" +
		"<th> Comentário do pedido: </th>" +
		"<td>" + comentario + "</td>" +
		"</tr>" + 
		"<tr>" +
		"<th> Executivo de Vendas: </th>" +
		"<td><input type='text'></td>" +
		"</tr>" + 
		"<tr>" +
		"<th> Número do pedido de hardware: </th>" +
		"<td><input type='text'></td>" +
		"</tr>" + 
		"<tr>" +
		"<th> NF-e: </th>" +
		"<td></td>" +
		"</tr>" + 
		"<tr>" +
		"<th> Data Emissão NFe: </th>" +
		"<td></td>" +
		"</tr>";
		
		$("#table-main-"+id).empty();
		$("#table-main-"+id).append(tableMain_str);

		var historPedi_str = "<tr>" + 
		"<th>" + dataModifica + "</th>" +
		"<td>" + descriHistorico + "</td>" +
		"</tr>";

		$("#td-historico-"+id).empty();
		$("#td-historico-"+id).append(historPedi_str);
	}
	});
	}

$(".collapsible-header").click(function(){
	var isActive = $("li.active").attr('class');
	var id = $(this).find('input').val();
	pegaDados(id);
});