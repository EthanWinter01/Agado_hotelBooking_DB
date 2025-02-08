CREATE OR REPLACE FUNCTION util_gen_user_id(
    user_type VARCHAR
)
RETURNS INT 
LANGUAGE plpgsql
AS $$
DECLARE 
    new_user_id INT;
    base_id INT;
BEGIN 
    CASE user_type 
        WHEN 'admin' THEN base_id := 900000000;
        WHEN 'registerred_user' THEN base_id := 500000000;
        WHEN 'unregisterred_user' THEN base_id := 100000000;
        ELSE 
            RAISE EXCEPTION 'Invalid user type: %', user_type;
    END CASE;
    EXECUTE FORMAT('SELECT COALESCE(MAX(user_id) - %s, 0) + %s + 1 FROM %I', base_id, base_id, user_type)
        INTO new_user_id;
    RETURN new_user_id;
END; $$