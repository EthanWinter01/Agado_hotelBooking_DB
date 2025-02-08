CREATE OR REPLACE PROCEDURE update_room_type_facilities(
    update_hotel_id INT, 
    update_room_type VARCHAR(64), 
    update_room_facilities VARCHAR(256)
)
LANGUAGE plpgsql 
AS $$
BEGIN
    UPDATE room_type_facilities
        SET room_facilities = update_room_facilities,
        WHERE hotel_id = update_hotel_id AND room_type = update_room_type;
    RAISE NOTICE 'Room Facilities updated successfully';
END; $$;