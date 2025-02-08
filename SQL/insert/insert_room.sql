CREATE OR REPLACE PROCEDURE insert_room(
    hotel_id INT, 
    floor INT, 
    room_id INT, 
    room_type VARCHAR(64), 
    room_facilities VARCHAR(256)
)
LANGUAGE plpgsql 
AS $$
BEGIN
    INSERT INTO room(hotel_id, room_id, status, room_type)
        VALUES (
            hotel_id, 
            room_id, -- room_id ex. 209, 310, 501, ...
            TRUE,  -- room is empty
            room_type
        );
END; $$;