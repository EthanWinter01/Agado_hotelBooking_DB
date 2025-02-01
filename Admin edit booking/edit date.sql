create or replace procedure admin_edit_check_date_booking(
change_booking_id int,
change_check_in date,
change_check_out date
)
language plpgsql
as $$
begin
	if (change_check_out - change_check_in) <= 4
	then
		update booking_transaction
		set check_in_date = change_check_in, 
		check_out_date = change_check_out,
		duration = change_check_out::date - change_check_in::date
		where booking_id = change_booking_id;
	else
		raise notice 'It more than 3 night';
	end if;
end;$$