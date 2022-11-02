use tienda;

-- Abrir el script de la base de datos llamada “tienda.sql” y ejecutarlo para crear sus tablas e
-- insertar datos en las mismas. A continuación, generar el modelo de entidad relación. Deberá
-- obtener un diagrama de entidad relación igual al que se muestra a continuación:


-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
Select nombre from producto;
-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
select nombre, precio from producto;
-- 3. Lista todas las columnas de la tabla producto.
Select * from producto;
-- 4. Lista los nombres y los precios de todos los productos de la tabla producto, redondeand el valor del precio.
select nombre, round(precio) from producto; 
-- 5. Lista el código de los fabricantes que tienen productos en la tabla producto.
select codigo_fabricante from producto; 
-- 6. Lista el código de los fabricantes que tienen productos en la tabla producto, sin mostrarlos repetidos.
select distinct codigo_fabricante from producto;
-- 7. Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante order by nombre asc;
-- 8. Lista los nombres de los productos ordenados en primer lugar por el nombre de formaascendente y en segundo lugar por el precio de forma descendente.
select precio, nombre from producto order by  precio desc;
select precio, nombre from producto order by  nombre asc;
-- 9. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante limit 5;
-- 10. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulasORDER BY y LIMIT)
select nombre, precio from producto order by precio asc limit 1;
-- 11. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDERBY y LIMIT)
select nombre, precio from producto order by precio desc limit 1;
-- 12. Lista el nombre de los productos que tienen un precio menor o igual a $120.
select nombre, precio from producto where precio <=120;
-- 13. Lista todos los productos que tengan un precio entre $60 y $200. Utilizando el operadorBETWEEN.
select * from producto where precio between 60 and 200;
-- 14. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operadorIN.
select * from producto where codigo_fabricante in(1,3,5);
-- 15. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátilen el nombre.
select nombre from producto where nombre like '%Portátil%';


-- Consultas Multitabla

-- 1. Devuelve una lista con el código del producto, nombre del producto, 
-- código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
select producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre from producto join fabricante on producto.codigo_fabricante=fabricante.codigo;
-- 2. Devuelve una lista con el nombre del producto, precio y nombre de 
-- fabricante de todos los productos de la base de datos. 
-- Ordene el resultado por el nombre del fabricante, pororden alfabético.
select producto.nombre, producto.precio, fabricante.nombre as 'nombre fabricante' from producto join fabricante on producto.codigo_fabricante=fabricante.codigo order by fabricante.nombre asc ;
-- 3. Devuelve el nombre del producto, su precio y el nombre de su fabricante, 
-- del producto más barato.
select producto.nombre, producto.precio, fabricante.nombre as 'nombre fabricante' from producto join fabricante on producto.codigo_fabricante=fabricante.codigo order by producto.precio asc limit 1;

-- 4. Devuelve una lista de todos los productos del fabricante Lenovo.
select *, fabricante.nombre from producto join fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre like '%Lenovo%';
-- 5. Devuelve una lista de todos los productos del fabricante Crucial 
-- que tengan un preciomayor que $200.
select * from producto join fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre like '%Crucial%' and producto.precio >200;

-- 6. Devuelve un listado con todos los productos de los fabricantes Asus,
--  Hewlett-Packard.Utilizando el operador IN.
select * from producto join fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre in('Asus','Hewlett-Packard');

-- 7. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, 
-- de todoslos productos que tengan un precio mayor o igual a $180. 
-- Ordene el resultado en primerlugar por el precio (en orden descendente) y 
-- en segundo lugar por el nombre (en ordenascendente)




-- Consultas Multitabla

-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con losproductos que tiene cada uno de ellos.
-- El listado deberá mostrar también aquellosfabricantes que no tienen productos asociados.

-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningúnproducto asociado.

-- Subconsultas (En la cláusula WHERE)Con operadores básicos de comparación

-- 1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

-- 2. Devuelve todos los datos de los productos que tienen el mismo precio que el productomás caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

-- 3. Lista el nombre del producto más caro del fabricante Lenovo.

-- 4. Lista todos los productos del fabricante Asus que tienen un precio superior al preciomedio de todos sus productos.

-- Subconsultas con IN y NOT IN

-- 1. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN oNOT IN).

-- 2. Devuelve los nombres de los fabricantes que no tienen productos asociados. (UtilizandoIN o NOT IN).

-- Subconsultas (En la cláusula HAVING)

-- 1. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número--de productos que el fabricante Lenovo.