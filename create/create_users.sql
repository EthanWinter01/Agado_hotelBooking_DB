-- Create Users' table 
-- superclass/subclass by 8A method 

drop table if exists usert;
create table usert (
	user_id int primary key,
	device_type varchar(32) not null
);
	
drop table if exists admin;
create table admin(
	user_id int,
	officer_id int not null,
	admin_name varchar(64) not null,
	admin_password varchar(64) not null, 
	telephone_number int, 
	foreign key (user_id) references usert(user_id)
);
	
drop table if exists unregisterred_user;
create table unregisterred_user (
	user_id int, 
	foreign key (user_id) references usert(user_id) 
);
	
drop table if exists registerred_user;
create table registerred_user(
	user_id int,
	user_name varchar(64) not null,
	user_password varchar(64) not null, 
	user_email varchar(64) not null,
	telephone_number int,
	register_date timestamp not null,
	birth_date date not null,
	foreign key(user_id) references usert(user_id) 
);