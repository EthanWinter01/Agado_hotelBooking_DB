CREATE OR REPLACE PROCEDURE insert_hotel(
    admin_id INT,
    map_url VARCHAR DEFAULT NULL,
    hotel_name VARCHAR(256) DEFAULT NULL,
    check_in TIME DEFAULT NULL,
    check_out TIME DEFAULT NULL,
    facilities VARCHAR(512) DEFAULT NULL,
    -- wifi VARCHAR(256) DEFAULT NULL,
    -- pool VARCHAR(256) DEFAULT NULL,
    -- valet_parking VARCHAR(256) DEFAULT NULL,
    hotel_number VARCHAR(10) DEFAULT NULL,
    num_floors INT DEFAULT 5,      -- Number of floors of the hotel (not counting the 1st floor)
    num_rooms_per_floor INT DEFAULT 20, -- Number of rooms per floor (Equal for every class)
    min1 INT DEFAULT 500,          -- Minimum price of a cheap room
    max1 INT DEFAULT 1000,         -- Maximum price of a cheap room
    min2 INT DEFAULT 1500,         -- Minimum price for a middle class room
    max2 INT DEFAULT 2000,         -- Highest price for a middle class room
    min3 INT DEFAULT 2500,         -- Minimum price of expensive rooms
    max3 INT DEFAULT 3000,         -- Maximum price of an expensive room
    c1 INT DEFAULT 2,              -- The first floor is a cheap room.
    c2 INT DEFAULT 5,              -- The first floor is a middle level room.
    c3 INT DEFAULT 8,              -- The first floor is an expensive room.
    facilities1 VARCHAR(256) DEFAULT NULL,  
    facilities2 VARCHAR(256) DEFAULT NULL,  
    facilities3 VARCHAR(256) DEFAULT NULL,  
    insert_description VARCHAR(256) DEFAULT NULL 
) 
LANGUAGE plpgsql
AS $$
DECLARE
    is_admin INT;
    hotel_id INT;
    floor INT;
    room_id INT;
    room_facilities VARCHAR(256);
    room_type VARCHAR(64);
BEGIN
    -- Check admin rights
    -- SELECT COUNT(*) INTO is_admin FROM admin WHERE user_id = admin_id;
    -- IF is_admin = 0 THEN
    --     RAISE EXCEPTION 'Permission denied: Only admins can add hotels';
    -- END IF;

    -- Create a new hotel_id
    hotel_id := util_gen_hotel_id();

    -- Add hotel information
    INSERT INTO hotel(hotel_id, map_url, hotel_name, check_in_time, check_out_time, hotel_phonenumber, hotel_facilities)
        VALUES (hotel_id, map_url, hotel_name, check_in, check_out, hotel_number, facilities);

    CALL insert_room_type_facilities(hotel_id, 'Cheap', facilities1, min1, max1);
    CALL insert_room_type_facilities(hotel_id, 'Medium', facilities2, min2, max2);
    CALL insert_room_type_facilities(hotel_id, 'Expensive', facilities3, min3, max3);

    -- -- Add hotel amenities information
    -- INSERT INTO hotel_facilities(hotel_id, wifi, pool, valet_parking)
    --     VALUES (hotel_id, wifi, pool, valet_parking);

    -- Verify that the parameter values ​​are within the correct range.
    IF c1 < 2 OR c2 <= c1 OR c3 <= c2 OR c3 > (1 + num_floors) THEN
        RAISE EXCEPTION 'Invalid floor range: c1=%, c2=%, c3=% (Must be: 2 ≤ c1 < c2 < c3 ≤ num_floors + 1)', c1, c2, c3;
    END IF;

    -- Create rooms according to the floor and number of rooms specified.
    FOR floor IN 2..(1 + num_floors) LOOP
        -- Set room prices according to the floor range.
        IF floor >= c1 AND floor < c2 THEN
            room_type := 'Cheap';
        ELSIF floor >= c2 AND floor < c3 THEN
            room_type := 'Medium';
        ELSE
            room_type := 'Expensive';
        END IF;

        -- Loop creates rooms within the floor.
        FOR room_id IN 1..num_rooms_per_floor LOOP
            CALL insert_room(hotel_id, floor, (floor * 100) + room_id, room_type);
        END LOOP;
    END LOOP;

    -- Record information that the admin added this hotel.
    INSERT INTO hotel_log (hotel_id, user_id, action_timestamp, action_type, action_description) 
        VALUES (
            hotel_id, 
            admin_id,
            CAST(NOW() AS TIMESTAMP),
            'admin_insert_hotel',
            insert_description
        );

    -- Notification that the hotel was successfully added.
    RAISE NOTICE 'Hotel added successfully with ID: %', hotel_id;
END; $$;