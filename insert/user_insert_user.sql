create or replace procedure insert_user(
    p_device_type varchar(32),
    p_officer_id int, 
    p_admin_name varchar(64),
    p_admin_password varchar(64),
    p_telephone_number varchar(10),
    p_user_name varchar(64),
    p_user_password varchar(64),
    p_user_email varchar(64),
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
    insert into usert(user_id, device_type)
        values (new_user_id, p_device_type);
    case p_user_type
        when 'admin' then
            insert into admin (user_id, officer_id, admin_name, admin_password, telephone_number)
            values (new_user_id, p_officer_id, p_admin_name, p_admin_password, p_telephone_number);
        when 'unregisterred_user' then
            insert into unregisterred_user (user_id)
            values (new_user_id);
        when 'registerred_user' then
            insert into registerred_user (user_id, user_name, user_password, user_email, telephone_number, register_date, birth_date) 
            values (new_user_id, p_user_name, p_user_password, p_user_email, p_telephone_number, p_register_date, p_birth_date);
        else
            raise exception 'Invalid user type: %', p_user_type;
    end case;
end; $$