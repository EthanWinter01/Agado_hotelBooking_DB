
CREATE OR REPLACE PROCEDURE add_hotel_overall_info(
    admin_id INT,
    map_url VARCHAR DEFAULT NULL,
    hotel_location VARCHAR(256) DEFAULT NULL,
    check_in TIME DEFAULT NULL,
    check_out TIME DEFAULT NULL,
    wifi VARCHAR(256) DEFAULT NULL,
    pool VARCHAR(256) DEFAULT NULL,
    valet_parking VARCHAR(256) DEFAULT NULL,
    hotel_number VARCHAR(10) DEFAULT NULL
) AS $$
DECLARE
    is_admin INT;
    hotel_id INT;
    floor INT;
    room_id INT;
    room_price_min INT;
    room_price_max INT;
    room_type VARCHAR(64);
BEGIN
    SELECT COUNT(*) INTO is_admin FROM admin WHERE user_id = admin_id;
    IF is_admin = 0 THEN
        RAISE EXCEPTION 'Permission denied: Only admins can add hotels';
    END IF;

    hotel_id := util_gen_hotel_id();

    INSERT INTO hotel(hotel_id, map_url, hotel_location, check_in_time, check_out_time)
    VALUES (hotel_id, map_url, hotel_location, check_in, check_out);

    INSERT INTO hotel_facilities(hotel_id, wifi, pool, valet_parking)
    VALUES (hotel_id, wifi, pool, valet_parking);

    IF hotel_number IS NOT NULL THEN
        INSERT INTO phonenumber(hotel_id, hotel_number)
        VALUES (hotel_id, hotel_number);
    END IF;

    FOR floor IN 2..6 LOOP
        IF floor IN (2, 3) THEN
            room_price_min := 500;
            room_price_max := 1000;
            room_type := 'Cheap';
        ELSIF floor = 4 THEN
            room_price_min := 1500;
            room_price_max := 2000;
            room_type := 'Medium';
        ELSE
            room_price_min := 2500;
            room_price_max := 3000;
            room_type := 'Expensive';
        END IF;

        FOR room_id IN 1..20 LOOP
            CALL add_room(hotel_id, floor, (floor * 100) + room_id, room_type, room_price_min, room_price_max);
        END LOOP;
    END LOOP;

    INSERT INTO edit_overall_info (hotel_id, user_id) 
    VALUES (hotel_id, admin_id);

    RAISE NOTICE 'Hotel added successfully with ID: %', hotel_id;
END;
$$ LANGUAGE plpgsql;