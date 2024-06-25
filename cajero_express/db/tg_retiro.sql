DELIMITER //

CREATE TRIGGER tg_retiro
BEFORE UPDATE ON tb_tarjetas
FOR EACH ROW
BEGIN

    DECLARE v_saldo DECIMAL(20,2);
    DECLARE v_monto DECIMAL(20,2);
    DECLARE retiro_id INT;

    -- Consulta el id_tipo_movimiento
    SELECT id_tipo_movimiento INTO retiro_id
    FROM tb_tipo_movimientos
    WHERE tipo = 'retiro';

    SET v_saldo = OLD.saldo;
    SET v_monto = NEW.saldo - OLD.saldo;

    IF v_monto < 0 THEN
    -- cuando se resta el saldo acutal con el viejo, el valor es negativo (invertirmos los signos)
        SET v_monto = -v_monto;
            IF v_saldo >= v_monto THEN
                INSERT INTO tb_movimientos (monto,id_tarjeta,id_tipo_movimiento)
                VALUE (v_monto,OLD.id_tarjeta,retiro_id);

                -- Actualizar el saldo tb_tarjetas
                SET NEW.saldo = OLD.saldo - v_monto;

                ELSE

                --  mensaje de error en mysql
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Saldo insuficiente';
            END IF;
    END IF;
END;
DELIMITER ;