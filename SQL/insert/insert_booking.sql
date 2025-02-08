CREATE OR REPLACE PROCEDURE book(
	check_in_date DATE,
	check_out_date DATE,
	book_user_id INT,
	book_hotel_id INT,
	book_room_id INT,
	book_description VARCHAR(256) DEFAULT NULL
) 
LANGUAGE plpgsql
AS $$
DECLARE
	new_booking_id INT;
	duration INT;
	admin_id INT;
BEGIN
	new_booking_id = util_gen_booking_id();
	duration = check_out_date - check_in_date;

	-- If more than 3 night
	IF duration > 3 THEN 
		RAISE EXCEPTION 'Book more than 3 night. Your duration : %', duration;
	-- If room not available
	ELSEIF (SELECT R.status FROM room R WHERE R.room_id = book_room_id AND R.hotel_id = book_hotel_id) = FALSE THEN 
		RAISE EXCEPTION 'Room ID : % in Hotel ID : % not available',book_room_id,book_hotel_id;
	ELSE
		-- Add booking_transaction
		INSERT INTO booking_transaction (booking_id,booking_date,duration,check_in_date,check_out_date,user_id,hotel_id,room_id)
			VALUES (new_booking_id,now(),duration,check_in_date,check_out_date,book_user_id,book_hotel_id,book_room_id);
		-- Update room status to false
		UPDATE room SET status = FALSE WHERE room_id = book_room_id AND hotel_id = book_hotel_id;
		-- Add log
		INSERT INTO booking_log (booking_id, user_id, action_timestamp, action_type, action_description)
			VALUES (
				new_booking_id, 
				book_user_id, 
				CAST(NOW() AS TIMESTAMP), 
				'user_insert_book',
				book_description 
			);
	END IF;	
END; $$;