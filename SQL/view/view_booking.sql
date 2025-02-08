CREATE OR REPLACE FUNCTION view_booking(
    admin_status BOOLEAN,
    action_type VARCHAR,
    search_value VARCHAR
)
RETURNS TABLE (
    booking_id INTEGER,
    booking_date DATE,
    check_in_date DATE,
    check_out_date DATE,
    duration INT,
    user_id INT,
    hotel_id INT,
    room_id INT
)
LANGUAGE plpgsql
AS
$$
BEGIN
    -- Case 1: Not admin, only allows searching by booking ID (validate first)
    IF admin_status = FALSE THEN
        IF search_value ~ '^[0-9]+$' THEN
            RETURN QUERY
            SELECT b.booking_id, b.booking_date::DATE, b.check_in_date, b.check_out_date, b.duration, b.user_id, b.hotel_id, b.room_id
            FROM booking_transaction b
            WHERE b.booking_id = search_value::INT;
        ELSE
            RAISE EXCEPTION 'Invalid search value for non-admin: %', search_value;
        END IF;

    -- Case 2: Admin - Select all rows when Action is "None" and Search Value is "-"
    ELSIF admin_status = TRUE AND action_type = 'None' AND search_value = '-' THEN
        RETURN QUERY
        SELECT b.booking_id, b.booking_date::DATE, b.check_in_date, b.check_out_date, b.duration, b.user_id, b.hotel_id, b.room_id
        FROM booking_transaction b
        ORDER BY b.booking_date DESC;

    -- Case 3: Admin - Filter by booking ID
    ELSIF admin_status = TRUE AND action_type = 'booking ID' AND search_value ~ '^[0-9]+$' THEN
        RETURN QUERY
        SELECT b.booking_id, b.booking_date::DATE, b.check_in_date, b.check_out_date, b.duration, b.user_id, b.hotel_id, b.room_id
        FROM booking_transaction b
        WHERE b.booking_id = search_value::INT;

    -- Case 4: Admin - Filter by duration
    ELSIF admin_status = TRUE AND action_type = 'duration' AND search_value ~ '^[0-9]+$' THEN
        RETURN QUERY
        SELECT b.booking_id, b.booking_date::DATE, b.check_in_date, b.check_out_date, b.duration, b.user_id, b.hotel_id, b.room_id
        FROM booking_transaction b
        WHERE b.duration = search_value::INT;

    -- Case 5: Admin - Filter by check-in date
    ELSIF admin_status = TRUE AND action_type = 'check_in_date' AND search_value ~ '^\d{4}-\d{2}-\d{2}$' THEN
        RETURN QUERY
        SELECT b.booking_id, b.booking_date::DATE, b.check_in_date, b.check_out_date, b.duration, b.user_id, b.hotel_id, b.room_id
        FROM booking_transaction b
        WHERE b.check_in_date = search_value::DATE;

    -- Case 6: Admin - Filter by check-out date
    ELSIF admin_status = TRUE AND action_type = 'check_out_date' AND search_value ~ '^\d{4}-\d{2}-\d{2}$' THEN
        RETURN QUERY
        SELECT b.booking_id, b.booking_date::DATE, b.check_in_date, b.check_out_date, b.duration, b.user_id, b.hotel_id, b.room_id
        FROM booking_transaction b
        WHERE b.check_out_date = search_value::DATE;

    -- Case 7: Admin - Filter by booking date (Ensure it's properly handled)
    ELSIF admin_status = TRUE AND action_type = 'booking_date' AND search_value ~ '^\d{4}-\d{2}-\d{2}$' THEN
        RETURN QUERY
        SELECT b.booking_id, b.booking_date::DATE, b.check_in_date, b.check_out_date, b.duration, b.user_id, b.hotel_id, b.room_id
        FROM booking_transaction b
        WHERE b.booking_date::DATE = search_value::DATE;

    -- Case 8: Admin - Filter by user ID
    ELSIF admin_status = TRUE AND action_type = 'user_id' AND search_value ~ '^[0-9]+$' THEN
        RETURN QUERY
        SELECT b.booking_id, b.booking_date::DATE, b.check_in_date, b.check_out_date, b.duration, b.user_id, b.hotel_id, b.room_id
        FROM booking_transaction b
        WHERE b.user_id = search_value::INT;

    -- Case 9: Admin - Filter by hotel ID
    ELSIF admin_status = TRUE AND action_type = 'hotel_id' AND search_value ~ '^[0-9]+$' THEN
        RETURN QUERY
        SELECT b.booking_id, b.booking_date::DATE, b.check_in_date, b.check_out_date, b.duration, b.user_id, b.hotel_id, b.room_id
        FROM booking_transaction b
        WHERE b.hotel_id = search_value::INT;

    -- Case 10: Admin - Filter by room ID
    ELSIF admin_status = TRUE AND action_type = 'room_id' AND search_value ~ '^[0-9]+$' THEN
        RETURN QUERY
        SELECT b.booking_id, b.booking_date::DATE, b.check_in_date, b.check_out_date, b.duration, b.user_id, b.hotel_id, b.room_id
        FROM booking_transaction b
        WHERE b.room_id = search_value::INT;

    ELSE
        RAISE EXCEPTION 'Invalid action type or search value: % - %', action_type, search_value;
    END IF;
END;
$$