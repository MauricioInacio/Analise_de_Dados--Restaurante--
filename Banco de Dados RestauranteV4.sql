use restaurante;

select * from pedidos where id_funcionario = 4 and status_pedido = 'pendente';

select * from pedidos where not status_pedido='Concluído';

select * from pedidos where id_produto in (1, 3, 5, 7, 8);

select * from clientes where nome like 'c%';

select * from info_produtos where ingredientes like '%frango%' or ingredientes like '%carne%';

select * from produtos where preco between 20 and 30;

update pedidos set status_pedido = null where id_pedido = 6;

select * from pedidos where status_pedido is null;

select id_pedido,status_pedido, ifnull(status_pedido, 'Cancelado') from pedidos;

select nome, cargo, salario, if (salario > 3000, 'Acima da média', 'Abaixo da média') as media_salario from funcionario; 