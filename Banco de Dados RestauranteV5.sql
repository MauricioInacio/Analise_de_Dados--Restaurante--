use restaurante;

select count(*) from pedidos;

select count(distinct id_cliente) from pedidos;

select avg(preco) from produtos ;

select min(preco), max(preco) from produtos;

select nome, preco, dense_rank() over(order by preco desc) as ranking_preco from produtos limit 5;

select categoria, avg(preco) from produtos group by categoria;

select fornecedor, count(id_produto) from info_produtos group by fornecedor;

select fornecedor, count(id_produto) from info_produtos group by fornecedor having count(id_produto)>1;

select id_cliente, count(quantidade) from pedidos group by id_cliente having count(quantidade)=1;

