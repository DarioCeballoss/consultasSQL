drop database ManualSQL

/*Crea la base de datos*/
create database ManualSQL

/*cambiar a la bd creada*/
use ManualSQL

/*2- Crear tabla*/
 create table usuarios
 (
  dni int,  
  nombre varchar(30),
  primary key (dni)
 )
 
 /*3- Insertar y recuperar registros*/
 insert into usuarios (dni, nombre) values (30000000, 'Mariano')
 insert into usuarios (dni, nombre) values (40000000, 'Rocio')
 
 select * from usuarios
 select nombre from usuarios
 
 /*4- tipos de datos: 
varchar:: se usa para almacenar cadenas de caracteres. Una cadena es una secuencia de caracteres. Se coloca entre comillas (simples); ejemplo: 'Hola', 'Juan Perez'. 
El tipo "varchar" define una cadena de longitud variable en la cual determinamos el máximo de caracteres entre paréntesis. Puede guardar hasta 8000 caracteres. 
Por ejemplo, para almacenar cadenas de hasta 30 caracteres, definimos un campo de tipo varchar(30), es decir, entre paréntesis, junto al nombre del campo colocamos la longitud.
Si asignamos una cadena de caracteres de mayor longitud que la definida, la cadena no se carga, aparece un mensaje indicando tal situación y la sentencia no se ejecuta.
Por ejemplo, si definimos un campo de tipo varchar(10) e intentamos asignarle la cadena 'Buenas tardes', aparece un mensaje de error y la sentencia no se ejecuta.
integer:: se usa para guardar valores numéricos enteros, de -2000000000 a 2000000000 aprox. Definimos campos de este tipo cuando queremos representar, por ejemplo, cantidades.
float:: se usa para almacenar valores numéricos con decimales. Se utiliza como separador el punto (.). Definimos campos de este tipo para precios, por ejemplo.*/

 create table libros
 ( 
  titulo varchar(80),
  autor varchar(40),
  editorial varchar(30),
  precio float,
  cantidad integer
 )

 insert into libros (titulo,autor,editorial,precio, cantidad)
  values ('El aleph','Borges','Emece',25.50, 100)
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Matematica estas ahi','Paenza','Siglo XXI',18.8,200)
  
 select * from libros
 
 /*5- Recuperar algunos registros*/
 -- recuperamos todas los datos de la tabla libros
select * from libros

-- recuperamos solo el titulo, autor y editorial de la tabla libros
select titulo,autor,editorial from libros

-- recuperamos el titulo y el precio
select titulo,precio from libros

-- recuperamos la editorial y la cantidad
select editorial,cantidad from libros

/*6- Recuperar algunos registros*/

-- Recuperamos el usuario cuyo nombre es "Leonardo"
select * from usuarios where nombre='Mariano'

-- Recuperamos el usuario cuyo dni es 40000000
select * from usuarios where dni=40000000


/*7- Operadores relacionales:
Los operadores relacionales son los siguientes:

=	igual
<>	distinto
>	mayor
<	menor
>=	mayor o igual
<=	menor o igual*/

select titulo, precio from libros  where precio>20

select * from libros where autor<>'Borges'

/*8- Borrar registros*/

-- Eliminemos todos los registros
delete from usuarios

-- Eliminamos el registro cuyo nombre de usuario es "Marcelo"
delete from usuarios where nombre='Marcelo'

-- Eliminamos un registro especifico, siempre apuntando al id
delete from usuarios  where dni=40000000

/*9- Actualizar registros*/
-- Actulizamos todos los registros al nombre 'José'
update usuarios set nombre='José'

--Actualizar registro especifico, siempre aputando al id
update usuarios set nombre='Oscar' where dni=30000000

/*10- comentarios varias lineas*/
-- comentario una linea

/*11- Valores nulos*/

drop table libros

create table libros(
  titulo varchar(30) not null,
  autor varchar(20)      null,
  editorial varchar(15) null,
  precio float 
 )
 
 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais',null,null,25)
  
  select * from libros

/*12- Clave primaria*/
 create table NOMBRETABLA(
  CAMPO TIPO,
  ...
  primary key (NOMBRECAMPO)
 )
 
 /*13- campo autonumerico - identity*/
 drop table libros --permite borrar la tabla
 
 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio float
 )
 
  insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',23)
  
  select * from libros
  
-- No insertamos el autonumerico por código, incremanta automaticamente.

/*14- Caracteristicas del identity*/

create table libros
( codigo int identity(100,2),
  titulo varchar(20),
  autor varchar(30),
  precio float
 )
 -- incrementa dessde el número 100 de 2 en 2.
 

/*15- Truncate (vaciar tabla)*/

-- Truncamos la tabla:
truncate table libros
delete from libros

