create or replace procedure insert_new_user(
    p_device_type varchar(32),
    p_officer_id int, 
    p_admin_name varchar(64),
    p_admin_password varchar(64),
    p_telephone_number int,
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
    admin_id_init constant int := 90000000;
    regU_id_init constant int := 50000000;
    unRegU_id_init constant int := 10000000;
begin
    if p_user_type = 'admin' then 
        select max(user_id-admin_id_init, 0) + admin_id_init + 1
            into new_user_id
            from admin;
        insert into usert (user_id, device_type)
            values (new_user_id, p_device_type);
        insert into admin (user_id, officer_id, admin_name, admin_password, telephone_number)
            values (new_user_id, p_officer_id, p_admin_name, p_admin_password, p_telephone_number);

    elseif p_user_type = 'unregisterred_user' then
        select max(user_id-unRegU_id_init, 0) + unRegU_id_init + 1
            into new_user_id
            from unregisterred_user;
        insert into usert (user_id, device_type)
            values (new_user_id, p_device_type);
        insert into unregisterred_user (user_id)
            values (new_user_id);

    elseif p_user_type = 'registerred_user' then
        select max(user_id-regU_id_init, 0) + regU_id_init + 1
            into new_user_id
            from registerred_user;
        insert into usert (user_id, device_type)
            values (new_user_id, p_device_type);
        insert into registerred_user (user_id,  user_name, user_password, user_email, telephone_number, register_date, birth_date) 
            values (new_user_id, p_user_name, p_user_password, p_user_email, p_telephone_number, p_register_date, p_birth_date);
    
    else 
        raise exception 'Invalid user type: %', p_user_type;
    end if;
end; $$