call insert_new_user(
    'desktop',            -- p_device_type
    null,                 -- p_officer_id (Not needed for unregistered users)
    null,                 -- p_admin_name (Not needed for unregistered users)
    null,                 -- p_admin_password (Not needed for unregistered users)
    5566778899,           -- p_telephone_number
    null,                 -- p_user_name (Not needed for unregistered users)
    null,                 -- p_user_password (Not needed for unregistered users)
    null,                 -- p_user_email (Not needed for unregistered users)
    null,                 -- p_register_date (Not needed for unregistered users)
    null,                 -- p_birth_date (Not needed for unregistered users)
    'unregisterred_user'  -- p_user_type
);

call insert_new_user(
    'tablet',            -- p_device_type
    null,                -- p_officer_id (Not needed for unregistered users)
    null,                -- p_admin_name (Not needed for unregistered users)
    null,                -- p_admin_password (Not needed for unregistered users)
    9876543210,          -- p_telephone_number
    null,                -- p_user_name (Not needed for unregistered users)
    null,                -- p_user_password (Not needed for unregistered users)
    null,                -- p_user_email (Not needed for unregistered users)
    null,                -- p_register_date (Not needed for unregistered users)
    null,                -- p_birth_date (Not needed for unregistered users)
    'unregisterred_user' -- p_user_type
);