/*16- Otros tipos de datos
TEXTO: Para almacenar texto usamos cadenas de caracteres.
Las cadenas se colocan entre comillas simples. Podemos almacenar letras, símbolos y dígitos con los que no se realizan operaciones matemáticas, por ejemplo, códigos de identificación, números de documentos, números telefónicos.
SQL Server ofrece los siguientes tipos: char, nchar, varchar, nvarchar, text y ntext.
NUMEROS: Existe variedad de tipos numéricos para representar enteros, decimales, monedas.
Para almacenar valores enteros, por ejemplo, en campos que hacen referencia a cantidades, precios, etc., usamos el tipo integer (y sus subtipos: tinyint, smallint y bigint).
Para almacenar valores con decimales exactos, utilizamos: numeric o decimal (son equivalentes).
Para guardar valores decimales aproximados: float y real. Para almacenar valores monetarios: money y smallmoney.
FECHAS y HORAS: para guardar fechas y horas SQL Server dispone de 2 tipos: datetime y smalldatetime.*/

/*17- Texto:
varchar(x): define una cadena de caracteres de longitud variable en la cual determinamos el máximo de caracteres con el argumento "x" que va entre paréntesis.
Si se omite el argumento coloca 1 por defecto. Su rango va de 1 a 8000 caracteres.
char(x): define una cadena de longitud fija determinada por el argumento "x". Si se omite el argumento coloca 1 por defecto. Su rango es de 1 a 8000 caracteres.
Si la longitud es invariable, es conveniente utilizar el tipo char; caso contrario, el tipo varchar.
Ocupa tantos bytes como se definen con el argumento "x".
"char" viene de character, que significa caracter en inglés.
text: guarda datos binarios de longitud variable, puede contener hasta 2000000000 caracteres. No admite argumento para especificar su longitud.
nvarchar(x): es similar a "varchar", excepto que permite almacenar caracteres Unicode, su rango va de 0 a 4000 caracteres porque se emplean 2 bytes por cada caracter.
nchar(x): es similar a "char" excpeto que acepta caracteres Unicode, su rango va de 0 a 4000 caracteres porque se emplean 2 bytes por cada caracter.
ntext: es similar a "text" excepto que permite almacenar caracteres Unicode, puede contener hasta 1000000000 caracteres. No admite argumento para especificar su longitud.*/

/*18- Numerico:
1) integer o int: su rango es de -2000000000 a 2000000000 aprox. El tipo "integer" tiene subtipos:
- smallint: Puede contener hasta 5 digitos. Su rango va desde –32000 hasta 32000 aprox.
- tinyint: Puede almacenar valores entre 0 y 255.
- bigint: De –9000000000000000000 hasta 9000000000000000000 aprox.

Para almacenar valores numéricos EXACTOS con decimales, especificando la cantidad de cifras a la izquierda y derecha del separador decimal, utilizamos:

2) decimal o numeric (t,d): Pueden tener hasta 38 digitos, guarda un valor exacto. El primer argumento indica el total de dígitos y el segundo, la cantidad de decimales.
Por ejemplo, si queremos almacenar valores entre -99.99 y 99.99 debemos definir el campo como tipo "decimal(4,2)". Si no se indica el valor del segundo argumento, por defecto es "0". Por ejemplo, si definimos "decimal(4)" se pueden guardar valores entre -9999 y 9999.*/


/*19- Fecha y hora:
Para almacenar valores de tipo FECHA Y HORA SQL Server dispone de dos tipos:

1) datetime: puede almacenar valores desde 01 de enero de 1753 hasta 31 de diciembre de 9999.

2) smalldatetime: el rango va de 01 de enero de 1900 hasta 06 de junio de 2079.*/

--Para ingresar una fecha con formato "día-mes-año", tipeamos:

 create table empleados(
  nombre varchar(20),
  documento char(8),
  fechaingreso datetime
 )
--Seteamos el formato de la fecha para que guarde día, mes y año:

 set dateformat dmy
 
--Ingresamos algunos registros:

 insert into empleados values('Ana Gomez','22222222','12-01-1980')
 insert into empleados values('Bernardo Huerta','23333333','15-03-81')
 insert into empleados values('Carla Juarez','24444444','20/05/1983')
 insert into empleados values('Daniel Lopez','25555555','2.5.1990')
 insert into empleados values('Bernardo Puerta','23355533','15-03-23')
 
 select *from empleados
 
 /*20- Insertar algunos registros, el resto los deja null*/
 
 insert into libros (titulo, autor)values ('El aleph','Borges')
 
 select * from libros
 
 /*21- Valores por defecto*/
 
 drop table libros
 
 create table libros
 (
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) not null default 'Desconocido', 
  editorial varchar(20),
  precio decimal(5,2),
  cantidad tinyint default 0
  )
  
   insert into libros (titulo,autor,precio,cantidad)values ('El gato con botas',default,12.5,default)
 
