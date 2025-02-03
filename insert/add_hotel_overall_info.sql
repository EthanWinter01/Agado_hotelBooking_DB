-- Procedure to add a new hotel (only admin)
CREATE OR REPLACE PROCEDURE add_hotel_overall_info(
    admin_id INT,
    hotel_id INT,
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
BEGIN
    -- Check if the user is an admin
    SELECT COUNT(*) INTO is_admin FROM admin WHERE user_id = admin_id;

    IF is_admin = 0 THEN
        RAISE EXCEPTION 'Permission denied: Only admins can add hotels';
    END IF;

    -- Insert new hotel
    INSERT INTO hotel(hotel_id, map_url, hotel_location, check_in_time, check_out_time)
    VALUES (hotel_id, map_url, hotel_location, check_in, check_out);

    -- Insert facilities into hotel_facilities
    INSERT INTO hotel_facilities(hotel_id, wifi, pool, valet_parking)
    VALUES (hotel_id, wifi, pool, valet_parking);

    -- Insert phone number into phonenumber 
    IF hotel_number IS NOT NULL THEN
        INSERT INTO phonenumber(hotel_id, hotel_number)
        VALUES (hotel_id, hotel_number);
    END IF;

    -- Log the action
    INSERT INTO edit_overall_info (hotel_id, user_id) VALUES (hotel_id, admin_id);

    RAISE NOTICE 'Hotel added successfully';
END;
$$ LANGUAGE plpgsql;