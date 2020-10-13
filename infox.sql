create database dbinfox;
use dbinfox;
describe tbusuarios;
describe tbos;
select * from tbusuarios;
select * from tbclientes;
select * from tbos;
-- a linha abaixo adiciona um campo a tabela
alter table tbusuarios add column perfil varchar(20) not null;
-- a linha abaixo remove um campo de uma tabela
-- alter table tbusuarios drop column perfil;
update tbusuarios set perfil = 'admin' where iduser = 4;
create table tbusuarios(
	iduser int primary key,
    usuario varchar(50) not null,
    fone varchar(15),
    login varchar(15)not null unique,
    senha varchar(15)not null
);
-- a linha abaixo exibe os dados da tabela

insert into tbusuarios(iduser, usuario, fone, login, senha)
VALUES (2, 'Naiane','8888-8888','naiane','naichan');

-- a linha abaixo apaga um registro da tabela
create table tbclientes(
	idcli int primary key AUTO_INCREMENT,
    nomecli varchar(250) not null,
    endcli varchar(100),
    fonecli varchar(50) not null,
    emailcli varchar(50)
);

INSERT INTO tbclientes(nomecli, endcli, fonecli, emailcli)
VALUES('Steve Jobs', 'Palo Alto 222', '5555-5555','stevejobs@gmail.com');
select * from tbclientes;
use dbinfox;
create table tbos(
	os int primary key auto_increment,
    data_os timestamp default current_timestamp,
    equipamento varchar(150) not null,
	defeito varchar(150) not null,
    servico varchar(150),
    tecnico varchar(30),
    valor decimal(10,2),
    idcli int not null,
    foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

INSERT INTO tbos(equipamento, defeito, servico, tecnico, valor, idcli)
VALUES('Notebook','Não Liga','Troca da fonte','Samsung',499.99,1);

select * from tbos;

-- Código que traz informações de duas tabelas
select
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli 
from tbos as O
inner join tbclientes as C
on(O.idcli = C.idcli);

-- a linha abaixo cria um apelido aos campos de tabela
select idcli as id, nomecli as Nome, fonecli as Fone from tbclientes where nomecli like 'jo%';

-- a linha abaixo altera a tabela adicionando um campo em uma determinada posição
alter table tbos add tipo varchar(14) not null after data_os;
alter table tbos add situacao varchar(20) not null after tipo;

-- o bloco de intruções abaixo a seleção e a união de dados de duas tabelas
-- OSER é uma variavel que contem os campos desejados da tabela OS
-- CLI é outra variavel que contem os campos desejados da tabela clientes
SELECT
OSER.os,data_os,tipo,situacao,equipamento,valor,
CLI.nomecli,fonecli
from tbos as OSER
inner join tbclientes as CLI
on (CLI.idcli = OSER.idcli);