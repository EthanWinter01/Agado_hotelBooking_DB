-- คนลบไม่ใช่คนเดียวกับคนจอง
CALL Delete_Booking(1002,500000001);

-- คนลบคนเดียวกับคนจอง
CALL Delete_Booking(1001,500000001);

CALL Delete_Booking(1002,500000002);

-- admin เป็นคนลบ
CALL Delete_Booking(1003,900000001);