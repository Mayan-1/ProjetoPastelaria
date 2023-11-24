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

alter table clientes change column data_de_nascimento nascimento date;

select * from clientes;

create table pasteis(
	id_pastel int(11) not null auto_increment primary key,
    nome_pastel varchar(45) not null,
    categoria char(1) not null,
    recheio varchar(45) not null,
    id_tamanho int(11) not null
);

create table bebidas(
	id_bebida int(11) not null auto_increment primary key,
    nome_bebida varchar(45) not null,
    id_tamanho int(11) not null
);

create table tamanho(
	id_tamanho int(11) not null auto_increment primary key,
    tamanho_pequeno char(1) not null,
    tamanho_medio char(1) not null,
    tamanho_grande char(1) not null
);

create table pasteisTam(
	id_pasteiTam int(11) not null auto_increment primary key,
    id_pastel int(11) not null,
    id_tamanho int(11) not null,
    valor_pastel float not null
);


create table bebidasTam(
	id_bebidasTam int(11) not null primary key	auto_increment,
    id_bebida int(11) not null,
    id_tamamho int(11) not null,
    valor_bebida float not null
);


create table pedidos(
	id_pedido int(11) not null auto_increment primary key,
    id_pastelTam int(11),
    id_bebidaTam int(11),
    id_cliente int(11) not null,
    valor_total float not null
);



