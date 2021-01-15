create database OnlineFood
use OnlineFood

create table tbl_admin
(
userId int primary key identity,
uname varchar(50),
user_name varchar(50),
user_password varchar(50),
user_email varchar(50)
)

insert into tbl_admin (uname,user_name,user_password,user_email) values('Admin','Admin','admin123','admin@gmail.com');

select * from tbl_admin

sp_helptext sp_login_check

alter proc sp_login_check  
@user_name varchar(50),  
@user_password varchar(50)  
as  
begin  
select * from tbl_admin where user_name=@user_name and user_password=@user_password  
end

CREATE TABLE tbl_user (
  user_id int primary key identity,
  user_name varchar(50) ,
  user_email varchar(50) ,
  user_mobile varchar(15) ,
  user_password varchar(100) ,
  user_status int default 1,
  user_added_on datetime 
) 
alter table tbl_user alter column user_mobile bigint
insert into tbl_user(user_name,user_email,user_mobile,user_password,user_added_on) 
values('avneesh','avneesh.gangwar@outlook.com',7011321026,'123456',GETDATE())

create proc sp_tbl_user_select
as
begin
select * from tbl_user
end

create proc sp_user_status_update
@user_id int
as
begin
	declare @p int
	select @p=user_status from tbl_user where user_id=@user_id
	if(@p=0)
		begin
			update tbl_user set user_status=1 where user_id=@user_id
		end
	else
		begin
			update tbl_user set user_status=0 where user_id=@user_id
		end
end


create table tbl_delivery_boy
(
boy_id int primary key identity,
boy_name varchar(100),
boy_mobile bigint,
boy_password varchar(50),
boy_status int default 1,
boy_added_by int,
boy_added_on datetime
)

create procedure sp_delivery_boy_insert
@boy_name varchar(100),
@boy_mobile bigint,
@boy_password varchar(50),
@boy_added_by int
as 
begin 
insert into tbl_delivery_boy(boy_name,boy_mobile,boy_password,boy_added_by,boy_added_on)
values (@boy_name,@boy_mobile,@boy_password,@boy_added_by,GETDATE())
end
select * from tbl_delivery_boy
select * from tbl_delivery_boy
sp_delivery_boy_select
create proc sp_delivery_boy_select
as
begin
select tbl_delivery_boy.boy_id,tbl_delivery_boy.boy_name,tbl_delivery_boy.boy_mobile,tbl_delivery_boy.boy_added_on,tbl_delivery_boy.boy_status,
tbl_admin.uname as added_by
from tbl_delivery_boy join tbl_admin on tbl_delivery_boy.boy_added_by=tbl_admin.userId
end


create proc sp_delivery_boy_status_update
@boy_id int
as
begin
	declare @p int
	select @p=boy_status from tbl_delivery_boy where boy_id=@boy_id
	if(@p=0)
		begin
			update tbl_delivery_boy set boy_status=1 where boy_id=@boy_id
		end
	else
		begin
			update tbl_delivery_boy set boy_status=0 where boy_id=@boy_id
		end
end

create proc sp_tbl_delivery_boy_edit 1
@boy_id int
as
begin
select * from tbl_delivery_boy where boy_id=@boy_id
end

create proc sp_delivery_boy_update
@boy_id int,
@boy_name varchar(100),
@boy_mobile bigint,
@boy_password varchar(50)
as
begin
update tbl_delivery_boy set boy_name=@boy_name, boy_mobile=@boy_mobile,boy_password=@boy_password where boy_id=@boy_id
end

alter table tbl_category
(
category_id int primary key identity,
categgory_name varchar(50),
)
alter table tbl_category add  inserted_date date
alter table tbl_category add category_status int default 1

alter proc sp_tbl_category_insert
@category_name varchar(50)
as
begin
insert into tbl_category(categgory_name,inserted_date) values(@category_name,GETDATE())
end


alter proc sp_tbl_category_select  
as  
begin  
select *,convert(varchar(50),inserted_date,106) as added_date from tbl_category   
end

sp_helptext sp_delivery_boy_status_update

create proc sp_tbl_category_status_update  
@category_id int  
as  
begin  
 declare @p int  
 select @p=category_status from tbl_category where category_id=@category_id  
 if(@p=0)  
  begin  
   update tbl_category set category_status=1 where category_id=@category_id  
  end  
 else  
  begin  
   update tbl_category set category_status=0 where category_id=@category_id  
  end  
end  

create proc sp_tbl_category_edit
@category_id int  
as
begin
select * from tbl_category where category_id=@category_id
end
create proc sp_tbl_category_update
@category_id int,
@category_name varchar(50)
as
begin
update tbl_category set categgory_name=@category_name where category_id=@category_id
end


create table tbl_dish
(
dish_id int primary key identity,
dish_name varchar(50),
category_id int,
dish_detail varchar(100),
dish_type int,
dish_image varchar(100),
dish_status int default 0,
added_on date 
)

create proc sp_tbl_category_get
as
begin
select * from tbl_category
end