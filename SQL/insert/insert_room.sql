CREATE OR REPLACE PROCEDURE insert_room(
    hotel_id INT, 
    floor INT, 
    room_id INT, 
    room_type VARCHAR(64), 
    room_price_min INT, 
    room_price_max INT
)
LANGUAGE plpgsql; 
AS $$
BEGIN
    INSERT INTO room(hotel_id, room_id, min_price, max_price, status, room_type)
        VALUES (
            hotel_id, 
            room_id, -- room_id ex. 209, 310, 501, ...
            room_price_min, 
            room_price_max, 
            TRUE,  -- room is empty
            room_type
        );

	IF room_type = 'Expensive' THEN 
	    CALL insert_room_facilities(hotel_id,room_id,'room_pool');
	    CALL insert_room_facilities(hotel_id,room_id,'tv');
	    CALL insert_room_facilities(hotel_id,room_id,'fridge');
	
	ELSIF room_type = 'Medium' THEN 
	    CALL insert_room_facilities(hotel_id,room_id,'tv');
	    CALL insert_room_facilities(hotel_id,room_id,'fridge');
	
	ELSIF room_type = 'Cheap' THEN 
	    CALL insert_room_facilities(hotel_id,room_id,'tv');
	
	END IF;
END; $$;