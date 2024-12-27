use restaurante;

/* view chamada resumo_pedido do join entre essas tabelas: 
pedidos: id, quantidade e data
clientes: nome e email
funcionarios: nome
produtos: nome, preco */
create view resumo_pedido as
select ped.id_pedido, ped.quantidade, ped.data_pedido, c.nome as nome_c , f.nome as nome_f , c.email, pro.nome as nome_pro, pro.preco
from pedidos as ped join clientes as c on ped.id_cliente = c.id_cliente 
join funcionario  as f on ped.id_funcionario = f.id_funcionario
join produtos as pro on ped.id_produto = pro.id_produto;

-- Selecione o id do pedido, nome do cliente e o total (quantidade * preco) de cada pedido da view resumo_pedido

select id_pedido, nome_c, (quantidade * preco) as total from resumo_pedido order by id_pedido;


-- Adicionar a View resumo_pedido o campo total
create or replace view resumo_pedido as
select  ped.id_pedido, ped.quantidade, ped.data_pedido, c.nome as nome_c , f.nome as nome_f , c.email, pro.nome as nome_pro, pro.preco, (ped.quantidade * pro.preco) as total
from pedidos as ped join clientes as c on ped.id_cliente = c.id_cliente 
join funcionario  as f on ped.id_funcionario = f.id_funcionario
join produtos as pro on ped.id_produto = pro.id_produto;

-- Refazer a consulta
select * from resumo_pedido;

-- Consultando a tabela resumo_pedido com uso de Explain
explain resumo_pedido;

-- Função BuscaIngredientes retorna os ingredientes da tabela info produtos, quando passar o id de produto como argumento (entrada) da função.

delimiter //
create function BuscaIngredientes(idProduto int)
returns varchar(200)
reads sql data
begin
	declare ListaIngredientes varchar(200);
	select ingredientes into ListaIngredientes from info_produtos where id_produto = idProduto;	
    return ListaIngredientes;
end //
delimiter ;

-- Execute a função ‘BuscaIngredientesProduto’ com o id de produto 10
select BuscaIngredientes(10);

-- função chamada ‘mediaPedido’

delimiter //
create function mediaPedido(idProduto int)
returns varchar(100)
reads sql data
begin
	declare media int;
    declare valor int;
    declare a varchar(100);
	select coalesce(avg(preco)) into media from produtos;
    select preco into valor from produtos where idProduto = id_produto;
    
    set a =
	case
		when valor <=  media then 'abaixo'
		when valor >= media then 'acima'
        else 'igual'
	end;
    return a;
end //
delimiter ;

-- Execute a função ‘mediaPedido’ com o id de pedido 5.
select mediaPedido(5);

-- Execute a função ‘mediaPedido’ com o id de pedido 6.
select mediaPedido(6);
