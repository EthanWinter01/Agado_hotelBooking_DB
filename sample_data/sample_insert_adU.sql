call insert_new_user(
    'mobile',            -- p_device_type
    101,                 -- p_officer_id (Admin-specific)
    'Admin User',        -- p_admin_name
    'securepassword',    -- p_admin_password
    1234567890,          -- p_telephone_number
    null,                -- p_user_name (Not needed for non-registered users)
    null,                -- p_user_password (Not needed for non-registered users)
    null,                -- p_user_email (Not needed for non-registered users)
    null,                -- p_register_date (Not needed for non-registered users)
    null,                -- p_birth_date (Not needed for non-registered users)
    'admin'              -- p_user_type
);

call insert_new_user(
    'desktop',            -- p_device_type
    200,                  -- p_officer_id (Admin-specific)
    'SuperAdmin',         -- p_admin_name
    'supersecurepass',    -- p_admin_password
    1122334455,           -- p_telephone_number
    null,                 -- p_user_name (Not needed for admin users)
    null,                 -- p_user_password (Not needed for admin users)
    null,                 -- p_user_email (Not needed for admin users)
    null,                 -- p_register_date (Not needed for admin users)
    null,                 -- p_birth_date (Not needed for admin users)
    'admin'               -- p_user_type
);
