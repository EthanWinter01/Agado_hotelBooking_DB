-- Create Users' table 
-- superclass/subclass by 8A method 

drop table if exists admin cascade;
drop table if exists unregisterred_user cascade;
drop table if exists registerred_user cascade;
drop table if exists usert cascade;

create table usert (
	user_id int primary key,
	device_type varchar(32) not null
);

create table admin(
	user_id int,
	officer_id int not null,
	admin_name varchar(64) not null,
	admin_password varchar(64) not null, 
    admin_email varchar(64) not null;
	telephone_number varchar(10), 
	foreign key (user_id) references usert(user_id)
);

create table unregisterred_user (
	user_id int, 
	foreign key (user_id) references usert(user_id) 
);
	
create table registerred_user(
	user_id int,
	user_name varchar(64) not null,
	user_password varchar(64) not null, 
	user_email varchar(64) not null,
	telephone_number varchar(10),
	register_date timestamp not null,
	birth_date date not null,
	foreign key(user_id) references usert(user_id) 
);