call insert_new_user(
    'mobile',            -- p_device_type
    null,                -- p_officer_id (Not needed for non-admin)
    null,                -- p_admin_name (Not needed for non-admin)
    null,                -- p_admin_password (Not needed for non-admin)
    null,                -- p_telephone_number (Not needed for non-admin)
    'John Doe',          -- p_user_name
    'password123',       -- p_user_password
    'johndoe@example.com', -- p_user_email
    '2025-02-02 10:00:00', -- p_register_date
    '1990-01-01',        -- p_birth_date
    'registerred_user'   -- p_user_type
);

call insert_new_user(
    'mobile',            -- p_device_type
    null,                -- p_officer_id (Not needed for non-admin)
    null,                -- p_admin_name (Not needed for non-admin)
    null,                -- p_admin_password (Not needed for non-admin)
    null,                -- p_telephone_number (Not needed for non-admin)
    'Jane Doe',          -- p_user_name
    'password1234',      -- p_user_password
    'janedoe@example.com', -- p_user_email
    '2025-02-02 10:05:00', -- p_register_date
    '1990-12-01',        -- p_birth_date
    'registerred_user'   -- p_user_type
);