CREATE OR REPLACE PROCEDURE insert_room_type_facilities(
	add_hotel_id INT,
	add_room_type VARCHAR(64),
	add_facilities VARCHAR(256)
)
LANGUAGE plpgsql
AS $$
BEGIN
	IF add_facilities IN (SELECT room_facilities FROM room_type_facilities  WHERE add_hotel_id =hotel_id AND add_room_type = room_type)
		THEN RAISE EXCEPTION '% have already added.(No replacement)',add_facilities;
	ELSE 
		INSERT INTO room_type_facilities (hotel_id,room_type,room_facilities)
			VALUES (add_hotel_id,add_room_type,add_facilities);
	END IF;
END; $$;