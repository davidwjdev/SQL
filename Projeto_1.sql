--Cria DB
create database projeto_1;
--Seleciona o DB
use projeto_1;
--Cria tabela
create table transacao (
id int not null auto_increment primary key,
tipo varchar(50),
nome varchar(200),
valor float(10,2),
data_cadastro date);
--Insere dados
insert into transacao (tipo, nome, valor, data_cadastro)
values  ('Compra', 'Mercadoria 1', -120.23 , '2021-06-07' ),
	('Compra', 'Mercadoria 2', -500 , '2021-06-09' ),
	('Venda', 'Mercadoria 1', 3244.12 ,'2021-06-08' ),
	('Venda', 'Mercadoria 2', 9524.84 , '2021-06-10' );
--Seleciona dados em ordem crescente da data
select * from transacao order by data_cadastro asc;
--Somatorio das transações
select 'total', sum(valor) as valor from transacao;
--Limpeza da tabela - qualquer um dos dois comandos limpam
truncate table transacao;
delete from transacao;
