use pastelaria1;

# QUESTÃO 1
select p.nome_pastel
from pasteis p
join pasteis_recheio pr on p.id_pastel = pr.fk_pastel
join recheio r on pr.fk_recheio = r.id_recheio
join itens_pedido ip on p.id_pastel = ip.fk_pastelTam
join pedidos pe on ip.fk_pedido = pe.id_pedido
join clientes c on pe.fk_cliente = c.id_cliente
where r.descricao = 'Vegano' and DATEDIFF(CURDATE(), c.nascimento) >= 18;

# QUESTÃO 2
select 
    month(data_pedido) as mes,
    year(data_pedido) as ano,
    c.nome_completo,
    COUNT(*) as total_pedidos
from 
    pedidos p
join 
    clientes c on p.fk_cliente = c.id_cliente
where 
    year(data_pedido) = 2023
group by
    mes, c.id_cliente
order by 
    mes, total_pedidos desc;
    
# QUESTÃO 3
select distinct p.nome_pastel
from pasteis p
join pasteis_recheio pr1 on p.id_pastel = pr1.fk_pastel
join recheio r1 on pr1.fk_recheio = r1.id_recheio and r1.descricao = 'bacon'
join pasteis_recheio pr2 on p.id_pastel = pr2.fk_pastel
join recheio r2 on pr2.fk_recheio = r2.id_recheio and r2.descricao = 'queijo';

# QUESTÃO 4
select SUM(valor_pastel) as valor_total_venda
from pasteis_tamanho;

# QUESTÃO 5
select distinct pe.id_pedido
from itens_pedido ip
join pedidos pe on ip.fk_pedido = pe.id_pedido
where ip.fk_pastelTam is not null and ip.fk_bebidaTam is not null;

# QUESTÃO 6
select
    p.id_pastel,
    p.nome_pastel,
    COUNT(ip.fk_pastelTam) as quantidade_vendas
from 
    pasteis p
join 
    itens_pedido ip on p.id_pastel = ip.fk_pastelTam
group by
    p.id_pastel, p.nome_pastel
order by
    quantidade_vendas asc;
