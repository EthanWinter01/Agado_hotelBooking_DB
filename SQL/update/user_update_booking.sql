CREATE OR REPLACE PROCEDURE user_edit_date(
    booking_id_update INT,
    update_check_in DATE,
    update_check_out DATE,
    user_id_update INT,
    description VARCHAR(256) DEFAULT NULL;
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

            -- insert log into booking_log
            INSERT INTO booking_log(user_id, booking_id, action_type, action_timestamp, action_description) 
            VALUES (
                user_id_update,
                booking_id_update,
                'user_update_booking',
                cast(NOW() AS TIMESTAMP),
                description
            )

            RAISE NOTICE 'change date successfully';

        ELSE
            RAISE EXCEPTION 'It more than 3 night';
        END IF;
    END IF;    
END;
$$    