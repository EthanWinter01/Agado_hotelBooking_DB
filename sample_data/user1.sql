-- Insert an admin user (Thai name)
call insert_user(
    'mobile',            -- Device type
    101,                 -- Officer ID
    'Prawit Chankaeo',   -- Thai admin name in English-friendly format
    'secureAdmin123',    -- Admin password
    '0891234567',          -- Thai mobile number
    null,                -- No username for admin
    null,                -- No user password for admin
    null,                -- No email for admin
    null,                -- No register date for admin
    null,                -- No birth date for admin
    'admin'              -- User type
);

-- Insert an unregistered user (no personal info)
call insert_user(
    'mobile',            -- Device type
    null,                -- No officer ID for unregistered user
    null,                -- No admin name
    null,                -- No admin password
    null,                -- No telephone number
    null,                -- No username
    null,                -- No user password
    null,                -- No email
    null,                -- No register date
    null,                -- No birth date
    'unregisterred_user' -- User type
);

-- Insert a registered user (Thai teenager)
call insert_user(
    'mobile',            -- Device type
    null,                -- No officer ID
    null,                -- No admin name
    null,                -- No admin password
    '0812345678',        -- Thai mobile number
    'Nonkub_zaa99',      -- Popular Thai-style username
    'securePass123',     -- User password
    'nonkubzaa99@example.com', -- Email
    cast(now() as timestamp),  -- Registration date
    '2008-05-15',        -- Birthdate (Assumed teenager)
    'registerred_user'   -- User type
);