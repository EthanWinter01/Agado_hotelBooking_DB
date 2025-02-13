CREATE OR REPLACE FUNCTION util_gen_hotel_id()
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE 
    new_hotel_id INT;
BEGIN 
    SELECT COALESCE(MAX(hotel_id), 9999) + 1 INTO new_hotel_id FROM hotel;
    
    IF new_hotel_id < 10000 THEN
        new_hotel_id := 10000;
    END IF;
    
    IF new_hotel_id > 99999 THEN
        RAISE EXCEPTION 'Hotel ID limit exceeded (max 99999)';
    END IF;

    RETURN new_hotel_id;
END; $$;