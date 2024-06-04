CREATE DATABASE tb_clientes;

USE tb_clientes;

CREATE TABLE clientes(
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    ap_paterno VARCHAR(50),
    ap_materno VARCHAR(50),
    fecha_nacimiento DATE,
    correo_electronico VARCHAR(100),
    telefono VARCHAR(10)
);

CREATE INDEX idx_correo_electronico ON clientes(correo_electronico);

CREATE INDEX idx_telefono ON clientes(telefono);
INSERT INTO
    clientes(
        nombre,
        ap_paterno,
        ap_materno,
        fecha_nacimiento,
        correo_electronico,
        telefono
    ) VALUE (
        'Juan',
        'Perez',
        'Lopez',
        '1990-05-04',
        'juan@gmail.com',
        '1234567890'
    );
    
CREATE TABLE correspondencias(
    id_correspondencia INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    direccion VARCHAR(500),
    codigo_postal VARCHAR(5),
    referencia VARCHAR(500),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


// Creacion de INDEX
CREATE INDEX idx_id_cliente ON correspondencias(id_cliente)

// Crear los procesimientos almacenados para insertar en la tabla cliente

DELIMITER //
CREATE PROCEDURE insertar_cliente(
    IN nombre VARCHAR(50),
    IN ap_paterno VARCHAR(50),
    IN ap_materno VARCHAR(50),
    IN fecha_nacimiento DATE,
    IN correo_electronico VARCHAR(100),
    IN telefono VARCHAR(10)
)
BEGIN
    INSERT INTO
        clientes(
            nombre,
            ap_paterno,
            ap_materno,
            fecha_nacimiento,
            correo_electronico,
            telefono
        ) VALUE (
            nombre,
            ap_paterno,
            ap_materno,
            fecha_nacimiento,
            correo_electronico,
            telefono
        );
END //

// Crear los procesimientos almacenados para actualizar en la tabla cliente

DELIMITER //
CREATE PROCEDURE actualizar_cliente(
    IN cliente_id INT,
    IN nombre VARCHAR(50),
    IN ap_paterno VARCHAR(50),
    IN ap_materno VARCHAR(50),
    IN fecha_nacimiento DATE,
    IN correo_electronico VARCHAR(100),
    IN telefono VARCHAR(10)
)
BEGIN
    UPDATE
        clientes
    SET
        nombre = nombre,
        ap_paterno = ap_paterno,
        ap_materno = ap_materno,
        fecha_nacimiento = fecha_nacimiento,
        correo_electronico = correo_electronico,
        telefono = telefono
    WHERE
        id_cliente = cliente_id;
END //


// Crear los procesimientos almacenados para eliminar en la tabla cliente

DELIMITER //
CREATE PROCEDURE sp_eliminar_cliente(
IN cliente_id INT
)
BEGIN
DELETE FROM clientes
WHERE id_cliente = cliente_id;
END //

