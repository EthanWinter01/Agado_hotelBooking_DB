CREATE OR REPLACE PROCEDURE add_room_facilities(
add_hotel_id int,
add_room_id int,
add_facilities VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
	IF add_facilities IN (SELECT room_facilities FROM room_facilities WHERE add_hotel_id =hotel_id AND add_room_id = room_id)
	THEN RAISE EXCEPTION '% have already added.(Not add)',add_facilities;
	ELSE 
	INSERT INTO room_facilities (hotel_id,room_id,room_facilities)
	VALUES (add_hotel_id,add_room_id,add_facilities);
	END IF;
END;
$$