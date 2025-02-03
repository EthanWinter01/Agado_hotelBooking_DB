create or replace procedure user_edit_date(
    change_booking_id int,
    change_check_in date,
    change_check_out date,
    user_id_edit int
)
language plpgsql
as
$$
begin
    if change_check_in > change_check_out then
        raise notice 'check in time must come before check out time';
        
    elsif change_check_out - change_check_in <= 3 then
        update booking_transaction
		set check_in_date = change_check_in, 
		check_out_date = change_check_out,
		duration = change_check_out - change_check_in
		where booking_id = change_booking_id

        if user_id_edit >= 900000000 then
            insert into manages_booking(user_id, booking_id, edit_timestamp)
            VALUES (user_id_edit, change_booking_id, cast(now() as timestamp));
        end if;

    else
        raise notice 'It more than 3 night';
    end if;
	commit;
end;
$$    