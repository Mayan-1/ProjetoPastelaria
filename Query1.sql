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
    fk_tamanho int(11) not null,
    foreign key (fk_tamanho) references tamanho(id_tamanho)
);

create table recheio(
	id_recheio int(11) not null auto_increment primary key,
    descricao varchar(45) not null,
    fk_pastel int(11) not null,
    foreign key (fk_pastel) references pasteis(id_pastel)	
);

create table bebidas(
	id_bebida int(11) not null auto_increment primary key,
    nome_bebida varchar(45) not null,
    fk_tamanho int(11) not null,
    foreign key (fk_tamanho) references tamanho(id_tamanho)
);

create table tamanho(
	id_tamanho int(11) not null auto_increment primary key,
    tamanho_pequeno char(1) not null,
    tamanho_medio char(1) not null,
    tamanho_grande char(1) not null
);

create table pasteisTam(
	id_pastelTam int(11) not null auto_increment primary key,
    fk_pastel int(11) not null,
    fk_tamanho int(11) not null,
    valor_pastel float not null,
	foreign key (fk_pastel) references pasteis(id_pastel),
	foreign key (fk_tamanho) references tamanho(id_tamanho)
);


create table bebidasTam(
	id_bebidasTam int(11) not null primary key	auto_increment,
    fk_bebida int(11) not null,
    fk_tamanho int(11) not null,
    valor_bebida float not null,
    foreign key (fk_tamanho) references tamanho(id_tamanho),
    foreign key (fk_bebida) references bebidas(id_bebida)
);


create table pedidos(
	id_pedido int(11) not null auto_increment primary key,
    fk_pastelTam int(11),
    fk_bebidaTam int(11),
    fk_cliente int(11) not null,
    valor_total float not null,
    foreign key (fk_pastelTam) references pasteisTam(id_pastelTam),
    foreign key (fk_bebidaTam) references bebidasTam(id_bebidasTam),
    foreign key (fk_cliente) references clientes(id_cliente)
);
insert into clientes(nome_completo,nome_cadastro,nascimento,telefone,email,bairro,cidade,estado)
values("David Eduardo dos Santos Ferreira", "David",'2001-09-16',"75984846551","davidedsf09@gmail.com","centro","terra nova","Bahia"),
("Maria Eduarda dos Santos Ferreira", "Eduarda",'2008-05-16',"75984545451","mariaedsf09@gmail.com","centro","terra nova","Bahia"),
("Carlos Eduardo dos Santos Ferreira", "Carlos",'2007-09-16',"759844451","carlosedsf09@gmail.com","centro","terra nova","Bahia");

ALTER TABLE tamanho drop column tamanho_grande;

alter table tamanho 
add column tamanho char (1);

insert into tamanho (tamanho)
values ("P"),
("M"),
("G");

insert into pasteis (nome_pastel,categoria_pastel,fk_tamanho)
values("Pastel de Flango","Flango",1);

select * from pasteis; 











