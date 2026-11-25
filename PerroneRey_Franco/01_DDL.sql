
-- CREACION DE LA BASE DE DATOS
DROP DATABASE IF EXISTS eshop;

CREATE DATABASE eshop
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;

USE eshop;


-- CREACION DE TABLAS

CREATE TABLE clientes (
    id_cliente INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    email VARCHAR(250) NOT NULL,
    telefono VARCHAR(30) NOT NULL,

    PRIMARY KEY (id_cliente)
) ENGINE=InnoDB;

CREATE TABLE categorias (
    id_categoria INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL DEFAULT 'accesorios',

    PRIMARY KEY (id_categoria),
    UNIQUE (nombre)
) ENGINE=InnoDB;

CREATE TABLE productos (
    id_producto INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_categoria INT UNSIGNED NOT NULL,
    nombre VARCHAR(80) NOT NULL,
    descripcion VARCHAR(500),
    precio_venta DECIMAL(10,2) NOT NULL CHECK (precio_venta > 0),
    stock INT UNSIGNED NOT NULL DEFAULT 0,

    PRIMARY KEY (id_producto),

    CONSTRAINT fk_producto_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
) ENGINE=InnoDB;





CREATE TABLE pedidos (
    id_pedido INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_cliente INT UNSIGNED NOT NULL,
    fecha_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('pendiente', 'pagado', 'enviado')
        NOT NULL DEFAULT 'pendiente',

    PRIMARY KEY (id_pedido),

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
) ENGINE=InnoDB;


CREATE TABLE detalle_pedido (
    id_detalle BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_pedido INT UNSIGNED NOT NULL,
    id_producto INT UNSIGNED NOT NULL,
    cantidad INT UNSIGNED NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL CHECK (precio_unitario > 0),

    PRIMARY KEY (id_detalle),

    CONSTRAINT fk_pedido_detalle
        FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido),

    CONSTRAINT fk_producto_detalle
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
) ENGINE=InnoDB;