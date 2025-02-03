-- Procedure to update hotel info (only admin)
CREATE OR REPLACE PROCEDURE update_hotel_overall_info(
    admin_id INT,
    p_hotel_id INT,
    new_map_url VARCHAR DEFAULT NULL,
    new_hotel_location VARCHAR(256) DEFAULT NULL,
    new_check_in TIME DEFAULT NULL,
    new_check_out TIME DEFAULT NULL
) AS $$
DECLARE
    is_admin INT;
    exists_hotel INT;
BEGIN
    -- Check if the user is an admin
    SELECT COUNT() INTO is_admin FROM admin WHERE user_id = admin_id;

    IF is_admin = 0 THEN
        RAISE EXCEPTION 'Permission denied: Only admins can update hotels';
    END IF;

    -- Check if hotel exists
    SELECT COUNT() INTO exists_hotel FROM hotel WHERE hotel_id = p_hotel_id;

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

    -- Log the action
    INSERT INTO edit_overall_info (hotel_id, user_id) VALUES (p_hotel_id, admin_id);

    RAISE NOTICE 'Hotel updated successfully';
END;
$$ LANGUAGE plpgsql;