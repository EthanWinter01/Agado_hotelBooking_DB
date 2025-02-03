create or replace procedure Delete_Booking(
delete_id int,
deleter_id int
)
language plpgsql
as $$
begin
	if deleter_id >= 900000000 then
	update room 
	set status = true 
	where room_id = (select room_id from booking_transaction where booking_id = delete_id) 
	and hotel_id = (select hotel_id from booking_transaction where booking_id = delete_id);

	delete from manages_booking 
	where booking_id = delete_id;
	
	delete from booking_transaction 
	where booking_id = delete_id;
	elseif deleter_id = (select user_id from booking_transaction where booking_id = delete_id ) then
		update room 
		set status = true 
		where room_id = (select room_id from booking_transaction where booking_id = delete_id) 
		and hotel_id = (select hotel_id from booking_transaction where booking_id = delete_id);
	
		delete from manages_booking 
		where booking_id = delete_id;
		
		delete from booking_transaction 
		where booking_id = delete_id;
	else raise exception 'Deleter try to delete other user booking';
	end if;
end;$$