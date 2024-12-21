use restaurante;

select pro.id_produto, pro.nome, pro.descricao, info.ingredientes 
from produtos as pro left join info_produtos as info on pro.id_produto = info.id_produto;
    
select ped.id_pedido, ped.quantidade, ped.data_pedido, c.nome, c.email 
from pedidos as ped left join clientes as c on ped.id_cliente = c.id_cliente;

select ped.id_pedido, ped.quantidade, ped.data_pedido, c.nome, c.email, c.nome 
from pedidos as ped left join clientes as c on ped.id_cliente = c.id_cliente;

select ped.id_pedido, ped.quantidade, ped.data_pedido, c.nome, c.email, f.nome, pro.nome, pro.preco 
from pedidos as ped inner join clientes as c inner join funcionario as f inner join produtos as pro;

select c.nome, ped.status_pedido from clientes as c inner join pedidos as ped where ped.status_pedido = 'Pendente' order by ped.id_produto;

select c.nome, ped.quantidade from clientes as c left join pedidos as ped on c.id_cliente = ped.id_cliente where ped.id_pedido is null;

select c.nome, sum(ped.quantidade) as total_pedidos from clientes as c inner join pedidos as ped on c.id_cliente = ped.id_cliente group by c.nome
-- Quando eu tento executar essa linha sem GROUP BY o sistema me retorna 'Na consulta agregada sem GROUP BY'
;

select pro.nome, sum(ped.quantidade * pro.preco) as valor_total from produtos as pro inner join pedidos as ped on pro.id_produto = ped.id_produto group by pro.nome;
