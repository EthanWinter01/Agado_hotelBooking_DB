CREATE OR REPLACE PROCEDURE Delete_Booking(
delete_id INT,
deleter_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	IF deleter_id >= 900000000 THEN
		UPDATE room 
			SET status = true 
			WHERE room_id = (SELECT room_id FROM booking_transaction WHERE booking_id = delete_id) 
			AND hotel_id = (SELECT hotel_id FROM booking_transaction WHERE booking_id = delete_id);

		DELETE FROM manages_booking 
			WHERE booking_id = delete_id;
	
		DELETE FROM booking_transaction 
			WHERE booking_id = delete_id;
	ELSEIF deleter_id = (SELECT user_id FROM booking_transaction WHERE booking_id = delete_id ) THEN
		UPDATE room 
			SET status = true 
			WHERE room_id = (SELECT room_id FROM booking_transaction WHERE booking_id = delete_id) 
			AND hotel_id = (SELECT hotel_id FROM booking_transaction WHERE booking_id = delete_id);
	
		delete FROM manages_booking 
			WHERE booking_id = delete_id;
		
		delete FROM booking_transaction 
			WHERE booking_id = delete_id;
	ELSE raise exception 'Deleter try to delete other user booking';
	END IF;
END;$$