create database MyCompany
go
use MyCompany

create table Users(
UserID int identity(1,1) primary key,
LoginName nvarchar (100)unique not null,
Password nvarchar (100) not null,
FirstName nvarchar (100) not null,
LastName nvarchar (100) not null,
Position nvarchar (100) not null,
Email nvarchar (150) not null
)

insert into Users values ('admin','admin','Dario','Ceballos','Soporte Tecnico','soportetecnico@cd.com')
insert into Users values ('FFLORES','123asd','Federico','Flores','CEO','f.ceballos@cd.com')
insert into Users values ('TPEREZ','456asd','Tamara','Perez','Manager','t.perez@cd.com')

select * from users

declare @user nvarchar(100)='admin'
declare @pass nvarchar(100)='admin'
select * from Users where LoginName=@user and Password=@Pass

