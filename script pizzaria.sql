show databases;

drop database if exists pizzaria;

create database if not exists pizzaria;

use pizzaria;

create table if not exists clientes (
id int not null auto_increment primary key,
nome varchar(30),
telefone int, 
logradouro varchar(30),
numero int,
complemento varchar(30),
bairro varchar(30),
referencia varchar(30) 
);

create table if not exists pizzas (
id int not null auto_increment primary key,
nome varchar(30),
descricao varchar(100),
valor decimal(15,2)
);

drop table pedidos;
create table if not exists pedidos (
id int not null auto_increment primary key,
cliente_id int,
data datetime,
valor decimal (15,2)
);

-- describe pedidos;

alter table pedidos add foreign key (cliente_id) references clientes (id);

create table itens_pedido (
pedido_id int,
pizza_id int,
quantidade int,
valor decimal(15,2),
primary key (pedido_id, pizza_id),
foreign key (pizza_id) references pizzas (id),
foreign key (pedido_id) references pedidos (id)
);

alter table clientes drop telefone;
alter table clientes add tel numeric(15);
alter table clientes modify  tel varchar(14);
describe clientes;

insert into clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
values ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, null , 'Bela Vista', 'Em frente a escola');

select * from clientes;

-- alterar o tipo de dados e nome da coluna
alter table clientes change tel telefone varchar(14);

insert into clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
values ('(22) 2222-2222', 'Bruna Dantas', 'Rua das Rosas',222 , null , 'Cantareira', 'null');

insert into clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
values ('(33) 3333-3333', 'Bruno Vieira', 'Rua das Avencas',333 , null , 'Bela Vista', 'null');

insert into clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
values ('(44) 4444-4444', 'Giulia Silva', 'Rua dos Cravos',444 ,null  , 'Cantareira', 'Esquina do mercado');

insert into clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
values ('(55) 5555-5555', 'José Silva', 'Rua das Acácias', 555, null , 'Bela Vista', 'null');

insert into clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
values ('(66) 6666-6666', 'Laura Madureira', 'Rua das Gardências', 666, null , 'Cantareira', 'null');

update clientes set telefone = '(11) 1111-1111' where id = 1;

insert into pizzas (nome, valor) 
values 
('Provolone', 17),
('Portuguesa', 15),
('4 queijos', 20), 
('Calabresa', 17);

insert into pizzas (nome) values ('Escarola');
alter table pizzas modify valor decimal(15,2) default 99;
insert into pizzas (nome) values ('Moda da Casa');

insert into pedidos (id, cliente_id, data, valor)
values(1, 1, '2016-12-15 20:30:00' , 32),
(2, 2, '2016-12-15 20:38:00', 40.00),
(3, 3, '2016-12-15 20:59:00', 22),
(4, 1, '2016-12-17 22:00:00', 42),
(5, 2, '2016-12-18 19:00:00', 45),
(6, 3, '2016-12-18 21:12:00', 44),
(7, 4, '2016-12-19 22:22:00', 72),
(8, 6, '2016-12-19 22:26:00', 34.0);

select * from pizzas;

insert into itens_pedido (pedido_id, pizza_id, quantidade, valor)
values (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(8, 4, 2, 34.00);

/*
	select [distinct] <colunas>
    from <tabelas>
    [where condição]
    [group by <coluna>]
    [having <condição>]
    [order by <coluna>];
*/

select * from clientes order by nome;

-- selecionar todos os valores 
select * from pizzas;
select id, nome, valor from pizzas;

-- a sequencia das colunas podem ser alteradas
select valor, id, nome from pizzas;

-- nome da coluna exibido na respoststa do comando pode ser alterado com clásula AS
select id as codigo, nome, valor as 'Valor R$' from pizzas;

-- operações aritiméticas
select 10 + 3 , 10 - 3, 10 / 3, 10 * 3;
select 10 + 3 as SOMA, 10 - 3 as SUBTRAÇÃO, 10 / 3 as DIVISÃO ,10 * 3 as MULTIPLICAÇÃO;

select * from pizzas;

select id, nome, valor, ((valor * 10) / 100) + valor as '10%' from pizzas; 



