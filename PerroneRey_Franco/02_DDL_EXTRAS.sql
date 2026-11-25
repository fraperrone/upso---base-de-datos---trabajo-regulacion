


-- 1 sentencias contenidas en una transaccion
START TRANSACTION;

-- 2 agregar un campo con la fecha del registro del cliente

ALTER TABLE clientes
ADD COLUMN fecha_registro DATE NOT NULL DEFAULT (CURRENT_DATE);

-- 3 agregar campo costo como entero en la tabla de productos

ALTER TABLE productos
ADD COLUMN costo INT

-- 4 modificar el tipo de datos del campo costo de los productos a decimal
--   3 para la entera y dos para decimal

ALTER TABLE productos
MODIFY COLUMN costo DECIMAL(3, 2)

-- 5 eliminar costo de la tabla productos

ALTER TABLE productos
DROP COLUMN costo;

-- a posibilidad de deshacer hasta este punto 
-- b con la etiqueta hasta_eliminar_costo

SAVEPOINT hasta_eliminar_costo


-- 6 creacion de indices para los clientes 


CREATE INDEX idx_clientes_nombre
ON clientes(nombre);

CREATE INDEX idx_productos_nombre
ON productos(nombre);

CREATE INDEX idx_categorias_nombre
ON categorias(nombre);

-- 7 Se deberá indicar un índice único para el correo electrónico de los clientes (usar ALTER). 

ALTER TABLE clientes
ADD CONSTRAINT uq_clientes_email UNIQUE (email);

-- 8) Agregar un índice compuesto para el apellido y nombre de los clientes.

CREATE INDEX idx_clientes_apellido_nombre
ON clientes(apellido, nombre);

-- 9) Se realizan muchas consultas sobre productos indicando su nombre y ordenándolos luego por 
-- el precio de venta, por lo tanto, es necesario incorporar un índice que agilice ese tipo de con-
-- sultas.

CREATE INDEX idx_productos_nombre_precio
ON productos(nombre, precio_venta);

-- 10) Se deberá agregar un índice a los productos para realizar búsquedas de texto sobre la descrip-
-- ción, esto permitirá localizar productos por palabras claves (usar ALTER). 

CREATE INDEX idx_productos_nombre_precio
ON productos(nombre, precio_venta);


-- 11) Indicar la sentencia, pero en comentario, para realizar un rollback hasta la etiqueta indicada en 
-- 5) b

-- ROLLBACK TO SAVEPOINT hasta_eliminar_costo;