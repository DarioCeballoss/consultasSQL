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









