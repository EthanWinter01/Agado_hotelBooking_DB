create or replace procedure admin_edit_hotel_booking(
 change_booking_id int,
 change_hotel varchar)
 language plpgsql
 as $$
 begin
 	update booking_transaction
	set preferred_hotel = change_hotel
	where booking_id = change_booking_id;
 end;$$
