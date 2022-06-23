
--DIA 1
--Listar los nombres de los usuarios
select nombre from Usuarios ;

--Mostrar el email de los usuarios que usan gmail
select email from Usuarios 
where email like '%gmail%';

--Listar las diferentes marcas de celular en orden alfabético descendentemente
select marca from Usuarios 
order by marca desc;

--Listar el login y teléfono de los usuarios con compañía telefónica AT&T
select usuario, telefono from Usuarios 
where compania = 'AT&T';

--Mostrar el email de los usuarios que usan hotmail
select email from Usuarios 
where email like '%hotmail%';

-- DIA 2
--Calcular el saldo máximo de los usuarios de sexo “Mujer”
select max(saldo),sexo from Usuarios
where sexo = 'M';
--Listar nombre y teléfono de los usuarios con teléfono LG, SAMSUNG o MOTOROLA
select nombre,telefono from Usuarios
where marca = 'LG' or marca = 'SAMSUNG' or marca = 'MOTOROLA';
--Listar las diferentes compañías en orden alfabético aleatorio
select DISTINCT(marca) from Usuarios;
--Listar las diferentes compañías en orden alfabético descendentemente
select DISTINCT(marca) from Usuarios order by marca desc;
--Listar los nombres de los usuarios sin saldo o inactivos
select nombre from Usuarios 
where saldo<=0 or activo = false;








