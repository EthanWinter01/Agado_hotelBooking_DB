create or replace procedure user_edit_hotel(
    change_booking_id int,
    change_hotel_id int,
    user_id_edit int
)
language plpgsql
as
$$
declare
    new_room_id int;
begin 
    select min(room_id) 
    into new_room_id
    from hotel h
    join room r on h.hotel_id = r.hotel_id
    where h.hotel_id = change_hotel_id 
    and r.status = true;

    if new_room_id is not null then
        update booking_transaction
        set hotel_id = change_hotel_id,
        room_id = new_room_id
        where change_booking_id = booking_id;

        update room
        set status = false
        where room_id = new_room_id and hotel_id = change_hotel_id;

        if user_id_edit >= 900000000 then
            insert into manages_booking(user_id, booking_id, edit_timestamp)
            VALUES (user_id_edit, change_booking_id, cast(now() as timestamp));
        end if;    

        raise notice 'Hotel updated successfully.';

    else
        raise notice 'the hotel does not exist';
    end if;    
    commit;
end
$$