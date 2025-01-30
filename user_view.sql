create or replace function user_view(view_id int)
    return table(
        hotel varchar,
        check_in_date date,
        check_out_date date,
        booking_date date
    ) 
language plpgsql
as
$$
begin
    return query
    select B.preferred_hotel, B.check_in_date, B.check_out_date, B.booking_date
    from booking_transaction B
    where B.user_id = view_id
    order by B.booking_date desc;
end;
$$    