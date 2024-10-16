drop database if exists pizzaria;

create database if not exists pizzaria;

use pizzaria;

CREATE TABLE Clientes (
id INt not null AUTO_INCREMENT primary key,
telefone VARCHAR(14),
nome VARCHAR(30),
logradouro VARCHAR(30),
numero DECIMAL(5,0),
complemento VARCHAR(30),
bairro VARCHAR(30),
referencia VARCHAR(30)
 );

 CREATE TABLE pizzas (
id INTEGER not null AUTO_INCREMENT primary key,
nome VARCHAR(30),
descricao VARCHAR(30),
valor DECIMAL(15 , 2 )
 );
 
 CREATE TABLE pedidos (
id INTEGER AUTO_INCREMENT primary key,
cliente_id INTEGER,
data DATETIME,
valor DECIMAL(15 , 2 )
 );
 
 alter table pedidos add FOREIGN KEY (cliente_id) REFERENCES Clientes (id);
 
 
 CREATE TABLE itens_pedido (
pedido_id INTEGER,
pizza_id INTEGER,
quantidade int,
valor DECIMAL(15 , 2 ),
FOREIGN KEY (pizza_id)
REFERENCES Pizzas (id),
FOREIGN KEY (pedido_id)
REFERENCES Pedidos (id)
 );
 


INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- select * from cliente c 

INSERT INTO pizzas (nome, valor) VALUES ('Portuguesa', 15),
('Provolone', 17),
('4 Queijos', 20),
('Calabresa', 17);
INSERT INTO pizzas (nome) VALUES ('Escarola');


alter table pizzas modify valor decimal(15,2) default 99;

INSERT INTO pizzas (nome) VALUES ('Moda da Casa');

INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);


INSERT INTO itens_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);

alter table pizzas add column custo decimal(15,2);
use pizzaria;
update pizzas set custo = valor * 0.60;

-- cndiçao where 
-- selecionar todas as pizzzas com valor superior a 17
select * from pizzas where valor > 17;
-- selecionar todas as pizzzas com valor inferior a 17
select * from pizzas where valor < 17;
-- selecionar todas as pizzzas com valor igual ou inferior a 17
select * from pizzas where valor <= 17;
-- selecionar todas as pizzzas com valor igual a 17
select * from pizzas where valor = 17;
-- selecionar todas as pizzzas com valor diferentes a 17
select * from pizzas where valor <> 17;
select * from pizzas where valor != 17;

-- selecionar todas as pizzzas com a coluna valor nula
select* from pizzas where valor <=> null;
select* from pizzas where valor is null;
-- para criar uma expressao logica , utilizam-se os operadores logicos 
-- E (AND ou &&), OU (OR OU ||)  (E NOT OU!)
-- selecionar todas as pizzzas com valor entre 15 e 20
select * from pizzas where valor > 15 and valor <20;
select * from pizzas where valor between 16 and 19;

-- selecionar todas as pizzas com valor maior ou menores que R$17
select * from pizzas where valor < 17 or valor <20;

-- selecionar todas as pizzas com valores menores ou maiores do que 17
select * from pizzas where (valor < 17 or valor <17);

-- selecionar todas as pizzas com na faixa de 17 a 20
select * from pizzas where valor >= 17 or valor <= 17;
select * from pizzas where valor between 17 and 20;

-- selecionar todas as pizzas com valores fora da faixa entre 17 e 20
select * from pizzas where valor < 17 and valor > 17;
select * from pizzas where valor not between 17 and 20;
select * from pizzas where not (valor >=17 and valor <=20);

-- selecionar todas as pizzas com valores iguais a 15 e 20
select * from pizzas where valor = 15 or valor = 20;
select * from pizzas where valor in (15,20);

-- selecinar todas as pizzas com valores diferentes entre 15 e 20

select * from pizzas where valor != 20 or valor != 20;
select * from pizzas where valor  not in (15,20);

-- selecionartodas as pizza com valores nao nulos 
select * from pizzas where valor is not null; 

-- selecionar todas as pizzas que comecem com a letra E
select * from pizzas where nome like 'e%';

-- selecionar todas as pizzas que terminam com a letra A
select * from pizzas where nome like '%a';


-- selecionar todas as pizzas com nomes que tenham as letras "esa"
select * from pizzas where nome like '%esa%';

