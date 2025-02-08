CREATE OR REPLACE PROCEDURE insert_room_facilities(
	add_hotel_id INT,
	add_room_id INT,
	add_facilities VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
	IF add_facilities IN (SELECT room_facilities FROM room_facilities WHERE add_hotel_id =hotel_id AND add_room_id = room_id)
		THEN RAISE EXCEPTION '% have already added.(No replacement)',add_facilities;
	ELSE 
		INSERT INTO room_facilities (hotel_id,room_id,room_facilities)
			VALUES (add_hotel_id,add_room_id,add_facilities);
	END IF;
END;
$$