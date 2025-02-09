CREATE OR REPLACE FUNCTION view_hotel(
    view_hotel_id INT,
    view_user_id INT
)
RETURNS TABLE(
    hotel_id INT,
    hotel_name VARCHAR,         
    map_url VARCHAR,
    hotel_phonenumber VARCHAR, 
    check_in_time TIME,
    check_out_time TIME,
    hotel_facilities VARCHAR,
    available_room INT,
    room_type VARCHAR,
    min_price INT,
    max_price INT,
    room_facilities VARCHAR
)
LANGUAGE plpgsql
AS
$$
DECLARE
    available INT;
BEGIN
    IF EXISTS (
        SELECT 1 FROM hotel h WHERE h.hotel_id = view_hotel_id
    ) THEN 
        -- Log the user's view action if the user is not an admin
        IF view_user_id < 900000000 THEN 
            INSERT INTO hotel_log(hotel_id, user_id, action_timestamp, action_type, action_description)
            VALUES (view_hotel_id, view_user_id, NOW(), 'user_view_hotel', NULL);
        END IF;
        
        -- Count available rooms (assuming available rooms have a status column that should be checked)
        SELECT COUNT(*) INTO available FROM room r WHERE r.hotel_id = view_hotel_id ;  -- Adjust 'available' condition as per your schema




        -- Return hotel and room details, grouped by room type
        RETURN QUERY
        SELECT h.hotel_id, h.hotel_name, h.map_url, h.hotel_phonenumber, 
               CAST(h.check_in_time AS TIME), CAST(h.check_out_time AS TIME), h.hotel_facilities, available, 
               r.room_type, 
               MIN(rtf.min_price) AS min_price,  -- Aggregate prices for the room type
               MAX(rtf.max_price) AS max_price,  -- Aggregate prices for the room type
               rtf.room_facilities
        FROM hotel h
        LEFT JOIN room r ON h.hotel_id = r.hotel_id
        LEFT JOIN room_type_facilities rtf ON r.hotel_id = rtf.hotel_id AND r.room_type = rtf.room_type
        WHERE h.hotel_id = view_hotel_id
        GROUP BY h.hotel_id, h.hotel_name, h.map_url, h.hotel_phonenumber, 
                 h.check_in_time, h.check_out_time, h.hotel_facilities, available, r.room_type, rtf.room_facilities;
    ELSE
        RAISE NOTICE 'Hotel ID % does not exist', view_hotel_id;
    END IF;
END; $$;

-- CREATE OR REPLACE FUNCTION view_hotel(
--     view_hotel_id INT,
--     view_user_id INT
-- )
-- RETURNS TABLE(
--     hotel_id INT,
--     hotel_name VARCHAR,
--     map_url VARCHAR,
--     hotel_location VARCHAR,
--     hotel_phonenumber VARCHAR, 
--     check_in_time TIME,
--     check_out_time TIME,
--     hotel_facilities VARCHAR,
--     available_room INT,
--     room_id INT,
--     room_type VARCHAR,
--     min_price INT,
--     max_price INT,
--     room_facilities VARCHAR
-- )
-- LANGUAGE plpgsql
-- AS
-- $$
-- DECLARE
--     available INT;
-- BEGIN
--     IF EXISTS (
--         SELECT 1 FROM hotel h WHERE h.hotel_id = view_hotel_id
--     ) THEN 
--         -- Log the user's view action if the user is not an admin
--         IF view_user_id < 900000000 THEN 
--             INSERT INTO hotel_log(hotel_id, user_id, action_timestamp, action_type, action_description)
--             VALUES (view_hotel_id, view_user_id, NOW(), 'user_view_hotel', NULL);
--         END IF;
        
--         -- Count available rooms (assuming available rooms have a status column that should be checked)
--         SELECT COUNT(*) INTO available FROM room r WHERE r.hotel_id = view_hotel_id;

--         -- Return hotel and room details along with room type facilities
--         RETURN QUERY
--         SELECT h.hotel_id, h.hotel_name, h.map_url, h.hotel_phonenumber, 
--                h.check_in_time, h.check_out_time, h.hotel_facilities, available, 
--                r.room_id, r.room_type, rtf.min_price, rtf.max_price, rtf.room_facilities
--         FROM hotel h
--         LEFT JOIN room r ON h.hotel_id = r.hotel_id
--         LEFT JOIN room_type_facilities rtf ON r.hotel_id = rtf.hotel_id AND r.room_type = rtf.room_type
--         WHERE h.hotel_id = view_hotel_id;
--     ELSE
--         RAISE NOTICE 'Hotel ID % does not exist', view_hotel_id;
--     END IF;
-- END; $$;


