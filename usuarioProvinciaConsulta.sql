-- Provincias que no tienen clientes
SELECT provincias.nombre FROM provincias
left join clientes
on clientes.codigoProvincia = provincias.codigo
where clientes.codigoProvincia is null;