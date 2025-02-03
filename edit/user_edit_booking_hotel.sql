create or replace procedure registered_user_edit_hotel(
    change_booking_id int,
    change_hotel_id int
)
language plpgsql
as
$$
begin 
    if exists (
        select 1
        from hotel
        where hotel_id = change_hotel_id 
    ) then
        update booking_transaction
        set preferred_hotel = change_hotel
        where change_booking_id = booking_id;
    else
        raise notice 'the hotel does not exist';
    end if;    
    commit;
end
$$