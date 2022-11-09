/* CANDADO A
Posición: El candado A está ubicado en la posición calculada a partir del número obtenido en la/s
siguiente/s consulta/s:
Teniendo el máximo de asistencias por partido, muestre cuantas veces se logró dicho máximo.
Este resultado nos dará la posición del candado (1, 2, 3 o 4)
Clave: La clave del candado A estará con formada por la/s siguientes consulta/s a la base de
datos:
Muestre la suma total del peso de los jugadores, donde la conferencia sea Este y la posición sea
centro o esté comprendida en otras posiciones.
*/

select * from estadistica where (select(max(asistencias_por_partido)));
select jugador, asistencias_por_partido  from estadistica where asistencias_por_partido>=34;

-- Da La posicion
SELECT COUNT(asistencias_por_partido) FROM estadistica WHERE Asistencias_por_partido = (SELECT MAX(Asistencias_por_partido) FROM estadistica);
select count(asistencias_por_partido) from estadistica where jugador = 300;
select * from jugador;

-- Da la clave
select sum(j.peso) from jugador j inner join equipo e on j.nombre_equipo=e.nombre 
where e.conferencia='EAST' and j.posicion like '%C%';
select count(*) from jugador j inner join equipo e on j.nombre_equipo=e.nombre 
where j.posicion like '%C%';
select sum(peso) from jugador;
-- Candado A, posicion 2 ;
-- Clave 14043 
---------------------------------------------------------------------------------------------------
/*
CANDADO B
Posición: El candado B está ubicado en la posición calculada a partir del número obtenido en la/s
siguiente/s consulta/s:
Muestre la cantidad de jugadores que poseen más asistencias por partidos que 16
Este resultado nos dará la posición del candado (1, 2, 3 o 4)
Clave: La clave del candado B estará con formada por la/s siguientes consulta/s a la base de
datos:
La clave será igual al conteo de partidos jugados durante las temporadas del año 1999.
*/
-- Da la posicion
select count(nombre_equipo) from jugador where nombre_equipo='Heat';
select count(asistencias_por_partido) from estadistica where Asistencias_por_partido >(select 
count(nombre_equipo) from jugador where nombre_equipo='Heat');
 
 -- Da la clave
select * from partido;
select count(*) from partido where temporada like '%99%';
-- Candado B posicion 3
-- Clave 3480
---------------------------------------------------------------------------------------------------
/*
CANDADO C
Posición: El candado C está ubicado en la posición calculada a partir del número obtenido en la/s
siguiente/s consulta/s:
La posición del código será igual a la cantidad de jugadores que proceden de Michigan y forman
parte de equipos de la conferencia oeste.
Al resultado obtenido lo dividiremos por la cantidad de jugadores cuyo peso es mayor o igual a
195, y a eso le vamos a sumar 0.9945.
Este resultado nos dará la posición del candado (1, 2, 3 o 4)
Clave: La clave del candado B estará con formada por la/s siguientes consulta/s a la base de
datos:
Para obtener el siguiente código deberás redondear hacia abajo el resultado que se devuelve de
sumar: el promedio de puntos por partido, el conteo de asistencias por partido, y la suma de
tapones por partido. Además, este resultado debe ser, donde la división sea central.
*/
-- Da la Posicion
select count(*)/(select count(nombre) from jugador where peso>=195)+0.9945 as posicion from jugador j inner join equipo e on j.nombre_equipo=e.nombre 
where e.conferencia='West' and j.procedencia='Michigan';

-- Da La clave
SELECT FLOOR(AVG(Puntos_por_partido)+COUNT(Asistencias_por_partido)+SUM(Tapones_por_partido))
FROM estadistica AS e INNER JOIN jugador AS j ON e.jugador = j.codigo INNER JOIN equipo AS eq 
ON j.nombre_equipo = eq.nombre WHERE eq.division = 'Central';
-- Candado C posicion 1 
-- Clave 631 
---------------------------------------------------------------------------------------------------
/*
CANDADO D

Posición: El candado D está ubicado en la posición calculada a partir del número obtenido en la/s
siguiente/s consulta/s:
Muestre los tapones por partido del jugador Corey Maggette durante la temporada 00/01. Este
resultado debe ser redondeado. Nota: el resultado debe estar redondeado
Este resultado nos dará la posición del candado (1, 2, 3 o 4)
3
Clave: La clave del candado D estará con formada por la/s siguientes consulta/s a la base de
datos:
Para obtener el siguiente código deberás redondear hacia abajo, la suma de puntos por partido
de todos los jugadores de procedencia argentina.
*/ 
-- Da La posicion

SELECT  ROUND(Tapones_por_partido) FROM estadistica AS e INNER JOIN jugador AS j
ON jugador = codigo WHERE j.nombre = 'Corey Maggette' AND e.temporada = '00/01';

-- Da la clave
SELECT FLOOR(SUM(puntos_por_partido)) puntos FROM estadistica AS e INNER JOIN jugador AS j ON jugador = codigo WHERE j.procedencia = 'Argentina';
-- Candado D posicion 4
-- Clave 191
------------------------------------------------------------------------------------------------
-- Candado A, posicion 2 ;
-- Clave 14043 

-- Candado B posicion 3
-- Clave 3480

-- Candado C posicion 1 
-- Clave 631 

-- Candado D posicion 4
-- Clave 191

