-- กรณีที่ 1: อัปเดตเฉพาะ map_url และเบอร์โทรศัพท์ของโรงแรม ID 10000
CALL update_hotel_overall_info(900000001, 10000, 'http://newexample.com/hotel1', NULL, NULL, NULL, NULL, NULL, NULL, '0999999999');

-- กรณีที่ 2: อัปเดต check-in, check-out และที่อยู่ของโรงแรม ID 10002
CALL update_hotel_overall_info(900000002, 10002, NULL, 'Updated Beachfront Resort', '16:00:00', '10:30:00');

-- กรณีที่ 3: อัปเดตสิ่งอำนวยความสะดวกโรงแรม ID 10004
CALL update_hotel_overall_info(900000003, 10004, NULL, NULL, NULL, NULL, 'Available', 'Not Available', 'Available');

-- กรณีที่ 4: อัปเดตทุกค่าในโรงแรม ID 10007
CALL update_hotel_overall_info(900000004, 10007, 'http://updated.com/max3', 'Updated Ultimate Tower', '14:00:00', '11:45:00', 'Yes', 'Yes', 'No', '0888888888');

-- กรณีที่ 5: อัปเดตเฉพาะ check-out time ของโรงแรม ID 10009
CALL update_hotel_overall_info(900000005, 10009, NULL, NULL, NULL, '12:00:00');
