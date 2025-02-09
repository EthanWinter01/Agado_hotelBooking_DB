-- new vertion

CREATE OR REPLACE PROCEDURE delete_hotel(
    admin_id INT,
    delete_hotel_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE 
    is_admin INT; 
    exists_hotel INT;
BEGIN
    SELECT COUNT(*) INTO is_admin FROM admin WHERE user_id = admin_id;
    IF is_admin = 0 THEN
        RAISE EXCEPTION 'Permission denied: Only admins can delete hotels';
    END IF;
    
    SELECT COUNT(*) INTO exists_hotel FROM hotel WHERE hotel_id = delete_hotel_id;
    IF exists_hotel = 0 THEN
        RAISE EXCEPTION 'Error: Hotel does not exist';
    END IF;
    
    DELETE FROM hotel_log WHERE hotel_id = delete_hotel_id;
    DELETE FROM booking_log WHERE booking_id IN (SELECT booking_id FROM booking_transaction WHERE hotel_id = delete_hotel_id);
    DELETE FROM booking_transaction WHERE hotel_id = delete_hotel_id;
    DELETE FROM room_type_facilities WHERE hotel_id = delete_hotel_id;
    DELETE FROM room WHERE hotel_id = delete_hotel_id;
    DELETE FROM hotel WHERE hotel_id = delete_hotel_id;
    
    RAISE NOTICE 'Hotel deleted successfully';
END; $$

-- CREATE OR REPLACE PROCEDURE delete_hotel_overall_info (
--     admin_id INT,
--     delete_hotel_id INT
-- )
-- LANGUAGE plpgsql
-- AS $$
-- DECLARE is_admin INT; exists_hotel INT;
-- BEGIN
--     -- Check if the user is an admin
--     SELECT COUNT(*) INTO is_admin FROM admin WHERE user_id = admin_id;
--     IF is_admin = 0 THEN
--         RAISE EXCEPTION 'Permission denied: Only admins can delete hotels';
--     END IF;
    
--     -- Check if hotel exists
--     SELECT COUNT(*) INTO exists_hotel FROM hotel WHERE hotel_id = delete_hotel_id;
--     IF exists_hotel = 0 THEN
--         RAISE EXCEPTION 'Error: Hotel does not exist';
--     END IF;
    
--     DELETE FROM edit_overall_info WHERE hotel_id = delete_hotel_id;
--     DELETE FROM phonenumber WHERE hotel_id = delete_hotel_id;
--     DELETE FROM hotel_facilities WHERE hotel_id = delete_hotel_id;
--     DELETE FROM room_facilities WHERE hotel_id = delete_hotel_id;
--     DELETE FROM room WHERE hotel_id = delete_hotel_id;
--     DELETE FROM hotel WHERE hotel_id = delete_hotel_id;
    
--     RAISE NOTICE 'Hotel deleted successfully';
-- END; $$
