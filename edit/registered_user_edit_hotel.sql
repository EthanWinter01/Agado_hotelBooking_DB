create or replace procedure registered_user_edit_hotel(
    change_booking_id int,
    change_hotel varchar
)
language plpgsql
as
$$
declare
    to_hotel varchar := change_hotel;
begin 
    if exists (
        select 1
        from hotel
        where change_hotel = hotel_name -- doesn't have hotel_name in hotel table
    ) then
        update booking_transaction
        set preferred_hotel = change_hotel
        where change_booking_id = booking_id;
    else
        raise notice '% does not exist', to_hotel;
    end if;    
    commit;
end
$$