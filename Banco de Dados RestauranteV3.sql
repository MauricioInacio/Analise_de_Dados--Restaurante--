use restaurante;

select nome, categoria from produtos where preco > 30.00;

select nome, telefone, data_nascimento from clientes where year(data_nascimento) < 1985;

select id_produto, ingredientes from info_produtos where ingredientes like '% carne %';

select categoria, nome from produtos order by categoria, nome;

select nome from produtos order by preco desc limit 5;

select nome from produtos where categoria = 'prato principal' order by preco LIMIT 2 OFFSET 5;

create table backup_pedidos as select * from pedidos;

select * from backup_pedidos;


