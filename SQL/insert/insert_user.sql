CREATE OR REPLACE PROCEDURE insert_user(
    p_device_type VARCHAR(32),
    p_officer_id INT, 
    p_name VARCHAR(64),
    p_passwORd VARCHAR(64),
    p_telephone_number VARCHAR(10),
    p_email VARCHAR(64),
    p_register_date TIMESTAMP,
    p_birth_date DATE,
    p_user_type VARCHAR(32)  
)
LANGUAGE plpgsql 
AS $$ 
DECLARE 
    new_user_id INT;
BEGIN
    new_user_id := util_gen_user_id(p_user_type);

    IF p_user_type = 'registerred_user' THEN
        IF EXISTS (SELECT 1 FROM registerred_user WHERE user_email = p_email) THEN
            RAISE EXCEPTION 'Email already in use: %', p_email; 
        END IF;
    ELSIF p_user_type = 'admin' THEN 
        IF EXISTS (SELECT 1 FROM admin WHERE admin_email = p_email) THEN
            RAISE EXCEPTION 'Email already in use: %', p_email; 
        END IF;
    END IF;

    INSERT INTO usert(user_id, device_type)
        VALUES (new_user_id, p_device_type);

    CASE p_user_type
        WHEN 'admin' THEN
            INSERT INTO admin (user_id, officer_id, admin_name, admin_passwORd, telephone_number, admin_email)
                VALUES (new_user_id, p_officer_id, p_name, p_passwORd, p_telephone_number, p_email); 
        WHEN 'unregisterred_user' THEN
            INSERT INTO unregisterred_user (user_id)
                VALUES (new_user_id);
        WHEN 'registerred_user' THEN
            INSERT INTO registerred_user (user_id, user_name, user_passwORd, user_email, telephone_number, register_date, birth_date) 
                VALUES (new_user_id, p_name, p_passwORd, p_email, p_telephone_number, p_register_date, p_birth_date);
        ELSE
            RAISE EXCEPTION 'Invalid user type: %', p_user_type;
    END CASE;
END; $$;
