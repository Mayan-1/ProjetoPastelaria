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

