SELECT * FROM fernandochoto.personajes;
Insert Into personajes(IdPersonajes,Nombre,Edad,Apodo,Sexo) Value(123,'Pluto',7,'Putaso','CaballitoDeMar');
Insert Into personajes(IdPersonajes,Nombre,Edad,Apodo,Sexo) Value(124,'Fer',5,'Pingo','Mocho');
Insert Into personajes(IdPersonajes,Nombre,Edad,Apodo,Sexo) Value(125,'Julio',45,'Voke','Mucho');
Update personajes Set apodo='Gallina' Where IdPersonajes=125;
Delete from personajes where idPersonajes=124;
Insert Into personajes(IdPersonajes,Nombre,Edad,Apodo,Sexo) Value(133,'Pluto',7,'Putaso','CaballitoDeMar');
Insert Into personajes(IdPersonajes,Nombre,Edad,Apodo,Sexo) Value(144,'Pluto',7,'Putaso','CaballitoDeMar');
Select * from personajes  Where Nombre='Pluto';
Select IdPersonajes,Edad,Apodo From personajes;