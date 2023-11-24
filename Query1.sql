create database pastelaria;
use pastelaria;

create table clientes(
	id_cliente int(11) not null auto_increment primary key,
    nome_completo varchar(300) not null,
    nome_cadastro varchar(150) not null,
    data_de_nascimento datetime not null,
    telefone varchar(11) not null,
    email varchar(50) not null,
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    estado varchar(20) not null
);

