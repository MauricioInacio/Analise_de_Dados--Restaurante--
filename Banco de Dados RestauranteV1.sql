use restaurante;

create table funcionario(
	id_funcionario int primary key auto_increment,
    nome varchar(255), 
    cpf varchar (14),
    data_nascimento date,
    endereco varchar(255),
    telefone varchar(255),
    email varchar(100),
    cargo varchar(100),
    salario decimal(10,2),
    data_admissao date
    
);

create table clientes(
	id_cliente int auto_increment primary key,
	nome varchar(255),
	cpf varchar(14),
	data_nascimento date,
	endereco varchar(255),
	telefone varchar(15),
	email varchar(100),
	data_cadastro date

);

create table produtos(
	id_produto int primary key auto_increment,
	nome varchar(255),
	descricao text,
	preco decimal(10,2),
	categoria varchar(100)

);

create table pedidos(
	id_pedido int auto_increment primary key,
    id_cliente int,
    id_funcionario int,
    id_produto int,
    quantidade int,
    preco decimal(10,2),
    data_pedido date,
    status_pedido varchar(50),
    foreign key (id_cliente) references clientes(id_cliente),
    foreign key (id_funcionario) references funcionario(id_funcionario),
    foreign key (id_produto) references produtos(id_produto)
);

create table info_produtos(
id_info int auto_increment primary key,
id_produto int,
ingredientes text,
fornecedor varchar(255),
foreign key (id_produto) references produtos(id_produto)
);