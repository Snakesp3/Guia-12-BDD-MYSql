-- 1. Mostrar el nombre de todos los jugadores ordenados alfabéticamente.

select *from jugador order by nombre asc;

-- 2. Mostrar el nombre de los jugadores que sean pivots (‘C’) y que pesen más de 200 libras,ordenados por nombre alfabéticamente.

select  nombre, peso, posicion from jugador where posicion='C' and peso>200 order by nombre asc;

-- 3. Mostrar el nombre de todos los equipos ordenados alfabéticamente.

select *from equipo order by nombre asc;

-- 4. Mostrar el nombre de los equipos del este (East).
select nombre, conferencia from equipo where conferencia='East';

-- 5. Mostrar los equipos donde su ciudad empieza con la letra ‘c’, ordenados por nombre.

select nombre, ciudad from equipo where ciudad like "c%";

-- 6. Mostrar todos los jugadores y su equipo ordenados por nombre del equipo.
select nombre, nombre_equipo from jugador order by nombre_equipo asc;

-- 7. Mostrar todos los jugadores del equipo “Raptors” ordenados por nombre.

select * from jugador where nombre_equipo='Raptors' order by nombre asc;

-- 8. Mostrar los puntos por partido del jugador ‘Pau Gasol’.

select Puntos_por_partido as Puntos_Pau_Gasol from estadistica inner join jugador where jugador.nombre='Pau Gasol';

-- 9. Mostrar los puntos por partido del jugador ‘Pau Gasol’ en la temporada ’04/05′.

select Puntos_por_partido as 'Puntos_Pau_Gasol temporada 04/05' from estadistica inner join jugador where jugador.nombre='Pau Gasol' and temporada='04/05';

-- 10. Mostrar el número de puntos de cada jugador en toda su carrera.

select j.codigo, j.nombre, round(sum(e.puntos_por_partido)) as puntos 
from jugador j, estadistica e 
where j.codigo = e.jugador 
group by j.nombre 
order by j.codigo asc;

-- 11. Mostrar el número de jugadores de cada equipo.
select j.nombre_equipo, count(*) 
from jugador j 
group by j.nombre_equipo;

-- 12. Mostrar el jugador que más puntos ha realizado en toda su carrera.

select j.codigo, j.nombre, round(sum(e.puntos_por_partido)) as puntos 
from jugador j, estadistica e 
where j.codigo = e.jugador 
group by j.nombre 
order by sum(e.Puntos_por_partido) desc limit 1;

-- 13. Mostrar el nombre del equipo, conferencia y división del jugador más alto de la NBA.

select j.nombre,j.altura,  e.conferencia, e.division  
from jugador j, equipo e 
where j.nombre_equipo = e.nombre 
group by j.nombre 
order by j.altura desc limit 1;

-- 14. Mostrar la media de puntos en partidos de los equipos de la división Pacific.
-- 15. Mostrar el partido o partidos (equipo_local, equipo_visitante y diferencia) con mayor diferencia de puntos.
-- 16. Mostrar la media de puntos en partidos de los equipos de la división Pacific.
-- 17. Mostrar los puntos de cada equipo en los partidos, tanto de local como de visitante.
-- 18. Mostrar quien gana en cada partido (codigo, equipo_local, equipo_visitante, equipo_ganador), en caso de empate sera null.