select * from libros

/*22- columnas calculadas*/
select titulo, precio,cantidad,  precio*cantidad  from libros
select titulo,precio,  precio-(precio*0.1) from libros

/*23- Alias*/

select autor as 'Nombre y apellido', precio from libros

/*24 al 27- funciones*/

/*28- Ordenar registros (order by)*/

 select *from NOMBRETABLA order by CAMPO
 
 
 insert into libros (titulo,autor,precio,cantidad)values ('El gato con botas','Rodolfo',12.5,10)
 insert into libros (titulo,autor,precio,cantidad)values ('Lazarillo','Rodolfo',10.5,20)
 insert into libros (titulo,autor,precio,cantidad)values ('Mi planta de naranja lima','Hector',56.8,30)
 
 select *from libros order by titulo
 
 select titulo,autor,precio  from libros order by precio
 
 select * from libros order by autor desc
  
 select * from libros order by autor asc
 
  select *from libros  order by titulo asc, autor desc
 
 
 /*29- Operadores lógicos:
 - and, significa "y",
- or, significa "y/o",
- not, significa "no"*/

select *from libros  where (autor='Rodolfo') and (precio>=12.5)
 
  select *from libros  where not precio >12
 
 select *from libros where autor='Rodolfo' or  editorial='Planeta'
 
 /*30- Operador is null*/
 
select *from libros  where editorial is null

/*31- Operador relacional between*/

select *from libros  where precio>=10 and  precio<=20

select *from libros  where precio between 10 and 20

select *from libros  where precio not between 10 and 20

/*32- in*/

 select *from libros  where autor='Borges' or autor='Rodolfo'
 
 

 select *from libros  where autor<>'Borges' and  autor<>'Rodolfo'
  select *from libros  where autor not in ('Borges','Rodolfo')
  
/*33- Likes*/
select *from libros  where autor='Rodolfo'
select *from libros  where autor like'Rodolfo'


/*comodines:
... like '[a-cf-i]%': busca cadenas que comiencen con a,b,c,f,g,h o i;
... like '[-acfi]%': busca cadenas que comiencen con -,a,c,f o i;
... like 'A[_]9%': busca cadenas que comiencen con 'A_9';
... like 'A[nm]%': busca cadenas que comiencen con 'An' o 'Am'
...[^] reemplaza cualquier caracter NO*/

 select titulo,autor,editorial  from libros  where titulo like '[P-SE]%' or autor like '[P-S]%' or editorial like '[P-S]%'
 
 select titulo,autor,editorial  from libros  where autor like '[^PN]%'
 
  select titulo,precio from libros  where precio like '1_.%'
  
  
  /***********************************************************************/
  
  
 /*34- Contar (count)*/
  
   select count(*) from libros 
   
   select * from libros 
   
   select count(*) from libros  where precio >= 12.5
   
  /*36 - Funciones de agrupamiento (count - sum - min - max - avg)*/
  
  select sum(cantidad)from libros
  
  select min(cantidad)from libros
      
  select max(cantidad)from libros
        
  select avg(cantidad)from libros
  
  
  /*37 - Agrupar registros (group by)*/
  
  select CAMPO, FUNCIONDEAGREGADO
  from NOMBRETABLA
  group by CAMPO
  
  select titulo, count(precio) from libros  group by titulo
  
  
  /*38 - Seleccionar grupos (having)*/
  
  select titulo, count(*) from libros group by titulo
  having count(*)>2
  
  select titulo, avg(precio) from libros group by titulo
  having avg(precio)>10
  
  
  insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',23)
  
 select editorial, count(*) from libros  where precio is not null
  group by editorial
  having editorial<>'Planeta'
  
  
