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

CREATE TABLE correspondencias(
    id_correspondencia INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    direccion VARCHAR(500),
    codigo_postal VARCHAR(5),
    referencia VARCHAR(500),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

http://localhost/sm35_2024/?
nombre=dfgh
&ap_paterno=fgh
&ap_materno=fgh
&fecha_nacimiento=2024-05-04
&correo_electronico=dfghj%40gmail.com
&telefono=1234567890