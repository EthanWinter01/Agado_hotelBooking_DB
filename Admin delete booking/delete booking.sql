create or replace procedure admin_delete_booking(
delete_booking_id int
)
language plpgsql
as $$
begin 
	delete from manages_booking where booking_id = delete_booking_id;
	delete from booking_transaction where booking_id = delete_booking_id;
end;$$
