CREATE OR REPLACE FUNCTION view_hotel(
    view_hotel_id INT,
    view_user_id INT
)
RETURNS TABLE(
    hotel_id INT,
    map_url VARCHAR,
    hotel_location VARCHAR,
    hotel_phonenumber VARCHAR, 
    check_in_time TIME,
    check_out_time TIME,
    wifi VARCHAR,
    pool VARCHAR,
    valet_parking VARCHAR,
    available_room INT 
)
LANGUAGE plpgsql
AS
$$
DECLARE
    available INT;
BEGIN
    IF EXISTS (
        SELECT 1
        FROM hotel h
        WHERE h.hotel_id = view_hotel_id
    ) THEN 
        INSERT INTO view_hotel_info(hotel_id, user_id, view_timestamp)
        VALUES (view_hotel_id, view_user_id, CAST(NOW() AS TIMESTAMP));

        SELECT COUNT(CASE WHEN r.status = true THEN 1 END)
        INTO available
        FROM room r 
        WHERE r.hotel_id = view_hotel_id;

        RETURN QUERY
        SELECT h.hotel_id, h.map_url, h.hotel_location, h.hotel_phonenumber, h.check_in_time, h.check_out_time, f.wifi, f.pool, f.valet_parking, available
        FROM hotel h
        LEFT JOIN hotel_facilities f ON h.hotel_id = f.hotel_id
        WHERE h.hotel_id = view_hotel_id;
    
    ELSE
        RAISE NOTICE 'hotel id % does not exists', view_hotel_id;
    END IF;    
END;
$$
