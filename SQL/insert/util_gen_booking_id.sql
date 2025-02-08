CREATE OR REPLACE FUNCTION util_gen_booking_id()
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE 
    new_booking_id INT;
    base_id INT := 100000000;
BEGIN
    EXECUTE FORMAT('SELECT COALESCE(MAX(booking_id) - %s, 0) + %s + 1 FROM booking_transaction', base_id, base_id)
        INTO new_booking_id;
    RETURN new_booking_id;
END; $$