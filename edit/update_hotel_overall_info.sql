-- Procedure to update hotel info (only admin)
CREATE OR REPLACE PROCEDURE update_hotel_overall_info(
    admin_id INT,
    p_hotel_id INT,
    new_map_url VARCHAR DEFAULT NULL,
    new_hotel_location VARCHAR(256) DEFAULT NULL,
    new_check_in TIME DEFAULT NULL,
    new_check_out TIME DEFAULT NULL,
    new_wifi VARCHAR(256) DEFAULT NULL,
    new_pool VARCHAR(256) DEFAULT NULL,
    new_valet_parking VARCHAR(256) DEFAULT NULL,
    new_hotel_number VARCHAR(10) DEFAULT NULL
) AS $$
DECLARE
    is_admin INT;
    exists_hotel INT;
    exists_phone INT;
BEGIN
    -- Check if the user is an admin
    SELECT COUNT(*) INTO is_admin FROM admin WHERE user_id = admin_id;

    IF is_admin = 0 THEN
        RAISE EXCEPTION 'Permission denied: Only admins can update hotels';
    END IF;

    -- Check if hotel exists
    SELECT COUNT(*) INTO exists_hotel FROM hotel WHERE hotel_id = p_hotel_id;

    IF exists_hotel = 0 THEN
        RAISE EXCEPTION 'Error: Hotel does not exist';
    END IF;

    -- Update hotel details
    UPDATE hotel
    SET map_url = COALESCE(new_map_url, map_url),
        hotel_location = COALESCE(new_hotel_location, hotel_location),
        check_in_time = COALESCE(new_check_in, check_in_time),
        check_out_time = COALESCE(new_check_out, check_out_time)
    WHERE hotel_id = p_hotel_id;

    -- Update hotel facilities
    UPDATE hotel_facilities
    SET wifi = COALESCE(new_wifi, wifi),
        pool = COALESCE(new_pool, pool),
        valet_parking = COALESCE(new_valet_parking, valet_parking)
    WHERE hotel_id = p_hotel_id;

    -- Check if phone number exists
    SELECT COUNT(*) INTO exists_phone FROM phonenumber WHERE hotel_id = p_hotel_id;

    -- If phone number exists, update it; otherwise, insert a new one
    IF exists_phone > 0 THEN
        UPDATE phonenumber
        SET hotel_number = COALESCE(new_hotel_number, hotel_number)
        WHERE hotel_id = p_hotel_id;
    ELSE
        IF new_hotel_number IS NOT NULL THEN
            INSERT INTO phonenumber(hotel_id, hotel_number)
            VALUES (p_hotel_id, new_hotel_number);
        END IF;
    END IF;

    -- Log the action
    INSERT INTO edit_overall_info (hotel_id, user_id) VALUES (p_hotel_id, admin_id);

    RAISE NOTICE 'Hotel updated successfully';
END;
$$ LANGUAGE plpgsql;