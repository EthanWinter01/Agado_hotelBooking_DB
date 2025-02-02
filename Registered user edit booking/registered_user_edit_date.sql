create or replace function registered_user_edit_date(
    change_booking_id int,
    change_check_in date,
    change_check_out date
)
returns void
language plpgsql
as
$$
begin
    if change_check_in - change_check_out <= 3 then
        update booking_transaction
		set check_in_date = change_check_in, 
		check_out_date = change_check_out,
		duration = change_check_out - change_check_in
		where booking_id = change_booking_id;
    else
        raise notice 'It more than 3 night';
    end if;     
end;
$$    