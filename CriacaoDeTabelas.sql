create database pastelaria1;
use pastelaria1;

# TABELA CLIENTES
create table clientes(
	id_cliente int(11) not null auto_increment primary key,
    nome_completo varchar(300) not null,
    nome_cadastro varchar(150) not null,
    nascimento date not null,
    telefone varchar(11) not null,
    email varchar(50) not null,
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    estado varchar(20) not null
);

# TABELA TAMANHO
create table tamanho(
	id_tamanho int(11) not null auto_increment primary key,
    tamanho char(1) not null
);

# TABELA PASTEIS 
create table pasteis(
	id_pastel int(11) not null auto_increment primary key,
    nome_pastel varchar(45) not null,
    categoria varchar(45),
    fk_tamanho int(11) not null,
    foreign key (fk_tamanho) references tamanho(id_tamanho)
);

# TABELA RECHEIO
create table recheio(
	id_recheio int(11) not null auto_increment primary key,
    descricao varchar(45) not null
);

# TABELA PASTEIS_RECHEIO COM RELAÇÃO DE MUITOS PARA MUITOS 
create table pasteis_recheio(
	id_pastelRecheio int(11) not null auto_increment primary key,
    fk_pastel int(11) not null,
    fk_recheio int(11) not null,
    foreign key(fk_pastel) references pasteis(id_pastel),
    foreign key(fk_recheio) references recheio(id_recheio)
);

# TABELA BEBIDAS
create table bebidas(
	id_bebida int(11) not null auto_increment primary key,
    nome_bebida varchar(45) not null,
    fk_tamanho int(11) not null,
    foreign key (fk_tamanho) references tamanho(id_tamanho)
);


# TABELA PASTEIS_TAMANHO COM RELAÇÃO DE MUITOS PARA MUITOS
create table pasteis_tamanho(
	id_pastelTam int(11) not null auto_increment primary key,
    fk_pastel int(11) not null,
    fk_tamanho int(11) not null,
    valor_pastel float not null,
	foreign key (fk_pastel) references pasteis(id_pastel),
	foreign key (fk_tamanho) references tamanho(id_tamanho)
);

# TABELA BEBIDAS_TAMANHO COM RELAÇÃO DE MUITOS PARA MUITOS
create table bebidas_tamanho(
	id_bebidasTam int(11) not null primary key	auto_increment,
    fk_bebida int(11) not null,
    fk_tamanho int(11) not null,
    valor_bebida float not null,
    foreign key (fk_tamanho) references tamanho(id_tamanho),
    foreign key (fk_bebida) references bebidas(id_bebida)
);


# TABELA PEDIDOS
create table pedidos(
	id_pedido int(11) not null auto_increment primary key,
    fk_cliente int(11) not null,
    valor_total float not null,
    data_pedido date not null,
    foreign key (fk_cliente) references clientes(id_cliente)
);

# TABELA ITENS_PEDIDO COM RELAÇÃO DE MUITOS PARA MUITOS
create table itens_pedido(
	id_itensPedido int(11) not null auto_increment primary key,
    fk_pedido int(11) not null,
    fk_pastelTam int(11),
    fk_bebidaTam int(11),
    valor_total float not null,
    foreign key (fk_pedido) references pedidos(id_pedido),
    foreign key (fk_pastelTam) references pasteis_tamanho(id_pastelTam),
    foreign key (fk_bebidaTam) references bebidas_tamanho(id_bebidasTam)
);