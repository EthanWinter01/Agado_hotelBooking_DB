-- CREATE OR REPLACE PROCEDURE update_hotel_overall_info(
--     admin_id INT,
--     p_hotel_id INT,
--     new_map_url VARCHAR DEFAULT NULL,
--     new_hotel_name VARCHAR(256) DEFAULT NULL,
--     new_check_in TIME DEFAULT NULL,
--     new_check_out TIME DEFAULT NULL,
--     new_wifi VARCHAR(256) DEFAULT NULL,
--     new_pool VARCHAR(256) DEFAULT NULL,
--     new_valet_parking VARCHAR(256) DEFAULT NULL,
--     new_hotel_number VARCHAR(10) DEFAULT NULL
-- ) AS $$
-- DECLARE
--     is_admin INT;
--     exists_hotel INT;
-- BEGIN
--     SELECT COUNT(*) INTO is_admin FROM admin WHERE user_id = admin_id;

--     IF is_admin = 0 THEN
--         RAISE EXCEPTION 'Permission denied: Only admins can update hotels';
--     END IF;

--     SELECT COUNT(*) INTO exists_hotel FROM hotel WHERE hotel_id = p_hotel_id;

--     IF exists_hotel = 0 THEN
--         RAISE EXCEPTION 'Error: Hotel does not exist';
--     END IF;

--     UPDATE hotel
--     SET map_url = COALESCE(new_map_url, map_url),
--         hotel_name = COALESCE(new_hotel_name, hotel_name),
--         check_in_time = COALESCE(new_check_in, check_in_time),
--         check_out_time = COALESCE(new_check_out, check_out_time)
--     WHERE hotel_id = p_hotel_id;

--     UPDATE hotel_facilities
--     SET wifi = COALESCE(new_wifi, wifi),
--         pool = COALESCE(new_pool, pool),
--         valet_parking = COALESCE(new_valet_parking, valet_parking)
--     WHERE hotel_id = p_hotel_id;

--     SELECT COUNT(*) INTO exists_phone FROM phonenumber WHERE hotel_id = p_hotel_id;

--     IF new_hotel_number IS NOT NULL THEN
--         UPDATE hotel
--         SET hotel_number = new_hotel_number
--         WHERE hotel_id = p_hotel_id;
--     ELSE
--     -- Do nothing, as we don't want to update the phone number if it's NULL
--     END IF;

--     INSERT INTO edit_overall_info (hotel_id, user_id) VALUES (p_hotel_id, admin_id);

--     RAISE NOTICE 'Hotel updated successfully';
-- END;
-- $$ LANGUAGE plpgsql;

-- new vertion

CREATE OR REPLACE PROCEDURE update_hotel(
    hotel_id INT,
    admin_id INT,
    new_map_url VARCHAR DEFAULT NULL,
    new_hotel_name VARCHAR(256) DEFAULT NULL,
    new_check_in TIME DEFAULT NULL,
    new_check_out TIME DEFAULT NULL,
    new_hotel_facilities VARCHAR(512) DEFAULT NULL,
    -- new_wifi VARCHAR(256) DEFAULT NULL,
    -- new_pool VARCHAR(256) DEFAULT NULL,
    -- new_valet_parking VARCHAR(256) DEFAULT NULL,
    new_hotel_phonenumber VARCHAR(10) DEFAULT NULL,
    insert_description VARCHAR(256) DEFAULT NULL 
) AS $$
DECLARE
    is_admin INT;
    exists_hotel INT;
BEGIN
    SELECT COUNT(*) INTO is_admin FROM admin WHERE user_id = admin_id;
    IF is_admin = 0 THEN
        RAISE EXCEPTION 'Permission denied: Only admins can update hotels';
    END IF;

    SELECT COUNT(*) INTO exists_hotel FROM hotel WHERE hotel_id = p_hotel_id;
    IF exists_hotel = 0 THEN
        RAISE EXCEPTION 'Error: Hotel does not exist';
    END IF;

    UPDATE hotel
    SET map_url = COALESCE(new_map_url, map_url),
        hotel_name = COALESCE(new_hotel_name, hotel_name),
        check_in_time = COALESCE(new_check_in, check_in_time),
        check_out_time = COALESCE(new_check_out, check_out_time),
        hotel_phonenumber = COALESCE(new_hotel_phonenumber, hotel_phonenumber),
        hotel_facilities = COALESCE(new_hotel_facilities, hotel_facilities)
    WHERE hotel_id = p_hotel_id;

    UPDATE hotel_facilities
    SET wifi = COALESCE(new_wifi, wifi),
        pool = COALESCE(new_pool, pool),
        valet_parking = COALESCE(new_valet_parking, valet_parking)
    WHERE hotel_id = p_hotel_id;

    INSERT INTO hotel_log (hotel_id, user_id, action_timestamp, action_type, action_description)
        VALUES (
            p_hotel_id, 
            admin_id, 
            CAST(NOW() AS TIMESTAMP), 
            'admin_update_hotel', 
            insert_description
        );
    RAISE NOTICE 'Hotel updated successfully';
END;
$$ LANGUAGE plpgsql;
