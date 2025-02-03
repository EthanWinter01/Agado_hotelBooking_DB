-- Insert an admin user (Thai name)
call insert_user(
    'mobile',            -- Device type
    104,                 -- Officer ID
    'Pattarapol Suwan',  -- Thai admin name in English-friendly format
    'adminSecure789',    -- Admin password
    '0865554321',        -- Thai mobile number
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
    '0901234567',        -- Thai mobile number
    'NongTee_2025',      -- Popular Thai-style username
    'teenPass2025',      -- User password
    'nongtee2025@example.com', -- Email
    cast(now() as timestamp),  -- Registration date
    '2007-07-22',        -- Birthdate (Assumed teenager)
    'registerred_user'   -- User type
);

-- Insert an admin user (Thai name)
call insert_user(
    'mobile',            -- Device type
    105,                 -- Officer ID
    'Chaiwat Promrak',   -- Thai admin name in English-friendly format
    'adminStrong2025',   -- Admin password
    '0847896543',        -- Thai mobile number
    null,                -- No username for admin
    null,                -- No user password for admin
    null,                -- No email for admin
    null,                -- No register date for admin
    null,                -- No birth date for admin
    'admin'              -- User type
);

-- Insert a registered user (Thai teenager)
call insert_user(
    'mobile',            -- Device type
    null,                -- No officer ID
    null,                -- No admin name
    null,                -- No admin password
    '0866543210',        -- Thai mobile number
    'Pong_Khieo99',      -- Popular Thai-style username
    'securePass2025',    -- User password
    'pongkhieo99@example.com', -- Email
    cast(now() as timestamp),  -- Registration date
    '2006-11-30',        -- Birthdate (Assumed teenager)
    'registerred_user'   -- User type
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