CREATE OR REPLACE PROCEDURE book(
    book_check_in_date DATE,
    book_check_out_date DATE,
    book_user_id INT,
    book_hotel_id INT,
    book_room_id INT,
    book_description VARCHAR(256) DEFAULT NULL
) 
LANGUAGE plpgsql
AS $$ 
DECLARE
    new_booking_id INT;
    duration INT;
    room_available BOOLEAN;
BEGIN
    new_booking_id = util_gen_booking_id();
    duration = book_check_out_date - book_check_in_date;

    -- If booking exceeds 3 nights, reject
    IF duration > 3 THEN 
        RAISE EXCEPTION 'Booking denied: More than 3 nights. Duration: %', duration;

    -- If room is already booked for the requested dates
    ELSIF EXISTS (
        SELECT *
        FROM booking_transaction b
        WHERE b.room_id = book_room_id 
          AND b.hotel_id = book_hotel_id 
          AND (b.check_in_date, b.check_out_date) 
              OVERLAPS (book_check_in_date, book_check_out_date)
    ) THEN 
        RAISE EXCEPTION 'Room is already booked for the requested dates.';

    -- Check if room is available
    ELSE
        -- SELECT status INTO room_available
        -- FROM room 
        -- WHERE room_id = book_room_id AND hotel_id = book_hotel_id;
        
        -- IF NOT room_available THEN 
        --     RAISE EXCEPTION 'Room ID % in Hotel ID % is not available.', book_room_id, book_hotel_id;
        -- END IF;

        -- Add booking_transaction
        INSERT INTO booking_transaction (booking_id, booking_date, duration, check_in_date, check_out_date, user_id, hotel_id, room_id)
        VALUES (new_booking_id, NOW(), duration, book_check_in_date, book_check_out_date, book_user_id, book_hotel_id, book_room_id);

        -- Update room status to false (only if it was available before)
        UPDATE room 
        SET status = FALSE 
        WHERE room_id = book_room_id AND hotel_id = book_hotel_id AND status = TRUE;

        -- Add log
        INSERT INTO booking_log (booking_id, user_id, action_timestamp, action_type, action_description)
        VALUES (
            new_booking_id, 
            book_user_id, 
            CAST(NOW() AS TIMESTAMP), 
            'user_insert_book',
            book_description 
        );
    END IF;    
END; $$;


