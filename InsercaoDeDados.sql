use pastelaria1;

insert into clientes(nome_completo,nome_cadastro,nascimento,telefone,email,bairro,cidade,estado)
values("David Eduardo dos Santos Ferreira", "David",'2001-09-16',"75984846551","davidedsf09@gmail.com","centro","terra nova","Bahia"),
("Maria Eduarda dos Santos Ferreira", "Eduarda",'2008-05-16',"75984545451","mariaedsf09@gmail.com","centro","terra nova","Bahia"),
("Carlos Eduardo dos Santos Ferreira", "Carlos",'2007-09-16',"759844451","carlosedsf09@gmail.com","centro","terra nova","Bahia"),
("Taiana Silva", "Taiana","2001-05-29","75981111111","Taianasilva@gmail.com","centro","Feira de santana","Bahia"),
("Jurema do mato", "Jurema","1995-02-15","75981222222","juremasmatos@gmail.com","centro","Feira de Santana","Bahia"),
("thiguinho santista", "Thiago","2000-05-08","75982333333","thiaguin@gmail.com","centro","Feira de santana","Bahia"),
("silvano sales", "silvano","1995-02-25","75984333333","silvano sales@gmail.com","new city","Feira de Santana","Bahia"),
("tales silva", "Tales","1990-01-01","75984563210","talessilva@gmail.com","New Street","Feira de santana","Bahia"),
("jorge bahia", "jorge","1995-02-15","75985647125","jorgebahia@gmail.com","Brokylin","Feira de Santana","Bahia"),
("tayana teles", "tay","1997-05-08","75986324578","tay10@gmail.com","feira 1","Feira de santana","Bahia"),
("roberval santos", "roberval","1990-05-05","75981111121","taliscasouza@gmail.com","centro","Feira de Santana","Bahia");


insert into tamanho (tamanho)
values ("P"),
("M"),
("G");


select * from pasteis;
    
insert into pasteis(nome_pastel)
values
("Pastel de Flango"),
("Pastel Chines"),
("Pastel de Carne"),
("Pastel de Queijo e Presunto"),
("Pastel de Camarao");

insert into pasteis(nome_pastel, categoria)
values
("Pastel de Palmito", "Vegano"),
("Pastel de abobrinha", "Vegano"),
("Pastel de brocólis", "Vegano"),
("Pastel de queijo s/lactose", "Sem Lacoste"),
("Pastel de Queijo", "Vegetariano");

select * from pasteis;

insert into recheio(descricao)
values
("Flango"),
("Brocolis"),
("Abobrinha"),
("Queijo"),
("Presunto"),
("Carne"),
("Camarão");

insert into recheio(descricao)
values
("Queijo s/Lactose"),
("Palmito");


select * from pasteis;
select * from recheio;

insert into pasteis_recheio(fk_pastel, fk_recheio)
values
(1, 1),
(2, 6),
(3, 6),
(4, 4),
(4, 5),
(5, 7),
(6, 9),
(7, 3),
(8, 2),
(9, 8),
(10, 4);

insert into bebidas(nome_bebida)
values
("coca-cola"),
("Fanta"),
("Kuat"),
("Suco de laranja"),
("Suco de goiaba"),
("Agua Mineral");

select * from bebidas;
select * from pasteis;
select * from tamanho;

insert into pasteis_tamanho(fk_pastel, fk_tamanho, valor_pastel)
values
(1, 1, 3.00),
(1, 2, 5.00),
(1, 3, 7.00),
(2, 1, 4.00),
(2, 2, 5.00),
(2, 3, 8.00),
(3, 1, 3.00),
(3, 2, 5.00),
(3, 3, 7.00),
(4, 1, 3.00),
(4, 2, 5.00),
(4, 3, 7.00),
(5, 1, 4.50),
(5, 2, 7.50),
(5, 3, 9.50),
(6, 1, 6.00),
(6, 2, 12.00),
(6, 3, 16.00),
(7, 1, 5.00),
(7, 2, 8.00),
(7, 3, 15.00),
(8, 1, 5.00),
(8, 2, 8.00),
(8, 3, 15.00),
(9, 1, 6.00),
(9, 2, 12.00),
(9, 3, 16.00),
(10, 1, 5.00),
(10, 2, 7.00),
(10, 3, 10.00);

select * from bebidas;
insert into bebidas_tamanho(fk_bebida, fk_tamanho, valor_bebida)
values
(1, 1, 3.00),
(1, 2, 5.00),
(1, 3, 7.00),
(2, 1, 3.00),
(2, 2, 5.00),
(2, 3, 7.00),
(3, 1, 2.00),
(3, 2, 3.50),
(3, 3, 5.50),
(4, 1, 4.00),
(4, 2, 6.00),
(4, 3, 9.00),
(5, 1, 4.00),
(5, 2, 6.00),
(5, 3, 9.00),
(6, 1, 3.00),
(6, 2, 4.00),
(6, 3, 6.00);



