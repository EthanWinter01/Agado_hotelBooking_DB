create or replace procedure insert_user(
    p_device_type varchar(32),
    p_officer_id int, 
    p_name varchar(64),
    p_password varchar(64),
    p_telephone_number varchar(10),
    p_email varchar(64),
    p_register_date timestamp,
    p_birth_date date,
    p_user_type varchar(32)  
)
language plpgsql 
as $$
declare 
    new_user_id int;
begin
    new_user_id := util_gen_user_id(p_user_type);
    
    -- Ensure unique email for registered users
    if p_user_type = 'registerred_user' then
        if exists(select 1 from registerred_user where user_email = p_email) then
            raise exception 'Email already in use: %', p_email;  -- Consistent variable name
        end if;
    elsif p_user_type = 'admin' then  -- Use 'elsif' instead of 'else if'
        if exists(select 1 from admin where admin_email = p_email) then
            raise exception 'Email already in use: %', p_email;  -- Consistent variable name
        end if;
    end if;
    
    insert into usert(user_id, device_type)
        values (new_user_id, p_device_type);
        
    case p_user_type
        when 'admin' then
            insert into admin (user_id, officer_id, admin_name, admin_password, telephone_number, admin_email)
            values (new_user_id, p_officer_id, p_name, p_password, p_telephone_number, p_email); 
        when 'unregisterred_user' then
            insert into unregisterred_user (user_id)
            values (new_user_id);
        when 'registerred_user' then
            insert into registerred_user (user_id, user_name, user_password, user_email, telephone_number, register_date, birth_date) 
            values (new_user_id, p_name, p_password, p_email, p_telephone_number, p_register_date, p_birth_date);
        else
            raise exception 'Invalid user type: %', p_user_type;
    end case;
end; $$;
