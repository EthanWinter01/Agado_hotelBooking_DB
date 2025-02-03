create or replace procedure Delete_Booking(
delete_id int
)
language plpgsql
as $$
begin
	update room 
	set status = true 
	where room_id = (select room_id from booking_transaction where booking_id = delete_id) 
	and hotel_id = (select hotel_id from booking_transaction where booking_id = delete_id);

	delete from manages_booking 
	where booking_id = delete_id;
	
	delete from booking_transaction 
	where booking_id = delete_id;
end;$$