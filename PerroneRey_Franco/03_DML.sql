-- 1) Sentencias INSERT para completar las tablas con datos de prueba: 
-- a. Se debe respetar el orden de inserción para validar las restricciones. 
-- b. Deben incorporarse registros para que todas las consultas solicitadas en este trabajo 
-- otorguen al menos un dato.  
-- 2) Debido a la inflación, la empresa ha decidido aumentar el precio de todos los productos perte-
-- necientes a la categoría 'Celulares' en un 15% (hacerlo mediante su código). Escribe la senten-
-- cia necesaria. 
-- 3) Intenta  eliminar  al  cliente  con  el  id  =  1  utilizando  DELETE.  Si  este  cliente  ya  tiene  pedidos 
-- registrados en el sistema, explica detalladamente qué error o comportamiento lanzará MySQL 
-- y cómo se relaciona con las restricciones de clave foránea que definiste en el modelo físico. 


-- 1 INSERT las tablas con datos de prueba
-- CATEGORIAS
-- PRODUCTOS
-- CLIENTES
-- PEDIDOS
-- DETALLE_PEDIDOS

INSERT INTO categorias (nombre) VALUES
('Celulares'),
('Computadoras'),
('Accesorios'),
('Audio'),
('Perifericos'),
('Almacenamiento'),
('Monitores'),
('Componentes');


INSERT INTO productos (
    id_categoria,
    nombre,
    descripcion,
    precio_venta,
    stock
) VALUES
(1, 'Samsung Galaxy S24', 'Smartphone con pantalla AMOLED', 850000.00, 15),
(2, 'Notebook Lenovo', 'Notebook con procesador Intel Core i7', 1200000.00, 8),
(3, 'Mouse Logitech', 'Mouse inalámbrico ergonómico', 35000.00, 30),
(4, 'Auriculares Sony', 'Auriculares inalámbricos con cancelación de ruido', 95000.00, 12),
(7, 'Monitor LG', 'Monitor IPS Full HD de 24 pulgadas', 220000.00, 10);

INSERT INTO clientes (
    nombre,
    apellido,
    email,
    telefono
) VALUES
('Franco', 'Perrone', 'franco@example.com', '1123456789'),
('Lucia', 'Martinez', 'lucia@example.com', '1134567890'),
('Martin', 'Gonzalez', 'martin@example.com', '1145678901'),
('Sofia', 'Rodriguez', 'sofia@example.com', '1156789012'),
('Lucas', 'Fernandez', 'lucas@example.com', '1167890123'),
('Camila', 'Lopez', 'camila@example.com', '1178901234'),
('Nicolas', 'Garcia', 'nicolas@example.com', '1189012345'),
('Valentina', 'Perez', 'valentina@example.com', '1190123456');