-- ar todas as colunas em ordem alfabetica 
 select * from pizzas order by nome;
 
 -- listar o nome e o valor da pizza em ordem decrescente de
 select *  from pizzas order by valor desc, nome asc;
 
 /*restrigir o numero de linhas retornadas pelo comando selct*/
 select * from pizzas where valor < 17 limit 2;
 
 
 select distinct valor from pizzas order by valor;
 
 /* funções de agregação 
 * Conhecidas como funções estatisticas, as funções de agregação obtêm 
 * informação sobre conjuntos de linhas especificados
 * AVG (coluna) Média dos valores da coluna
 * COUNT Númro de linhas
 * Max (coluna) Maior valor da coluna
 * Min  (coluna) Menor valor da coluna
 * Sum (coluna) Soma dos valores da coluna
 */
 
select count(*) from pizzas;
select count(nome) from pizzas;
select count(valor) from pizzas;


select AVG (valor)as media from pizzas; 
select AVG (valor)as media from pizzas where nome like '%esa'; 


-- qual é o valor da pizza mais cara do cardapio?
select max(valor) from pizzas;
-- quaL é p valor da pizza mais barata do cardapio?
select min(valor) from pizzas;
-- qual é o valor total do pedido numero 7?
select sum(valor) from itens_pedido where pedido_id = 7;
select pedido_id as pedido, sum(valor) as 'valor pedido' from itens_pedido group by pedido_id;

select * from itens_pedido;

select pedido_id as pedido, sum(valor) as 'valor pedido', sum(quantidade) as 'qtde pizzas', avg(valor)
 as media, sum(valor) / sum(quantidade) as 'valor médio' from itens_pedido group by pedido_id;

select * from itens_pedido;

-- INNER JOIN: Retorna registros quada há pelo menos uma correspondencia em ambas as tabelas

select c.id, c.nome,p.id from clientes as c inner join pedidos as p on p.cliente_id = c.id;

-- left join( LEFT OU OUTRR JOIN): retorna todos os resgistro da teabela da esquerda 

-- (primeira tabela mencionada) e os registros correspondets da tabela da direita
-- (segunda tabela mencionada)
select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes
left join pedidos on pedidos.cliente_id = clientes.id;

-- right join (ou RIGHT OUTER JOIN): retorna todos os registros da tabela da direita(segunda tabela)
select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes
 right join pedidos on pedidos.cliente_id = clientes.id;
 
 insert into pedidos (id, data, valor) values (9, '2024-10-02', 0);
 
 -- quantidade de pedido(s) realizado(s) por cliente, exibir nome do cliente e quantidade de pedidos realizados
 
 select nome, telefone, count(pedidos.id) from clientes
 left join pedidos on clientes.id = pedidos.cliente_id
 group by nome, telefone;
 select * from pedidos;
 select * from itens_pedido;
 select * from clientes;
 
 
 
 -- 1- quantos pedidos foram feitos no total
 select id, count(id) as 'total pedidos' from pedidos;
 
 -- 2 quantos pedidos foram feitos pelo cliente com o nome "alexandre Santos"?
  select nome, telefone, count(pedidos.id) from clientes
 left join pedidos on clientes.id = pedidos.cliente_id group by nome, telefone;
 
 -- select sum() from itens_pedido where pedido_id = 7;
-- select pedido_id as pedido, sum(val) as 'valor pedido' from itens_pedido group by pedido_id;

 
 -- 3 qual o valor total de todos os pedidos feitos até agr
 
select sum(valor) as 'valor total' from itens_pedido;

-- --------------------------------------------------------------------------
-- questão 1 - Liste todos os pedidos com o nome do cliente correspondente.
select pedidos.id, clientes.nome from pedidos inner join clientes on pedidos.cliente_id = clientes.id;



-- questão 2 - Quantos pedidos foram feitos no total?
select count(id)  as 'total de pedidos feitos' from pedidos;


-- questão 3 - Liste os pedidos feitos após '2016-12-15' com o nome do cliente.

select pedidos.id as pedido, pedidos.data, clientes.nome from pedidos 
inner join clientes on pedidos.cliente_id = clientes.id
where pedidos.data > '2016-12-15 23:59:59';
-- questão 4 - Quantos pedidos foram feitos pelo cliente com o nome "Alexandre Santos"

select clientes.nome, count(*) from pedidos
inner join clientes on pedidos.cliente_id = clientes.id 
where nome = 'Alexandre Santos'
group by clientes.nome;

-- questão 5 - Liste todos os pedidos e seus respectivos clientes, incluindo pedidos feitos por clientes 
-- que foram excluídos da tabela clientes.

