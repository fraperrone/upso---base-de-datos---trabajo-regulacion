

-- CREAMOS LA BASE DE DATOS
-- debe permitir almacenar cualquier tipo de caracteres
-- se ignoren acentos y la sensibilidad de mayuscula y minusculas
-- explicitar consignas anteriores

DROP DATABASE IF EXISTS eshop;

CREATE DATABASE eshop
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;

USE eshop;

-- CREACION DE TABLAS
-- primary key en todas las tablas
-- claves foraneas que vinculen correctament las tablas
-- restricciones not null
-- valores por defecto DEFAULT, UNIQUE, CHECK
-- tipo de dato MINUVIOSAMENTE elegido
-- todas en una transaccion
-- SI EXISTE LA DB se debera aplicar las sentencias para REEMPLAZARLA


CREATE TABLE clientes(
    id_cliente INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    email VARCHAR(250) NOT NULL UNIQUE,
    telefono VARCHAR(30) NOT NULL
    )

CREATE TABLE productos(
    id_producto INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    descripcion VARCHAR(500),
    precio_venta DECIMAL(10, 2) CHECK (precio > 0),
    stock INT check (stock >= 0)
)

CREATE TABLE categorias(
    id_categoria INT UNSIGNED NOT NULL AUTO_INCRMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL DEFAULT "accesorios"
)


CREATE TABLE pedidos(
    id_pedido INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_cliente INT UNSIGNED NOT NULL ,
    id_detalle INT UNSIGNED NOT NULL,
    fecha_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('pendiente', 'pagado', 'enviado'),

    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_cliente) references clientes(id_cliente),
    FOREIGN KEY (id_detalle) references detalle_pedido(id_detalle)

)

-- Tabla intermedia
CREATE TABLE detalle_pedido(
    id_detalle BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_pedido BIGINT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL CHECK(precio_unitario > 0),

    CONSTRAINT pk_detalle_pedido PRIMARY KEY (id_detalle),
    CONSTRAINT fk_pedido_detalle
        FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
    CONSTRAINT fk_producto_detalle
        FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
)