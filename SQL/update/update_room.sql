CREATE OR REPLACE PROCEDURE update_room(
    update_hotel_id INT, 
    update_room_id INT,
    update_room_type VARCHAR(64), 
)
LANGUAGE plpgsql 
AS $$
BEGIN
    UPDATE room
    SET room_type = update_room_type
        WHERE hotel_id = update_hotel_id AND room_id = update_room_id;
    RAISE NOTICE 'Room updated successfully';
END; $$;