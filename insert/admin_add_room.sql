CREATE OR REPLACE PROCEDURE add_room(
    hotel_id INT, 
    floor INT, 
    room_id INT, 
    room_type VARCHAR(64), 
    room_price_min INT, 
    room_price_max INT
) AS $$
BEGIN
    -- เพิ่มห้องพัก
    INSERT INTO room(hotel_id, room_id, min_price, max_price, status, room_type)
    VALUES (
        hotel_id, 
        room_id,  -- room_id ถูกกำหนดในสูตรเช่น 209, 310, 501, ...
        room_price_min, 
        room_price_max, 
        TRUE,  -- ห้องว่าง
        room_type
    );

	-- เพิ่ม room facilities
	IF room_type = 'Expensive' 
	THEN 
	CALL add_room_facilities(hotel_id,room_id,'room_pool');
	CALL add_room_facilities(hotel_id,room_id,'tv');
	CALL add_room_facilities(hotel_id,room_id,'fridge');
	
	ELSEIF room_type = 'Medium' 
	THEN 
	CALL add_room_facilities(hotel_id,room_id,'tv');
	CALL add_room_facilities(hotel_id,room_id,'fridge');
	
	ELSEIF room_type = 'Cheap'
	THEN 
	CALL add_room_facilities(hotel_id,room_id,'tv');
	
	END IF;
END;
$$ LANGUAGE plpgsql;