-- Create Hotel Table 

DROP TABLE IF EXISTS hotel CASCADE;
DROP TABLE IF EXISTS hotel_facilities CASCADE;
DROP TABLE IF EXISTS phonenumber CASCADE;
DROP TABLE IF EXISTS room CASCADE;
DROP TABLE IF EXISTS room_facilities CASCADE;

CREATE TABLE hotel(
    hotel_id INT PRIMARY KEY,
    map_url VARCHAR DEFAULT NULL,
    hotel_location VARCHAR(256),
    hotel_phonenumber VARCHAR(10), --substitute PhoneNumber table 
    check_in_time time,
    check_out_time time
);

CREATE TABLE hotel_facilities(
    hotel_id INT PRIMARY KEY,
    wifi VARCHAR(256) DEFAULT NULL,
    pool VARCHAR(256) DEFAULT NULL,
    valet_parking VARCHAR(256) DEFAULT NULL,
    FOREIGN KEY(hotel_id) REFERENCES hotel(hotel_id)
);

CREATE TABLE room(
    hotel_id INT,
    room_id INT,
    min_price INT,
    max_price INT,
    status BOOLEAN,
    room_type VARCHAR(64),
    PRIMARY KEY(hotel_id, room_id),
    FOREIGN KEY(hotel_id) REFERENCES hotel(hotel_id)
);

CREATE TABLE room_facilities(
    hotel_id INT,
    room_id INT,
    room_facilities VARCHAR(256), --facilities description
    FOREIGN KEY(hotel_id, room_id) REFERENCES room(hotel_id, room_id)
);