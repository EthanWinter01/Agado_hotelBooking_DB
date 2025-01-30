create table hotel(
hotel_id int,
map_url varchar default null,
hotel_location varchar(255) ,
check_in_time time ,
check_out_time time ,
primary key(hotel_id)
);

create table usert(
user_id int,
device_type varchar not null,
primary key(user_id)
);

create table admin(
user_id int,
officer_id int not null,
admin_name varchar(255) not null,
admin_password varchar(255) not null,
telephone_number int ,
foreign key(user_id) 
references usert(user_id)
);

create table unregisterred_user(
user_id int,
foreign key(user_id) 
references usert(user_id)
);

create table registerred_user(
user_id int,
user_name varchar(255) not null,
user_password varchar(255) not null,
user_email varchar(255) ,
telephone_number int ,
register_date timestamp not null,
birth_date date not null,
foreign key(user_id) 
references usert(user_id)
);

create table hotel_facilities(
hotel_id int,
wifi varchar(255) default null,
pool varchar(255) default null,
valet_parking varchar(255) default null,
foreign key(hotel_id) 
references hotel(hotel_id)
);

create table phonenumber(
hotel_id int,
hotel_number int not null,
foreign key(hotel_id) references hotel(hotel_id)
);

create table room(
hotel_id int,
room_id int,
min_price int,
max_price int,
status boolean,
room_type varchar(255),
primary key(room_id),
foreign key(hotel_id) 
references hotel(hotel_id)
);

create table room_facilities(
hotel_id int,
room_id int,
roo_facilities varchar(255),
foreign key(room_id) 
references room(room_id),
foreign key(hotel_id) 
references hotel(hotel_id)
);

create table booking_transaction(
booking_id int,
booking_date timestamp not null,
duration int,
preferred_hotel varchar(255),
check_in_date date not null,
check_out_date date not null,
user_id int,
primary key(booking_id),
foreign key(user_id) 
references usert(user_id)
);

create table view_hotel_info(
hotel_id int,
user_id int,
foreign key(hotel_id) 
references hotel(hotel_id),
foreign key(user_id) 
references usert(user_id)
);

create table edit_overall_info(
hotel_id int,
user_id int,
foreign key(hotel_id) 
references hotel(hotel_id),
foreign key(user_id) 
references usert(user_id)
);

create table manages_booking(
user_id int,
booking_id int,
foreign key(booking_id) 
references booking_transaction(booking_id),
foreign key(user_id) 
references usert(user_id)
);




