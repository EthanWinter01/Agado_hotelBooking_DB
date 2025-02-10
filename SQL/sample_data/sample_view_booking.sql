--Case1
select * from view_booking(False,null,'100000021');
--Case2
select * from view_booking(True,'None','-');
--Case3
select * from view_booking(True,'booking ID','100000019');
--Case4
select * from view_booking(True,'duration','2');
--Case5
select * from view_booking(True,'check_in_date','2025-02-10');
--Case6
select * from view_booking(True,'check_out_date','2025-02-12');
--Case7
select * from view_booking(True,'booking_date','2025-02-09'); -- the date for test must be the day that we test insert_booking
--Case8
select * from view_booking(True,'user_id','500000002');
--Case9
select * from view_booking(True,'hotel_id','10001');
--Case10
select * from view_booking(True,'room_id','201');