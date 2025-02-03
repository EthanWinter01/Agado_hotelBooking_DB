CREATE OR REPLACE PROCEDURE book(
check_in_date date,
check_out_date date,
book_user_id int,
book_hotel_id int,
book_room_id int
) 
LANGUAGE plpgsql
AS $$
DECLARE
new_booking_id int;
duration int;
admin_id int;
BEGIN
	new_booking_id = util_gen_booking_id();
	duration = check_out_date - check_in_date;

	-- If more than 3 night
	IF duration > 3 
	THEN RAISE EXCEPTION 'Book more than 3 night. Your duration : %', duration;

	-- If room not available
	ELSEIF (SELECT R.status FROM room R WHERE R.room_id = book_room_id AND R.hotel_id = book_hotel_id) = FALSE
	THEN RAISE EXCEPTION 'Room ID : % in Hotel ID : % not available',book_room_id,book_hotel_id;

	
	ELSE
	-- Add booking_transaction
	INSERT INTO booking_transaction (booking_id,booking_date,duration,check_in_date,check_out_date,user_id,hotel_id,room_id)
	VALUES (new_booking_id,now(),duration,check_in_date,check_out_date,book_user_id,book_hotel_id,book_room_id);

	-- Update room status to false
	UPDATE room SET status = FALSE WHERE room_id = book_room_id AND hotel_id = book_hotel_id;
	
	END IF;
	
END;
$$