-- Insert an admin user (Thai name)
call insert_user(
    'mobile',            -- Device type
    102,                 -- Officer ID
    'Somsak Rattana',    -- Thai admin name in English-friendly format
    'adminSecure456',    -- Admin password
    '0876543210',        -- Thai mobile number
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
    '0898765432',        -- Thai mobile number
    'Krit_kaiz99',       -- Popular Thai-style username
    'kRiteSecure#99',    -- User password
    'kritkaiz99@example.com', -- Email
    cast(now() as timestamp),  -- Registration date
    '2007-11-25',        -- Birthdate (Assumed teenager)
    'registerred_user'   -- User type
);

-- Insert an admin user (Thai name)
call insert_user(
    'mobile',            -- Device type
    103,                 -- Officer ID
    'Nattawut Kaewphet', -- Thai admin name in English-friendly format
    'admin1234Strong',   -- Admin password
    '0859988776',        -- Thai mobile number
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
    '0823456789',        -- Thai mobile number
    'TonTon_24',         -- Popular Thai-style username
    'superSecureTon24',  -- User password
    'tonton24@example.com', -- Email
    cast(now() as timestamp),  -- Registration date
    '2006-02-10',        -- Birthdate (Assumed teenager)
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