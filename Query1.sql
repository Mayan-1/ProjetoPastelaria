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
    descricao varchar(45) not null
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
ALTER TABLE tamanho drop column tamanho_pequeno;
ALTER TABLE tamanho drop column tamanho_medio;

alter table tamanho 
add column tamanho char (1);

insert into tamanho (tamanho)
values ("P"),
("M"),
("G");

insert into pasteis (nome_pastel, categoria, fk_tamanho)
values("Pastel de Flango","Flango", 1);


delete from pasteis where categoria = 'F';

alter table pasteis change column categoria categorias varchar(45);

insert into pasteis (nome_pastel, categorias, fk_tamanho)
values("Pastel de Flango","Flango", 1);

select * from pasteis; 
select * from tamanho;



select * from clientes;










insert into clientes(nome_completo,nome_cadastro,nascimento,telefone,email,bairro,cidade,estado)
values("Taiana Silva", "Taiana","2001-05-29","75981111111","Taianasilva@gmail.com","centro","Feira de santana","Bahia"),
("Jurema do mato", "Jurema","1995-02-15","75981222222","juremasmatos@gmail.com","centro","Feira de Santana","Bahia"),
("thiguinho santista", "Thiago","2000-05-08","75982333333","thiaguin@gmail.com","centro","Feira de santana","Bahia"),
("silvano sales", "silvano","1995-02-25","75984333333","silvano sales@gmail.com","new city","Feira de Santana","Bahia"),
("tales silva", "Tales","1990-01-01","75984563210","talessilva@gmail.com","New Street","Feira de santana","Bahia"),
("jorge bahia", "jorge","1995-02-15","75985647125","jorgebahia@gmail.com","Brokylin","Feira de Santana","Bahia"),
("tayana teles", "tay","1997-05-08","75986324578","tay10@gmail.com","feira 1","Feira de santana","Bahia"),
("roberval santos", "roberval","1990-05-05","75981111121","taliscasouza@gmail.com","centro","Feira de Santana","Bahia");

select * from tamanho;

insert into pasteis (nome_pastel, categorias, fk_tamanho)
values
("Pastel de Flango","Flango", 2),
("Pastel de Flango","Flango", 3),
("Pastel de Queijo", "Queijo", 1),
("Pastel de Queijo", "Queijo", 2),
("Pastel de Queijo", "Queijo", 3),
("Pastel Chines","Queijo", 1),
("Pastel Chines","Queijo", 2),
("Pastel Chines","Queijo", 3),
("Pastel de Carne", "Carne", 1),
("Pastel de Carne", "Carne", 2),
("Pastel de Carne", "Carne", 3),
("Pastel de Carne c/ queijo", "Misto", 1),
("Pastel de Carne c/ queijo", "Misto", 2),
("Pastel de Carne c/ queijo", "Misto", 3),
("Pastel Queijo com Presunto","Misto", 1),
("Pastel Queijo com Presunto","Misto", 2),
("Pastel queijo com presunto","Misto", 3),
("Pastel de Pizza", "Misto", 1),
("Pastel de Pizza","Misto", 2);

select * from recheio;

drop table recheio;

insert into recheio (descricao)
values 
("Frango"),
("Carne"),
("Queijo"),
("Misto"),
("Camarao"),
("Carne do Sol");

select * from bebidas;

insert into bebidas(nome_bebida, fk_tamanho)
values
("coca-cola", 1),
("coca-cola", 2),
("coca-cola", 3),
("Fanta", 1),
("Fanta", 2),
("Fanta", 3),
("Kuat", 1),
("Kuat", 2),
("Kuat", 3),
("suco de laranja" ,1),
("suco de laranja" ,2),
("suco de laranja" ,3),
("suco de outras frutas",1),
("suco de outras frutas",2),
("suco de outras frutas",3),
("Agua Mineral",2);

select * from pasteis;





insert into pasteisTam (fk_pastel, fk_tamanho, valor_pastel)
values
(2, 2, 10.00),
(3, 3, 15.00),
(4, 1, 5.00),
(5, 2, 10.00),
(6, 3, 15.00),
(7, 1, 5.00),
(8, 2, 10.00),
(9, 3, 15.00),
(10, 1, 5.00),
(11, 2, 10.00),
(12, 3, 15.00),
(13, 1, 5.00),
(14, 2, 10.00),
(15, 3, 15.00),
(16, 1, 5.00),
(17, 1, 5.00);

;

select * from pasteisTam;

select * from bebidasTam;

select * from bebidas;
 
 insert into bebidasTam (fk_bebida, fk_tamanho, valor_bebida)
 values 
 (1, 1, 3.00),
 (2, 2, 5.00),
 (3, 3, 10.00 ),
  (4, 1, 3.00),
 (5, 2, 5.00),
 (6, 3, 10.00 ),
  (7, 1, 3.00),
 (8, 2, 5.00),
 (9, 3, 10.00 ),
  (10, 1, 3.00),
 (11, 2, 5.00),
 (12, 3, 10.00 ),
  (13, 1, 3.00),
 (14, 2, 5.00),
 (15, 3, 10.00 ),
 (16, 2 , 3.00);
 
 select * from bebidasTam;
 
 select * from pedidos;
 
 select * from clientes;
 
 select * from pasteisTam;
 
 select * from bebidasTam;
 
insert into pedidos(fk_pastelTam, fk_bebidaTam, fk_cliente, valor_total)
values
(1 , 1, 1, 8.00),
(2, 1, 2, 13.00),
(1 , 1, 3, 8.00),
(3 , 3, 4, 25.00),
(1 , 3, 5, 15.00),
(2, 2, 6, 15.00),
(2, 1, 7, 13.00),
(3, 3, 8, 25.00),
(1, 1, 9, 8.00),
(1, 2, 10, 10.00),
(2 , 1, 11, 8.00),
(3, 3, 12, 25.00),
(3, 3, 13, 25.00),
(1, 1, 14, 8.00);



insert into pedidos(fk_pastelTam, fk_bebidaTam, fk_cliente, valor_total)
values
(1, 2, 5, 10.00);
 
select * from clientes;
