drop database cliente_plazajengibre;

create database cliente_plazajengibre;
use cliente_plazajengibre;
drop table clientes;
create table clientes (
  idCliente int(11) NOT NULL,
  nombresCliente varchar(45) NOT NULL,
  telefonoCliente int NOT NULL 
) ;
insert into clientes values ('1015431248', 'Jesyka Palencia', '3013605448'); 
select * from clientes;
delete from clientes where telefonocliente = 2147483647; 