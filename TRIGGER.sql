use pastelaria1;

DELIMITER //

CREATE TRIGGER after_insert_cliente
AFTER INSERT ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO log_clientes (acao, cliente_id, data) 
    VALUES ('Inserção', NEW.id_cliente, NOW());
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_pastel_tamanho
BEFORE UPDATE ON pasteis_tamanho
FOR EACH ROW
BEGIN
    SET NEW.valor_pastel = NEW.valor_pastel * (SELECT valor_tamanho FROM tamanho WHERE id_tamanho = NEW.fk_tamanho);
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_bebidas_tamanho
BEFORE DELETE ON bebidas_tamanho
FOR EACH ROW
BEGIN
    DECLARE count_pedidos INT;
    SELECT COUNT(*) INTO count_pedidos FROM itens_pedido WHERE fk_bebidaTam = OLD.id_bebidasTam;
    IF count_pedidos > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é possível excluir esta bebida, pois existem pedidos associados.';
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_update_itens_pedido
AFTER UPDATE ON itens_pedido
FOR EACH ROW
BEGIN
    UPDATE pedidos
    SET valor_total = (SELECT SUM(valor_total) FROM itens_pedido WHERE fk_pedido = NEW.fk_pedido)
    WHERE id_pedido = NEW.fk_pedido;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_cliente
BEFORE DELETE ON clientes
FOR EACH ROW
BEGIN
    DECLARE count_pedidos INT;
    SELECT COUNT(*) INTO count_pedidos FROM pedidos WHERE fk_cliente = OLD.id_cliente;
    IF count_pedidos > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é possível excluir este cliente, pois existem pedidos associados.';
    END IF;
END;
//

DELIMITER ;

