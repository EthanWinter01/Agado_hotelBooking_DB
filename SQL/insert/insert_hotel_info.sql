CREATE OR REPLACE PROCEDURE insert_hotel_overall_info(
    -- admin_id INT,
    map_url VARCHAR DEFAULT NULL,
    hotel_location VARCHAR(256) DEFAULT NULL,
    check_in TIME DEFAULT NULL,
    check_out TIME DEFAULT NULL,
    wifi VARCHAR(256) DEFAULT NULL,
    pool VARCHAR(256) DEFAULT NULL,
    valet_parking VARCHAR(256) DEFAULT NULL,
    hotel_number VARCHAR(10) DEFAULT NULL,
    num_floors INT DEFAULT 5,      -- จำนวนชั้นของโรงแรม (ไม่นับชั้น 1)
    num_rooms_per_floor INT DEFAULT 20, -- จำนวนห้องต่อชั้น (เท่ากันทุกชั้น)
    min1 INT DEFAULT 500,          -- ราคาขั้นต่ำของห้องราคาถูก
    max1 INT DEFAULT 1000,         -- ราคาสูงสุดของห้องราคาถูก
    min2 INT DEFAULT 1500,         -- ราคาขั้นต่ำของห้องระดับกลาง
    max2 INT DEFAULT 2000,         -- ราคาสูงสุดของห้องระดับกลาง
    min3 INT DEFAULT 2500,         -- ราคาขั้นต่ำของห้องราคาแพง
    max3 INT DEFAULT 3000,         -- ราคาสูงสุดของห้องราคาแพง
    c1 INT DEFAULT 2,              -- ชั้นแรกที่เป็นห้องราคาถูก
    c2 INT DEFAULT 5,              -- ชั้นแรกที่เป็นห้องระดับกลาง
    c3 INT DEFAULT 8,              -- ชั้นแรกที่เป็นห้องราคาแพง
    insert_description VARCHAR(256) DEFAULT NULL 
) AS $$
DECLARE
    is_admin INT;
    hotel_id INT;
    floor INT;
    room_id INT;
    room_price_min INT;
    room_price_max INT;
    room_type VARCHAR(64);
BEGIN
    -- ตรวจสอบสิทธิ์แอดมิน
    -- SELECT COUNT(*) INTO is_admin FROM admin WHERE user_id = admin_id;
    -- IF is_admin = 0 THEN
    --     RAISE EXCEPTION 'Permission denied: Only admins can add hotels';
    -- END IF;

    -- สร้าง hotel_id ใหม่
    hotel_id := util_gen_hotel_id();

    -- เพิ่มข้อมูลโรงแรม
    INSERT INTO hotel(hotel_id, map_url, hotel_location, check_in_time, check_out_time, hotel_phonenumber)
    VALUES (hotel_id, map_url, hotel_location, check_in, check_out, hotel_number);

    -- เพิ่มข้อมูลสิ่งอำนวยความสะดวกของโรงแรม
    INSERT INTO hotel_facilities(hotel_id, wifi, pool, valet_parking)
    VALUES (hotel_id, wifi, pool, valet_parking);

    -- ตรวจสอบค่าพารามิเตอร์ว่าอยู่ในช่วงที่ถูกต้องหรือไม่
    IF c1 < 2 OR c2 <= c1 OR c3 <= c2 OR c3 > (1 + num_floors) THEN
        RAISE EXCEPTION 'Invalid floor range: c1=%, c2=%, c3=% (Must be: 2 ≤ c1 < c2 < c3 ≤ num_floors + 1)', c1, c2, c3;
    END IF;

    -- สร้างห้องพักตามชั้นและจำนวนห้องที่กำหนด
    FOR floor IN 2..(1 + num_floors) LOOP
        -- กำหนดราคาห้องพักตามช่วงของชั้น
        IF floor >= c1 AND floor < c2 THEN
            room_price_min := min1;
            room_price_max := max1;
            room_type := 'Cheap';
        ELSIF floor >= c2 AND floor < c3 THEN
            room_price_min := min2;
            room_price_max := max2;
            room_type := 'Medium';
        ELSE
            room_price_min := min3;
            room_price_max := max3;
            room_type := 'Expensive';
        END IF;

        -- วนลูปสร้างห้องภายในชั้น
        FOR room_id IN 1..num_rooms_per_floor LOOP
            CALL add_room(hotel_id, floor, (floor * 100) + room_id, room_type, room_price_min, room_price_max);
        END LOOP;
    END LOOP;

    -- บันทึกข้อมูลว่าแอดมินเป็นผู้เพิ่มโรงแรมนี้
    INSERT INTO hotel_info (hotel_id, user_id, action_timestamp, action_type, action_description) 
        VALUES (
            hotel_id, 
            admin_id,
            CAST(NOW() AS TIMESTAMP),
            'admin_insert_hotel',
            insert_description
        );

    -- แจ้งให้ทราบว่าเพิ่มโรงแรมสำเร็จ
    RAISE NOTICE 'Hotel added successfully with ID: %', hotel_id;
END;
$$ LANGUAGE plpgsql;