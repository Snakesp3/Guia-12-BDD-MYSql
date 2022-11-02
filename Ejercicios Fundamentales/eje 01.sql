-- 1 Obtener los datos completos de los departamentos
Select * From departamento;
-- 1 Obtener los datos completos de los empleados
Select * From empleado;
-- Lista de nombre departamentos
Select  nombre_depto from departamento;
-- Para que no se repitan los nombres de la lista
Select distinct nombre_depto from departamento;
-- Obtener el nombre y salario de todos los empleados
Select  nombre,salario from empleado;
-- Listar todas las comisiones
select nombre,comision from empleado;
-- Obtener los datos de los empleados cuya cargo sea "Secretaria"
select * from empleado where cargo='Secretaria';
-- obtener los datos de los empleados vendedores,ordenados por nombre alfabeticamente;
select * from empleado where cargo='vendedor'order by nombre desc;
-- Obtener nombre y cargo de todos los empleados ordenados por salario de menor a mayor
select nombre,cargo,salario from empleado order by salario asc;
-- Elabore un listado donde para cada fila figure un nombre alias y cargo para las respectivas tablas de empleados
select nombre as 'nombre_plutos' , cargo as 'cargo_patos' from empleado;
-- Listar los salarios y comisiones de los empleados del departamento 2000, ordenarlos por comision de menor a mayor
select id_depto,nombre,salario,comision from empleado where id_depto=2000 order by comision asc;
-- Obtener el valor total a pagar que resulta de sumar el salario y la comision de los empleados del departamento 3000 una bonificacion de 500 en orden alfabetico del empleado
select nombre,salario+comision+500 as 'total a pagar' from empleado where id_depto=3000 order by nombre asc;
-- Muestra los empleados cuyo nombre empiecen con la letra j
select nombre from empleado where nombre like 'j%';
-- Listar el salario la comision el salario total (Salario+Comision) y nombre de aquellos empleados que tiene superior a 1000
select nombre,salario, comision, salario+comision as 'salario total' from empleado where comision > 1000;
-- Obtener un listado similar al anterior, pero de aquellos empleados que NO tiene comision
select nombre,salario, comision, salario+comision as 'salario total' from empleado where comision = 0;
-- Obtener la lista que ganen una comision superior a su sueldo
select * from empleado where comision > salario; 
-- Listar los empleados cuya comision es menor o igual al 30% de su sueldo de su sueldo
select * from empleado where comision <= salario * 0.30; 
-- Hallar los empleados cuyos nombre no contiene la cadena "MA"
select nombre from empleado where nombre  not like '%MA%';
-- Obtener los nombres de los departamento que no sean  "Ventas ni "Mantenimiento ni "Investigacion"
select * from departamento where nombre_depto  not in ('Ventas','Mantenimiento','Investigacion');
-- Mostrar el salario mas alto de la empresa
select max(salario), nombre,cargo from empleado;
-- Mostrar el nombre del ultimo empleado de la lista por orden alfabetico
select nombre from empleado order by nombre desc limit 1;
-- Mostrar el salario mas alto mas bajo, y la diferencia entre ellos
select max(salario), min(salario),max(salario)- min(salario) as 'Diferencia de sueldo'from empleado;
-- Hallar el salario promedio por departamento
SELECT id_depto, ROUND( AVG (salario), 0 ) as  ' Salario promedio '  FROM empleado GROUP BY id_depto;
-- Consultas con Having
-- Hallar los departamentos que tiene mas de tres empleados. Mostrar el numero de empleados de esos departamentos
SELECT COUNT(id_depto),nombre_depto from departamento group by nombre_depto HAVING COUNT(id_depto) > 3;
-- Mostrar el código y nombre de cada jefe, junto al número de empleados que dirige.Solo los que tengan más de dos empleados (2 incluido)
SELECT *, COUNT(*) as 'Cantidad'FROM empleado GROUP BY id_depto HAVING Cantidad >= 2 AND cargo LIKE 'Jefe%';
-- Hallar los departamentos que no tienen empleados
SELECT COUNT(id_depto),nombre_depto from departamento group by nombre_depto HAVING COUNT(id_depto) = 0;
-- Consulta con Subconsulta
-- Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento
Select * from empleado where salario >= (select avg(salario) from empleado) order by id_depto;
select round(avg (salario),0) from empleado;





