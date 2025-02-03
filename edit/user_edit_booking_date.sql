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
    IF change_check_in > change_check_out THEN
        raise notice 'check in time must come before check out time';

    ELSIF change_check_out - change_check_in <= 3 THEN
        UPDATE booking_transaction
		SET check_in_date = change_check_in, 
		check_out_date = change_check_out,
		duration = change_check_out - change_check_in
		WHERE booking_id = change_booking_id

        IF user_id_edit >= 900000000 THEN
            INSERT INTO manages_booking(user_id, booking_id, edit_timestamp)
            VALUES (user_id_edit, change_booking_id, cast(NOW() AS TIMESTAMP));
        END IF;

    ELSE
        RAISE NOTICE 'It more than 3 night';
    END IF;
	COMMIT;
END;
$$    