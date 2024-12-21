use restaurante;
select * from funcionario;
update	funcionario set cargo = 'garçonete' where cpf = '444.555.666-77';   
update	funcionario set salario = 2700.00 where cpf = '444.555.666-77';   

select * from pedidos;

update pedidos set status_pedido = 'Concluído' where data_pedido < '2024-07-06';

select * from funcionario;

delete from funcionario where cpf = '222.333.444-55';

SET SQL_SAFE_UPDATES = 0;