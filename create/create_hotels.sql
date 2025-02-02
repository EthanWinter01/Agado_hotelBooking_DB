-- Create Hotel table 

drop table if exists hotel;
drop table if exists hotel_facilities;
drop table if exists phonenumber;
drop table if exists room;
drop table if exists room_facilities;

create table hotel(
    hotel_id int primary key,
    map_url varchar default null,
    hotel_location varchar(256),
    check_in_time time,
    check_out_time time
);

create table hotel_facilities(
    hotel_id int,
    wifi varchar(256) default null,
    pool varchar(256) default null,
    valet_parking varchar(256) default null,
    foreign key(hotel_id) references hotel(hotel_id)
);

create table phonenumber(
    hotel_id int,
    hotel_number varchar(10) not null,
    foreign key(hotel_id) references hotel(hotel_id)
);

create table room(
    hotel_id int,
    room_id int primary key,
    min_price int,
    max_price int,
    status boolean,
    room_type varchar(64),
    foreign key(hotel_id) references hotel(hotel_id)
);

create table room_facilities(
    hotel_id int,
    room_id int,
    room_facilities varchar(256), --facilities description
    foreign key(room_id) references room(room_id),
    foreign key(hotel_id) references hotel(hotel_id)
);