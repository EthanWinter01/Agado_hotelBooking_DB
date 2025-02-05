create or replace function util_gen_user_id(
    user_type varchar
)
returns int 
language plpgsql
as $$
declare 
    new_user_id int;
    base_id int;
begin 
    case user_type 
        when 'admin' then base_id := 900000000;
        when 'registerred_user' then base_id := 500000000;
        when 'unregisterred_user' then base_id := 100000000;
        else 
            raise exception 'Invalid user type: %', user_type;
    end case;
    execute format('select coalesce(max(user_id) - %s, 0) + %s + 1 from %I', base_id, base_id, user_type)
    into new_user_id;
    return new_user_id;
end; $$