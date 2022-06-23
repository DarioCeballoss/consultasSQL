-- Provincias que no tienen clientes
SELECT provincias.nombre FROM provincias
left join clientes
on clientes.codigoProvincia = provincias.codigo
where clientes.codigoProvincia is null;

--¿Qué provincias tienen clientes? Pero sin repetir el nombre de la provincia. Un tip, vas a necesitar la sentencia distinct
select distinct(provincias.nombre) from provincias 
inner join clientes on clientes.codigoProvincia = provincias.codigo;