select pedidos.id as pedido, clientes.nome from pedidos right join clientes on pedidos.cliente_id = clientes.id;

-- questão 6 - Qual o valor total de todos os pedidos feitos até agora

select sum(valor) as 'valor total' from pedidos;

-- questão 7 - Qual o total gasto por cada cliente?

select clientes.id, nome, sum(valor) as 'total gasto' from pedidos right join clientes
 on clientes.id = cliente_id group by clientes.id , clientes.nome;

-- questão 8  - Liste todos os clientes e seus pedidos feitos no mês de dezembro de 2016 
select clientes.nome, pedidos.id as pedido, pedidos.data, pedidos.valor from clientes 
inner join pedidos on pedidos.cliente_id = clientes.id
where pedidos.data between '2016-12-01' and '2016-12-31 23:59:59';

-- questão 9 - Qual o valor médio dos pedidos realizados?
select * from pedidos;
select avg(valor) as media from pedidos;

-- questão 10 -Liste o valor total dos pedidos por cliente, incluindo pedidos feitos por clientes que foram 
-- excluídos (nome aparecerá como NULL)
select clientes.id, clientes.nome, sum(pedidos.valor) as valor_total,
count(pedidos.id) as total_pedidos from pedidos
left join clientes on clientes.id = pedidos.cliente_id
group by clientes.id ,clientes.nome;
-- questão 11 - . Qual o valor do pedido mais caro registrado?

select id, cliente_id, data, max(valor) as 'pedido mais caro' from pedidos;

-- questão 12 - Qual o valor do pedido mais barato registrado
select id, cliente_id, data, min(valor) as 'pedido mais barato' from pedidos;

-- questão 13 - Quantos pedidos cada cliente fez (mesmo que não tenham feito nenhum)?

select count(pedidos.id) as pedido, clientes.nome from pedidos
right join clientes on clientes.id = pedidos.cliente_id
group by clientes.id, clientes.nome;



-- questão 14 -Qual o pedido mais caro, exibir o nome do cliente e o valor do pedido

 select clientes.id as id, clientes.nome as nome, valor  from pedidos 
 inner join clientes on pedidos.cliente_id = clientes.id
 order by valor desc limit 1;
 
-- questão 15 - Qual a média de pizzas por pedido e quantos pedidos foram feitos
select count(distinct pedido_id) as total_pedidos, avg(quantidade) as media_pizzas from itens_pedido;
-- questão 16 - . Qual o total de pizzas vendidas e o número de pedidos do cliente "Bruna Dantas"

select sum(quantidade) as total_pizzas, count(pedidos.id) as total_pedido from itens_pedido
inner join pedidos on itens_pedido.pedido_id = pedidos.id
inner join clientes on pedidos.cliente_id = clientes.id
where clientes.nome = 'Bruna Dantas';

-- questão 17 - Qual o pedido mais caro e o mais barato do cliente "Laura Madureira"

select clientes.nome, min(valor), max(valor) from pedidos 
inner join clientes on clientes.id = pedidos.cliente_id
where nome = 'laura Madureira';

-- questão 18 - Quantas pizzas cada cliente comprou no total
select clientes.nome, sum(itens_pedido.quantidade) from itens_pedido
inner join pedidos on itens_pedido.pedido_id = pedidos.id
inner join clientes on pedidos.cliente_id = clientes.id
group by clientes.nome;

/*  */

-- questão 19 - Qual o pedido mais barato, exibir o nome do cliente e o valor do pedido
select nome, valor  as 'pedido mais barato' from pedidos
inner join clientes on pedidos.cliente_id = clientes.id
order by valor
limit 1;

-- questão 20 -  Liste todos os clientes, mesmo que não tenham feito pedidos, com seus respectivos 
-- pedidos (se houver)

select clientes.nome, pedidos.id as pedido, data, valor from pedidos
right join clientes on clientes.id = pedidos.cliente_id;

-- questão 21 - Liste todos os clientes com o valor total de seus pedidos (mesmo que não tenham feito 
-- pedidos)
select clientes.id, clientes.nome, sum(pedidos.valor) as total_valor from pedidos
right join clientes on pedidos.cliente_id = clientes.id
group by clientes.nome;

-- questão 22 - Liste os 3 clientes que mais gastou, exibir nome do cliente e o valor gasto

 select nome, sum(valor) as total from pedidos 
 inner join clientes on clientes.id = pedidos.cliente_id
 group by nome
 order by total desc 
 limit 3;
 
 
 