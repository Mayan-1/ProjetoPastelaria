 use pastelaria1;
create view view_entregas as 
select
id_pedido as entrega_id,
fk_cliente,
bairro as clientes

from pedidos, clientes;


create  view view_produtos as
select 
nome_bebida as bebidas,
nome_pastel as pasteis
from bebidas, pasteis;


create view todos_clientes as
select 
nome_completo as clientes
from clientes;




create view view_soma_vendas as
select 
 sum(valor_total)
 from itens_pedido;


create view view_ingredientes as 
select 
descricao
from recheio;

create view view_bebidas as 
select 
fk_bebida as bebidas_tamanho,
fk_tamanho 
from bebidas_tamanho;

create view view_data_pedidos as 
select
data_pedido
from  pedidos;

create view view_aniversariantes_mes as
select
id_cliente,
nome_cadastro,
nascimento
from clientes;

create view view_reclamações as 
select
id_cliente,
nome_cadastro,
telefone
from
clientes;


create view view_precos as
select 
valor_bebida as bebidas_tamanho,
valor_pastel as pasteis_tamanho

from bebidas_tamanho, pasteis_tamanho;


