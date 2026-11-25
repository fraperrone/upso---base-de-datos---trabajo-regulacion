


-- 1 sentencias contenidas en una transaccion
START TRANSACTION;

-- 2 agregar un campo con la fecha del registro del cliente

-- 3 agregar campo costo como entero en la tabla de productos

ALTER TABLE productos
ADD COLUMN costo INT

-- 4 modificar el tipo de datos del campo costo de los productos a decimal
--   3 para la entera y dos para decimal

ALTER TABLE productos
MODIFY COLUMN costo DECIMAL(3,2

-- 5 eliminar costo de la tabla productos

ALTER TABLE productos
DROP COLUMN costo;

-- a posibilidad de deshacer hasta este punto 
-- b con la etiqueta hasta_eliminar_costo

SAVEPOINT hasta_eliminar_costo


-- 6 creacion de indices para los clientes 