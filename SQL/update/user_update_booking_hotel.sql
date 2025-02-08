CREATE OR REPLACE PROCEDURE user_edit_hotel(
    change_booking_id INT,
    change_hotel_id INT,
    user_id_edit INT
)
LANGUAGE PLPGSQL
AS
$$
DECLARE
    new_room_id INT;
BEGIN 
    -- first check if the user is not allow to edit
    IF NOT EXISTS (
        SELECT 1
        FROM ADMIN a, registerred_user r 
        WHERE a.user_id = user_id_edit OR r.user_id = user_id_edit
    ) THEN
        RAISE EXCEPTION 'there are no user id %', user_id_edit;
    
    ELSE 
    -- if user are allow to edit which are admin or register user
    --do the following
    --find the minimum room id that available in that hotel
        SELECT min(room_id) 
        INTO new_room_id
        FROM hotel h
        JOIN room r ON h.hotel_id = r.hotel_id
        WHERE h.hotel_id = change_hotel_id 
        AND r.status = true;

        -- if there is available room then
        IF new_room_id IS NOT NULL THEN
            -- change that booking transaction
            UPDATE booking_transaction
            SET hotel_id = change_hotel_id,
            room_id = new_room_id
            WHERE change_booking_id = booking_id;

            -- then update that room to false
            UPDATE room
            SET STATUS = false
            WHERE room_id = new_room_id AND hotel_id = change_hotel_id;

            -- then insert log into manages_booking
            INSERT INTO manages_booking(user_id, booking_id, edit_timestamp)
            VALUES (user_id_edit, change_booking_id, cast(NOW() AS TIMESTAMP));

            RAISE NOTICE 'Hotel updated successfully.';

        ELSE
            RAISE EXCEPTION 'the hotel does not exist, or you prefer hotel does not have available room';
        END IF; 
    END IF;       
    COMMIT;
END
$$