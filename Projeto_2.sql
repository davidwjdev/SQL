--Cria DB
create database projeto_2;
--Seleciona o DB
use projeto_2;
--Cria tabelas
create table usuario (
id int not null auto_increment,
nome varchar(200),
imagem varchar(250),
nome_usuario varchar(50),
data_cadastro date,
PRIMARY key (id));

create table cartao (
id int not null auto_increment ,
numero bigint(16),
cvv int(4),
data_expiracao date,
nome_usuario varchar(50),
valido tinyint(1),
data_cadastro date,
PRIMARY key (id));

create table transacao (
id int not null auto_increment,
id_usuario int,
id_cartao int,
valor float(10,2),
data_cadastro date,
PRIMARY key (id),
FOREIGN KEY (id_usuario) REFERENCES usuario(id),
FOREIGN KEY (id_cartao) REFERENCES cartao(id));

--Adiciona dados

insert into usuario (nome, imagem, nome_usuario, data_cadastro)
values  ('Fabio Silva', 'IMG/fabioS', 'fabioS', '2021-06-07' ),
		('Tarcisio Ferreira', 'IMG/tarfer', 'tarfer', '2021-06-09' ),
		('Aline Matos', 'IMG/aline.matos', 'aline.matos','2021-06-08' ),
		('Patricia Ilha', 'IMG/patyi', 'patyi', '2021-06-10' );

insert into cartao (numero, cvv, data_expiracao, nome_usuario, valido, data_cadastro)
values  ('1234567812345678', '123', '2025-01-01', 'fabioS', '1', '2021-06-07' ),
		('1234567812345678', '123', '2025-01-01', 'tarfer', '1', '2021-06-09' ),
		('1234567812345678', '123', '2025-01-01', 'aline.matos', '1', '2021-06-08' ),
		('1234567812345678', '123', '2025-01-01', 'patyi', '1', '2021-06-10' ),
		('0000000000000000', '123', '2025-01-01', 'fabioS', '0', '2021-06-07' ),
		('0000000000000000', '123', '2025-01-01', 'tarfer', '0', '2021-06-09' ),
		('0000000000000000', '123', '2025-01-01', 'aline.matos', '0', '2021-06-08' ),
		('0000000000000000', '123', '2025-01-01', 'patyi', '0', '2021-06-10' );

insert into transacao (id_usuario, id_cartao, valor, data_cadastro)
values  ('1', '1', '123.23', '2021-06-07' ),
		('2', '2', '5433.23', '2021-06-09' ),
		('3', '3', '231.21','2021-06-08' ),
		('4', '4', '2136.32', '2021-06-10' ),
		('1', '1', '2133.23', '2021-06-08' ),
		('2', '2', '654.23', '2021-06-10' ),
		('3', '3', '876.21','2021-06-07' ),
		('4', '4', '98.32', '2021-06-09' );
    
    
--Insert de dados
select * from usuario order by nome asc;

select * from cartao where valido = 1 order by data_cadastro asc;

select 
transacao.id_usuario, 
transacao.id_cartao, 
transacao.valor, 
transacao.data_cadastro,
usuario.nome, 
usuario.imagem, 
usuario.nome_usuario, 
usuario.data_cadastro data_cadastro_usuario,
cartao.numero, 
cartao.cvv, 
cartao.data_expiracao, 
cartao.valido, 
cartao.data_cadastro data_cadastro_cartao
from transacao transacao
inner join usuario usuario
on transacao.id_usuario = usuario.id 
inner join cartao cartao 
on transacao.id_cartao = cartao.id
order by transacao.data_cadastro desc;
