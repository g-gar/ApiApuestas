--create database apuestas
--use apuestas

use master
drop database apuestas
create database apuestas
use apuestas


create table usuarios
(
  id int identity(1,1) primary key,
  nombre varchar(255) not null,
  dni varchar(255) not null,
  pass varchar(255) not null,
  saldo decimal(10,2) not null
)

create table tiposEventos
(
  id int primary key,
  nombre varchar(255),
  numeroParticipantes int --cantidad de gente o equipos que particpan, y sobre los que se pueden hacer apuestas
)

create table eventos
(
  id int identity(1,1) primary key,
  tipo int not null references tiposEventos(id),
  descripcion varchar(4000),
  numParticipantes int not null,
  ganador int null,
  fecha datetime not null
)

create table participantes
(
  id int identity(1,1) primary key,
  evento int not null references eventos(id),
  cuota decimal (6,2) not null,
  posicion int not null
)

create table tiposTransaccion
(
  id int primary key,
  nombre varchar(255)
)

create table transacciones
(
  id int identity(1,1) primary key,
  tipo int not null references tiposTransaccion(id),
  usuario int not null references usuarios (id),
  importe decimal(6,2),
  fecha datetime not null
)

create table apuestas
(
  id int identity(1,1) primary key,
  usuario int not null references usuarios (id),
  evento int not null references eventos (id),
  ganador int not null, -- elemento escogido como ganador
  fecha datetime not null,
  importe decimal(6,2) not null,
  cobro int not null references transacciones(id),
  pago int null references transacciones(id)
)


--carga de las tablas maestras
insert into tiposEventos (id,nombre,numeroParticipantes) values (1,'Futbol',2)
insert into tiposEventos (id,nombre,numeroParticipantes) values (2,'Baloncesto',2)
insert into tiposEventos (id,nombre,numeroParticipantes) values (3,'H�pica',8)
insert into tiposEventos (id,nombre,numeroParticipantes) values (4,'F�rmula1',20)
insert into tiposEventos (id,nombre,numeroParticipantes) values (5,'Petanca',3)
insert into tiposEventos (id,nombre,numeroParticipantes) values (6,'Tenis',2)

insert into tiposTransaccion (id, nombre) values (1,'ingreso')
insert into tiposTransaccion (id, nombre) values (2,'retirada')
insert into tiposTransaccion (id, nombre) values (3,'pago')
insert into tiposTransaccion (id, nombre) values (4,'cobro')


go
--se asume que la contrase�a ya viene encriptada
create procedure registrar
  @nombre varchar(255), @dni varchar(255), @pass varchar(255)
as 
	insert into usuarios (nombre, dni, pass, saldo) values (@nombre, @dni, @pass, 0)
/*
registrar 'Alberto Botana','32684535v','1234'
select * from usuarios
*/
go
/*
autentica un usurio. Simplemente valida que el usuario es v�lido o no. Ser�a responsabilidad de la aplicaci�n 
garantizar que el usuario sigue siendo el mismo durante toda la sesi�n, pero no se va a implementar
*/
create procedure autenticar
  @nombre varchar(255), @pass varchar(255)
as
	if exists (select top 1 nombre from usuarios where nombre = @nombre and pass = @pass) 
	select 0,'autenticado'
	else select 1,'no autenticado'
/*
autenticar 'sdfdfsdf','dsfafdsf'
autenticar 'Alberto Botana','1234'
*/
go
create procedure registrarEvento
  @tipo int, @descripcion varchar(255), @fecha datetime
as 
  declare @numParticipantes int
  select @numParticipantes = numeroParticipantes from tiposEventos where id = @tipo

  insert into eventos (tipo, descripcion,numParticipantes,fecha) values (@tipo, @descripcion,@numParticipantes, @fecha)

/*
registrarEvento 1,'madrid barsa lunes', '20210930'
select * from eventos
*/

go
create procedure asignarParticipantes
  @evento int,
  @cuota decimal(6,2),
  @posicion int
as
  insert into participantes (cuota, evento, posicion) values (@cuota, @evento, @posicion)
/*
asignarParticipantes 1,2,1
asignarParticipantes 1,3,2
select * from participantes
*/

go
--realiza una transaccion completa moviendo el saldo y generando la linea correspondiente
create procedure realizarTransaccion
  @usuario int, @tipo int, @importe decimal(6,2), @id int output 
as
  --verificaci�n del saldo
  if  not exists (
	select * from usuarios where id = @usuario and saldo + @importe >= 0
  ) 
  begin select 1,'operacion no realizada' return end
  begin tran
    update usuarios set saldo = saldo + @importe where id = @usuario
	insert into transacciones (tipo, usuario, importe, fecha ) values (@tipo ,@usuario, @importe, getdate())
	set @id  =@@IDENTITY
	select 0,'operacion realizada correctamente'
    
  commit
  
/*
declare @a int
--exec realizarTransaccion 1,2,-100,@a output
exec realizarTransaccion 1,1,100,@a output
select @a
select * from transacciones
*/

go
-- marca un evento como finalizado y realiza todos los pagos que correspondan
create procedure finalizarEvento
  @evento int, @ganador int
as
	update eventos set ganador = @ganador where id = @evento
	declare @i int

	declare @usuario int
	declare @cuota decimal(6,2)
	declare @importe decimal(6,2)
	declare @idTransaccion int

	select @i = count(*) from apuestas
	select @cuota = cuota from participantes where evento = @evento and posicion = @ganador


	while (@i > 0)
	begin
		select @usuario = usuario, @importe = importe * @cuota from apuestas where id = @i and evento = @evento and ganador = @ganador
		exec realizarTransaccion @usuario, 4, @importe, @idTransaccion output
		set @i = @i-1
	end
/*
finalizarEvento 1,1
select * from eventos
update eventos set ganador = 0 where id = 1
*/

go
create procedure realizarApuesta
  @evento int,
  --@participante int,
  @importe decimal,
  @ganador int,
  @usuario int
as
  --declare @cobro int
  declare @idTransaccion int
  declare @importeAPagar decimal(6,2)
  
  set @importeAPagar = -1 * @importe
  exec realizarTransaccion @usuario, 3, @importeAPagar,@idTransaccion output
  insert into apuestas (usuario, evento, fecha, importe, cobro,ganador) values (@usuario, @evento, getdate(), @importe,  @idTransaccion,@ganador)

/*
realizarApuesta 1,1,10,1,1
select * from apuestas
select * from usuarios
select * from transacciones
select * from participantes
*/