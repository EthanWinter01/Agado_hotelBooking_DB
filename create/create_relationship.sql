DROP TABLE IF EXISTS booking_transaction cascade;
DROP TABLE IF EXISTS view_hotel_info cascade;
DROP TABLE IF EXISTS edit_overall_info cascade;
DROP TABLE IF EXISTS manages_booking cascade;

--log contain all booking
CREATE TABLE booking_transaction(
    booking_id INT PRIMARY KEY,
    booking_date DATE NOT NULL,
    duration INT,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    user_id INT,
    hotel_id INT,
    room_id INT,
    FOREIGN KEY(hotel_id, room_id) REFERENCES room(hotel_id, room_id),
    FOREIGN KEY(user_id) REFERENCES usert(user_id)
);

--log for user view each hotel, for rating and popularity
CREATE TABLE view_hotel_info(
    hotel_id INT,
    user_id INT,
    view_timestamp TIMESTAMP,
    FOREIGN KEY(hotel_id) REFERENCES hotel(hotel_id),
    FOREIGN KEY(user_id) REFERENCES usert(user_id)
);

--log for admin to edit hotel details
CREATE TABLE edit_overall_info(
    hotel_id INT,
    user_id INT,
    edit_timestamp TIMESTAMP,
    FOREIGN KEY(hotel_id) REFERENCES hotel(hotel_id),
    FOREIGN KEY(user_id) REFERENCES usert(user_id)
);

--log for admin edit booking details
CREATE TABLE manages_booking(
    user_id INT,
    booking_id INT,
    edit_timestamp TIMESTAMP,
    FOREIGN KEY(booking_id) REFERENCES booking_transaction(booking_id),
    FOREIGN KEY(user_id) REFERENCES usert(user_id)
);