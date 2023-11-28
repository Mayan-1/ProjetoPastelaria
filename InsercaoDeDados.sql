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
