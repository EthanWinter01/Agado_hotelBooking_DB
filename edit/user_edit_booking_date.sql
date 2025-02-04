CREATE OR REPLACE PROCEDURE user_edit_date(
    change_booking_id INT,
    change_check_in DATE,
    change_check_out DATE,
    user_id_edit INT
)
LANGUAGE PLPGSQL
AS
$$
BEGIN
    -- first check if the user is not allow to edit
    IF NOT EXISTS (
        SELECT 1
        FROM admin a, registerred_user r 
        WHERE a.user_id = user_id_edit OR r.user_id = user_id_edit
    ) THEN
        RAISE EXCEPTION 'there are no user id %', user_id_edit;
    
    ELSE
    -- if user are allow to edit which are admin or register user
    -- do the following   
    -- check that check in time must come before check out time  
        IF change_check_in > change_check_out THEN
            RAISE EXCEPTION 'check in time must come before check out time';

        ELSIF change_check_out - change_check_in <= 3 THEN -- check that duration must within 3 nights
            -- update that booking transaction
            UPDATE booking_transaction
            SET check_in_date = change_check_in, 
            check_out_date = change_check_out,
            duration = change_check_out - change_check_in
            WHERE booking_id = change_booking_id;

            -- insert log into manages_booking
            INSERT INTO manages_booking(user_id, booking_id, edit_timestamp)
            VALUES (user_id_edit, change_booking_id, cast(NOW() AS TIMESTAMP));

            RAISE NOTICE 'change date successfully';

        ELSE
            RAISE EXCEPTION 'It more than 3 night';
        END IF;
    END IF;    
END;
$$    