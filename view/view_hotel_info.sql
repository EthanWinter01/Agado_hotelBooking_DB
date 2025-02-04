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
    check_out_time TIME
)
LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO edit_overall_info(hotel_id, user_id, edit_timestamp)
    VALUES (view_hotel_id, view_user_id, CAST(NOW() AS TIMESTAMP));

    RETURN QUERY
    SELECT h.hotel_id, h.map_url, h.hotel_location, h.hotel_phonenumber, h.check_in_time, h.check_out_time
    FROM hotel h
    WHERE h.hotel_id = view_hotel_id;
END;
$$
