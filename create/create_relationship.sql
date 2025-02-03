drop table if exists booking_transaction cascade;
drop table if exists view_hotel_info cascade;
drop table if exists edit_overall_info cascade;
drop table if exists manages_booking cascade;

--log contain all booking
create table booking_transaction(
    booking_id int primary key,
    booking_date date not null,
    duration int,
    check_in_date date not null,
    check_out_date date not null,
    user_id int,
    hotel_id int,
    room_id int,
    foreign key(hotel_id, room_id) references room(hotel_id, room_id),
    foreign key(user_id) references usert(user_id)
);

--log for user view each hotel, for rating and popularity
create table view_hotel_info(
    hotel_id int,
    user_id int,
    primary key (hotel_id, user_id),
    foreign key(hotel_id) references hotel(hotel_id),
    foreign key(user_id) references usert(user_id)
);

--log for admin to edit hotel details
create table edit_overall_info(
    hotel_id int,
    user_id int,
    primary key (hotel_id, user_id),
    foreign key(hotel_id) references hotel(hotel_id),
    foreign key(user_id) references usert(user_id)
);

--log for admin edit booking details
create table manages_booking(
    user_id int,
    booking_id int,
    primary key (user_id, booking_id), 
    foreign key(booking_id) references booking_transaction(booking_id),
    foreign key(user_id) references usert(user_id)
);