/* 43 - Registros duplicados (distinct)
Con la cláusula "distinct" se especifica que los registros con ciertos datos duplicados sean obviadas en el resultado */

  select distinct autor from libros
  
  select titulo, count(distinct autor) from libros
  group by titulo
  
  select distinct titulo,editorial  from libros
  order by titulo desc
  
  
  /*66 - Combinación interna (inner join)*/
  
  select CAMPOS
  from TABLA1 inner join TABLA2
  on CONDICIONdeCOMBINACION
  
  create table provincias
  (
  codigo int identity,
  nombre varchar(20),
  primary key (codigo)
  )
 
  create table clientes 
  (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia int not null,
  primary key(codigo),
  foreign key (codigoprovincia) references provincias (codigo)
  )
  
 insert into provincias (nombre) values('Cordoba')
 insert into provincias (nombre) values('Santa Fe')
 insert into provincias (nombre) values('Corrientes')
  insert into provincias (nombre) values('Jujuy')

 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1)
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1)
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1)
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2)
 insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2)
 insert into clientes values ('Torres Fabiola','Alem 777','Ibera',3)
 
  select clientes.nombre,clientes.domicilio,clientes.ciudad,provincias.nombre
  from clientes inner  join provincias 
  on clientes.codigoprovincia=provincias.codigo
  
  select c.nombre,domicilio,ciudad,p.nombre
  from clientes as c
  join provincias as p
  on c.codigoprovincia=p.codigo
  
  
  /*67 - Combinación externa derecha (right join)*/
  
   select clientes.nombre,clientes.domicilio,clientes.ciudad,provincias.nombre
  from clientes right join provincias
  on clientes.codigoprovincia=provincias.codigo
  
   /*68 - Combinación externa izquierda (left join)*/
  
   select clientes.nombre,clientes.domicilio,clientes.ciudad,provincias.nombre
  from clientes left join provincias
  on clientes.codigoprovincia=provincias.codigo
  
  /*73 conbinacion de mas de 2 tablas*/
  
   select CAMPOS
  from TABLA1 nner join TABLA2
  on CAMPORELACION=CAMPORELACION
  
  inner join TABLA3
  on CAMPORELACION=CAMPORELACION
  
 
 /*76 - Restriccion foreign key*/
   foreign key (CAMPOCLAVEFORANEA)
   references NOMBRETABLA2 (CAMPOCLAVEPRIMARIA)
   
 /*91 - Subconsultas:
 Una subconsulta (subquery) es una sentencia "select" 
 anidada en otra sentencia "select", "insert", "update" o "delete" 
 (o en otra subconsulta).*/
 
 
 /*92 - Subconsultas como expresión*/
 
 select CAMPOS from TABLA
  where CAMPO OPERADOR (SUBCONSULTA);

 select CAMPO OPERADOR (SUBCONSULTA)
  from TABLA
  
  select * from libros
  
  select titulo,precio,precio-(select max(precio)from libros)
  from libros
  where titulo='el gato con botas'
  
  select titulo,autor, precio  from libros
  where precio= (select max(precio) from libros)
  
  --Se pueden emplear en "select", "insert", "update" y "delete".
  
  update TABLA set CAMPO=NUEVOVALOR
  where CAMPO= (SUBCONSULTA)
  
  update libros set precio=45
  where precio=(select max(precio) from libros)
  
   delete from TABLA
  where CAMPO=(SUBCONSULTA)
  
  delete from libros
  where precio=(select min(precio) from libros)
  
 /* 93 - Subconsultas con in
 El resultado de una subconsulta con "in" (o "not in") es una lista*/
 
 drop table libros
 
 create table editoriales
 (
  codigo int identity,
  nombre varchar(30),
  primary key (codigo)
)

create table libros 
(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial int,
  primary key(codigo),
  foreign key (codigoeditorial)references editoriales(codigo)
 )
  
insert into editoriales values('Planeta')
insert into editoriales values('Emece')
insert into editoriales values('Paidos')
insert into editoriales values('Siglo XXI')

insert into libros values('Uno','Richard Bach',1)
insert into libros values('Ilusiones','Richard Bach',1)
insert into libros values('Aprenda PHP','Mario Molina',4)
insert into libros values('El aleph','Borges',2)
insert into libros values('Puente al infinito','Richard Bach',2)

-- Queremos conocer el nombre de las editoriales que han publicado 
-- libros del autor "Richard Bach": 

select nombre  from editoriales
where codigo in (select codigoeditorial from libros where autor='Richard Bach')

/*100 - Subconsulta insert*/

 insert into TABLAENQUESEINGRESA (CAMPOSTABLA1)
  select (CAMPOSTABLACONSULTADA)from TABLACONSULTADA
  
 /*Un profesor almacena las notas de sus alumnos en una tabla llamada 
 "alumnos". Tiene otra tabla llamada "aprobados", con algunos campos 
 iguales a la tabla "alumnos" pero en ella solamente almacenará los 
 alumnos que han aprobado el ciclo.

Ingresamos registros en la tabla "aprobados" seleccionando registros 
de la tabla "alumnos":*/

create table alumnos
(
  documento char(8) not null,
  nombre varchar(30),
  nota decimal(4,2)
  primary key(documento),
)

create table aprobados
(
  documento char(8) not null,
  nota decimal(4,2)
  primary key(documento),
)

insert into alumnos values('30000000','Ana Acosta',8)
insert into alumnos values('30111111','Betina Bustos',9)
insert into alumnos values('30222222','Carlos Caseros',2.5) 
insert into alumnos values('30333333','Daniel Duarte',7.7)
insert into alumnos values('30444444','Estela Esper',3.4)

insert into aprobados select documento,nota
   from alumnos where nota>=4
   
select * from aprobados

