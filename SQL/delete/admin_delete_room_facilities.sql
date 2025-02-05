CREATE OR REPLACE PROCEDURE delete_room_facilities(
del_hotel_id int,
del_room_id int,
del_facilities VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
	IF del_facilities NOT IN (SELECT room_facilities FROM room_facilities WHERE del_hotel_id =hotel_id AND del_room_id = room_id)
	THEN RAISE EXCEPTION 'Cannot find % in Room : % from hotel : %.',del_facilities,del_room_id,del_hotel_id;
	ELSE 
	DELETE FROM room_facilities
	WHERE room_facilities = del_facilities AND del_hotel_id = hotel_id AND del_room_id = room_id;
	END IF;
END;
$$