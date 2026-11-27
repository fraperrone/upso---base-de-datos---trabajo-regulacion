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
