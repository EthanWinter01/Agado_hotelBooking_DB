CREATE OR REPLACE PROCEDURE delete_booking(
delete_booking_id INT,
deleter_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	IF deleter_id >= 900000000 THEN
		
		DELETE FROM booking_log 
			WHERE booking_id = delete_booking_id;
	
		DELETE FROM booking_transaction 
			WHERE booking_id = delete_booking_id;
	
	ELSEIF deleter_id = (SELECT user_id FROM booking_transaction WHERE booking_id = delete_booking_id ) THEN
		
		delete FROM booking_log
			WHERE booking_id = delete_booking_id;
		
		delete FROM booking_transaction 
			WHERE booking_id = delete_booking_id;
	
	ELSE raise exception 'Deleter try to delete other user booking';
	END IF;
END;$$

-- CREATE OR REPLACE PROCEDURE Delete_Booking(
-- delete_booking_id INT,
-- deleter_id INT
-- )
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
-- 	IF deleter_id >= 900000000 THEN
-- 		UPDATE room 
-- 			SET status = true 
-- 			WHERE room_id = (SELECT room_id FROM booking_transaction WHERE booking_id = delete_booking_id) 
-- 			AND hotel_id = (SELECT hotel_id FROM booking_transaction WHERE booking_id = delete_booking_id);

-- 		DELETE FROM manages_booking 
-- 			WHERE booking_id = delete_booking_id;
	
-- 		DELETE FROM booking_transaction 
-- 			WHERE booking_id = delete_booking_id;
-- 	ELSEIF deleter_id = (SELECT user_id FROM booking_transaction WHERE booking_id = delete_booking_id ) THEN
-- 		UPDATE room 
-- 			SET status = true 
-- 			WHERE room_id = (SELECT room_id FROM booking_transaction WHERE booking_id = delete_booking_id) 
-- 			AND hotel_id = (SELECT hotel_id FROM booking_transaction WHERE booking_id = delete_booking_id);
	
-- 		delete FROM manages_booking 
-- 			WHERE booking_id = delete_booking_id;
		
-- 		delete FROM booking_transaction 
-- 			WHERE booking_id = delete_booking_id;
-- 	ELSE raise exception 'Deleter try to delete other user booking';
-- 	END IF;
-- END;$$
