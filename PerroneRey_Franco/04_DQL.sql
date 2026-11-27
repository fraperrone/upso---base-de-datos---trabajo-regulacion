-- Para cada una de estas consultas, antes de cada sentencia, se debe indicar como comentario el ciclo 
-- de ejecución de la consulta SQL, es decir, qué sentencia ocurre primero, cómo se van filtrando los datos, 
-- en qué orden, por ejemplo: 
--  ...  
-- 4. SELECT Selecciona las columnas y calcula las expresiones finales. 
-- 5. ORDER BY del precio de forma ascendente, los datos ya están filtrados 
-- 6. LIMIT se limitan el resultado a 10 registros




-- 1 un listado de los 5 productos que tengan un stock mayor a 10, de debe mostrar nombre precio
-- y stock ordenado del mas costoso al mas economico

-- orden de ejecucion: 1- selecciono las columnas que quiero mostrar de tabla productos
-- 2- se define el filtro, en este caso stock mayor a 10
-- 3- se define el orden, en este caso por la columna precio de forma descendente
-- 4- el limite de la cantidad de productos a mostrar, en este caso 5
select nombre, precio_venta, stock from productos
where stock > 10
order by precio_venta desc
limit 5;



-- 2 consultaL devuelva el codigo de la caterogia  y la cantidad total de productos
-- asociados a ella

-- Orden ejecucion: 1- se seleccionan las columnas de interes de la tabla productos
-- en este cado id categoria y funcion count(*) que sirve para contar cantidad 
-- con la sentencia de groupby

select id_categoria, count(*) as cantidad_productos from productos
group by id_categoria


-- 3 consulta: Genera un reporte de control de inventario que muestre únicamente aquellas categorías de
-- productos cuyo precio promedio sea superior a $300. Muestra el código de la categoría y
-- dicho promedio.

-- Orden ejecucion: 
-- FROM productos → GROUP BY id_categoria → HAVING AVG(precio_venta) > 300 → SELECT id_categoria, AVG(precio_venta)

SELECT
    id_categoria,
    AVG(precio_venta) AS precio_promedio
FROM productos
GROUP BY id_categoria
HAVING AVG(precio_venta) > 300;


-- 4  consulta: Crea una consulta que identifique a los clientes que han realizado más de 5 pedidos en total y, 
-- de  forma  dinámica  e  inmediata,  inserte  sus  identificadores  en  una  tabla  llamada  clien-
-- tes_frecuente

-- Orden ejecucion:
-- FROM pedidos → GROUP BY id_cliente → HAVING COUNT(*) > 5 → SELECT id_cliente → INSERT INTO clientes_frecuentes

CREATE TABLE clientes_frecuentes (
    id_cliente INT UNSIGNED PRIMARY KEY,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO clientes_frecuentes (id_cliente)
SELECT
    id_cliente
FROM pedidos
GROUP BY id_cliente
HAVING COUNT(*) > 5;


-- 5:
-- Orden ejecucion: FROM categorias → LEFT JOIN productos → ON c.id_categoria = p.id_categoria → GROUP BY c.id_categoria, c.nombre → SELECT id_categoria, nombre, COALESCE(SUM(p.stock), 0)

SELECT
    c.id_categoria,
    c.nombre,
    COALESCE(SUM(p.stock), 0) AS stock_total
FROM categorias c
LEFT JOIN productos p
    ON c.id_categoria = p.id_categoria
GROUP BY
    c.id_categoria,
    c.nombre;


-- 6: Para una campaña de marketing de reactivación, se solicita un listado exclusivo que contenga
-- únicamente el ID, nombre y email de aquellos clientes registrados en el sistema que jamás hayan realizado un pedido de compra. Para este ejercicio, se exige estrictamente
-- estructurar la consulta utilizando la sintaxis de RIGHT JOIN.
-- a. TIP: se debe filtrar en el WHERE que el identificador del pedido sea NULL.


select c.id_cliente, c.nombre , c.email  
from pedidos p
right join clientes c
    on p.id_cliente = c.id_cliente
where p.id_pedido is null


--- 7:
-- Orden ejecucion: FROM productos → INNER JOIN detalle_pedido → ON p.id_producto = dp.id_producto → GROUP BY p.id_producto, p.nombre → HAVING SUM(dp.cantidad) > 50 → SELECT id_producto, nombre, SUM(dp.cantidad * dp.precio_unitario) → ORDER BY total_recaudado DESC
SELECT
    p.id_producto,
    p.nombre,
    SUM(dp.cantidad * dp.precio_unitario) AS total_recaudado
FROM productos p
INNER JOIN detalle_pedido dp
    ON p.id_producto = dp.id_producto
GROUP BY
    p.id_producto,
    p.nombre
HAVING SUM(dp.cantidad) > 50
ORDER BY total_recaudado DESC;




-- 8: 
-- Orden ejecucion: FROM productos → WHERE MATCH(descripcion) AGAINST('mecánico inalámbrico' IN NATURAL LANGUAGE MODE) → SELECT *
SELECT *
FROM productos
WHERE MATCH(descripcion)
AGAINST('mecánico inalámbrico' IN NATURAL LANGUAGE MODE);