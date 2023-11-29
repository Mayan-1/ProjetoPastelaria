USE pastelaria1;

DELIMITER //
CREATE FUNCTION Desconto10Aniversario(
    id_cliente INT,
    valor_total DECIMAL(10, 2)
) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE desconto DECIMAL(10, 2);

    DECLARE nascimento DATE;
    SELECT nascimento INTO nascimento
    FROM clientes
    WHERE id = id_cliente;

    
    IF DATE_FORMAT(nascimento, '%m-%d') = DATE_FORMAT(NOW(), '%m-%d') THEN
        
        SET desconto = valor_total * 0.1;
    ELSE
        SET desconto = 0.0; 
    END IF;

    RETURN desconto;
END;
//

SELECT nascimento as Desconto10Aniversario from clientes;


DELIMITER //

CREATE PROCEDURE CadastrarCliente(
    nome_completo varchar(300),
    nome_cadastro varchar(150),
    nascimento date,
    telefone varchar(11),
    email varchar(50),
    bairro varchar(50),
    cidade varchar(50),
    estado varchar(20)
)
BEGIN
    DECLARE id_cliente int;
    START TRANSACTION;
    INSERT INTO clientes (nome_completo, nome_cadastro, nascimento, telefone, email, bairro, cidade, estado)
    VALUES (nome_completo, nome_cadastro, nascimento, telefone, email, bairro, cidade, estado);
     SET id_cliente = LAST_INSERT_ID();
END; //

DELIMITER ;


DELIMITER //

CREATE FUNCTION QtdPedidosCliente (id_cliente INT) RETURNS INT
BEGIN
    DECLARE total_pedidos INT;

    SELECT COUNT(*) INTO total_pedidos
    FROM pedidos
    WHERE fk_cliente = id_cliente;

    RETURN total_pedidos;
END //

DELIMITER ;

SELECT QtdPedidosCliente(1) AS total_pedidos_cliente;


DELIMITER //

CREATE PROCEDURE NovoPedido(
    IN cliente_id INT,
    IN pastel_id INT,
    IN tamanho_pastel_id INT,
    IN bebida_id INT,
    IN tamanho_bebida_id INT,
    IN data_pedido DATE
)
BEGIN
    DECLARE valor_total_pedido FLOAT;
    
    SELECT 
        COALESCE(SUM(pt.valor_pastel), 0) + COALESCE(SUM(bt.valor_bebida), 0) INTO valor_total_pedido
    FROM 
        pasteis_tamanho pt
    LEFT JOIN 
        bebidas_tamanho bt ON pt.fk_tamanho = bt.fk_tamanho
    WHERE 
        pt.fk_pastel = pastel_id AND pt.id_pastelTam = tamanho_pastel_id
        AND bt.fk_bebida = bebida_id AND bt.id_bebidasTam = tamanho_bebida_id;

    
    INSERT INTO pedidos (fk_cliente, valor_total, data_pedido) VALUES (cliente_id, valor_total_pedido, data_pedido);

    
    SET @pedido_id = LAST_INSERT_ID();

    
    INSERT INTO itens_pedido (fk_pedido, fk_pastelTam, fk_bebidaTam, valor_total)
    VALUES (@pedido_id, tamanho_pastel_id, tamanho_bebida_id, valor_total_pedido);
    
END //

DELIMITER ;


DELIMITER //

CREATE FUNCTION adicionarNovoSaborRecheio(
    novo_sabor_recheio VARCHAR(45)
) RETURNS VARCHAR(100)
BEGIN
    DECLARE mensagem VARCHAR(100);

    IF NOT EXISTS (SELECT 1 FROM recheio WHERE descricao = novo_sabor_recheio) THEN
        
        INSERT INTO recheio (descricao) VALUES (novo_sabor_recheio);
        SET mensagem = 'Novo sabor de recheio adicionado com sucesso.';
    ELSE
        SET mensagem = 'Este sabor de recheio já existe.';
    END IF;

    RETURN mensagem;
END //

DELIMITER ;

SELECT adicionarNovoSaborRecheio('Bacalhau') AS resultado;


DELIMITER //

CREATE PROCEDURE InformarStatusPedido(
    IN pedido_id INT
)
BEGIN
    DECLARE status_pedido VARCHAR(20);

    IF EXISTS (SELECT 1 FROM itens_pedido WHERE fk_pedido = pedido_id) THEN
        SET status_pedido = 'Concluído';
    ELSE
        SET status_pedido = 'Em Andamento';
    END IF;

    SELECT status_pedido AS status_pedido;
END //

DELIMITER ;


CALL InformarStatusPedido(@pedido_id);


