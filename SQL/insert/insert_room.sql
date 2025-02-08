CREATE OR REPLACE PROCEDURE insert_room(
    hotel_id INT, 
    floor INT, 
    room_id INT, 
    _type VARCHAR(64), 
    room_price_min INT, 
    room_price_max INT,
    facilities VARCHAR(256)
)
LANGUAGE plpgsql 
AS $$
BEGIN
    INSERT INTO room(hotel_id, room_id, min_price, max_price, status, room_type)
        VALUES (
            hotel_id, 
            room_id, -- room_id ex. 209, 310, 501, ...
            room_price_min, 
            room_price_max, 
            TRUE,  -- room is empty
            _type
        );
	CALL insert_room_facilities(hotel_id,_type,facilities);
END; $$;