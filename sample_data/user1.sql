-- Insert an admin user (Thai name)
call insert_user(
    'mobile',            -- Device type
    110,                 -- Officer ID
    'Phuchit Pimpichai', -- Thai admin name in English-friendly format
    'adminPass2025',     -- Admin password
    '0831234567',        -- Thai mobile number
    null,                -- No username for admin
    null,                -- No user password for admin
    null,                -- No email for admin
    null,                -- No register date for admin
    null,                -- No birth date for admin
    'admin'              -- User type
);

call insert_user(
    'mobile',            -- Device type
    111,                 -- Officer ID
    'Chaiwat Chitpatima',-- Thai admin name in English-friendly format
    'secureAdmin123',    -- Admin password
    '0876543210',        -- Thai mobile number
    null,                -- No username for admin
    null,                -- No user password for admin
    null,                -- No email for admin
    null,                -- No register date for admin
    null,                -- No birth date for admin
    'admin'              -- User type
);

call insert_user(
    'mobile',            -- Device type
    112,                 -- Officer ID
    'Surasak Wongdee',   -- Thai admin name in English-friendly format
    'admin#Secure2025',  -- Admin password
    '0859876543',        -- Thai mobile number
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
    '0897654321',        -- Thai mobile number
    'Niwat Kittikhun',   -- Popular Thai-style username (first name + last name)
    'securePass2025',    -- User password
    'niwat_kittikhun@example.com', -- Email
    cast(now() as timestamp),  -- Registration date
    '2007-02-14',        -- Birthdate (Assumed teenager)
    'registerred_user'   -- User type
);

call insert_user(
    'mobile',            -- Device type
    null,                -- No officer ID
    null,                -- No admin name
    null,                -- No admin password
    '0886543210',        -- Thai mobile number
    'Thanakorn Phongsak',-- Popular Thai-style username (first name + last name)
    'userPass2025',      -- User password
    'thanakorn_phongsak@example.com', -- Email
    cast(now() as timestamp),  -- Registration date
    '2006-08-19',        -- Birthdate (Assumed teenager)
    'registerred_user'   -- User type
);

call insert_user(
    'mobile',            -- Device type
    null,                -- No officer ID
    null,                -- No admin name
    null,                -- No admin password
    '0872345678',        -- Thai mobile number
    'Ratchapol Wongsa',  -- Popular Thai-style username (first name + last name)
    'ratchapol2025',     -- User password
    'ratchapol_wongsa@example.com', -- Email
    cast(now() as timestamp),  -- Registration date
    '2005-11-02',        -- Birthdate (Assumed teenager)
    'registerred_user'   -- User type
);
