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

CREATE INDEX idx_id_cliente ON correspondencias(id_cliente)