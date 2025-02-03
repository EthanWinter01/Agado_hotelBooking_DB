-- Insert admin users (Thai names)
call insert_user(
    'mobile',            -- Device type
    113,                 -- Officer ID
    'Pongpat Saensak',   -- Thai admin name in English-friendly format
    'adminPass2025',     -- Admin password
    '0812345678',        -- Thai mobile number
    null,                -- No username for admin
    null,                -- No user password for admin
    null,                -- No email for admin
    null,                -- No register date for admin
    null,                -- No birth date for admin
    'admin'              -- User type
);

call insert_user(
    'mobile',            -- Device type
    114,                 -- Officer ID
    'Kittipong Phaisarn',-- Thai admin name in English-friendly format
    'secureAdmin123',    -- Admin password
    '0823456789',        -- Thai mobile number
    null,                -- No username for admin
    null,                -- No user password for admin
    null,                -- No email for admin
    null,                -- No register date for admin
    null,                -- No birth date for admin
    'admin'              -- User type
);

call insert_user(
    'mobile',            -- Device type
    115,                 -- Officer ID
    'Rungnapha Poonprasert', -- Thai admin name in English-friendly format
    'admin@2025',        -- Admin password
    '0834567890',        -- Thai mobile number
    null,                -- No username for admin
    null,                -- No user password for admin
    null,                -- No email for admin
    null,                -- No register date for admin
    null,                -- No birth date for admin
    'admin'              -- User type
);

call insert_user(
    'mobile',            -- Device type
    116,                 -- Officer ID
    'Surapong Niamnoi',  -- Thai admin name in English-friendly format
    'adminPass#2025',    -- Admin password
    '0845678901',        -- Thai mobile number
    null,                -- No username for admin
    null,                -- No user password for admin
    null,                -- No email for admin
    null,                -- No register date for admin
    null,                -- No birth date for admin
    'admin'              -- User type
);

call insert_user(
    'mobile',            -- Device type
    117,                 -- Officer ID
    'Anusak Charoenrat', -- Thai admin name in English-friendly format
    'adminSecure123',    -- Admin password
    '0856789012',        -- Thai mobile number
    null,                -- No username for admin
    null,                -- No user password for admin
    null,                -- No email for admin
    null,                -- No register date for admin
    null,                -- No birth date for admin
    'admin'              -- User type
);

-- Insert unregistered users (no personal info)
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

-- Insert registered users (Thai teenagers)
call insert_user(
    'mobile',            -- Device type
    null,                -- No officer ID
    null,                -- No admin name
    null,                -- No admin password
    '0861234567',        -- Thai mobile number
    'Punnawat Kittinan', -- Popular Thai-style username (first name + last name)
    'punnawatSecure#97', -- User password
    'punnawat@example.com', -- Email
    cast(now() as timestamp),  -- Registration date
    '2007-03-14',        -- Birthdate (Assumed teenager)
    'registerred_user'   -- User type
);

call insert_user(
    'mobile',            -- Device type
    null,                -- No officer ID
    null,                -- No admin name
    null,                -- No admin password
    '0872345678',        -- Thai mobile number
    'Thanya Bunnag',     -- Popular Thai-style username (first name + last name)
    'secureThanya#2025', -- User password
    'thanya_bunnag@example.com', -- Email
    cast(now() as timestamp),  -- Registration date
    '2006-11-08',        -- Birthdate (Assumed teenager)
    'registerred_user'   -- User type
);

call insert_user(
    'mobile',            -- Device type
    null,                -- No officer ID
    null,                -- No admin name
    null,                -- No admin password
    '0885432109',        -- Thai mobile number
    'Napat Suttirak',    -- Popular Thai-style username (first name + last name)
    'secureNapat2025',   -- User password
    'napat_suttirak@example.com', -- Email
    cast(now() as timestamp),  -- Registration date
    '2008-04-25',        -- Birthdate (Assumed teenager)
    'registerred_user'   -- User type
);

call insert_user(
    'mobile',            -- Device type
    null,                -- No officer ID
    null,                -- No admin name
    null,                -- No admin password
    '0856543210',        -- Thai mobile number
    'Kittisak Lertphan', -- Popular Thai-style username (first name + last name)
    'kittenPass#2025',   -- User password
    'kittisak_lertphan@example.com', -- Email
    cast(now() as timestamp),  -- Registration date
    '2007-09-17',        -- Birthdate (Assumed teenager)
    'registerred_user'   -- User type
);

call insert_user(
    'mobile',            -- Device type
    null,                -- No officer ID
    null,                -- No admin name
    null,                -- No admin password
    '0849876543',        -- Thai mobile number
    'Pimchanok Phanlam', -- Popular Thai-style username (first name + last name)
    'pimchanok2025',     -- User password
    'pimchanok@example.com', -- Email
    cast(now() as timestamp),  -- Registration date
    '2006-01-11',        -- Birthdate (Assumed teenager)
    'registerred_user'   -- User type
);
