--Case1
select * from admin_view_booking(False,null,'201')
--Case2
select * from admin_view_booking(True,'None','-')
--Case3
select * from admin_view_booking(True,'booking ID','1011')
--Case4
select * from admin_view_booking(True,'duration','2')
--Case5
select * from admin_view_booking(True,'check_in_date','2025-02-05')
--Case6
select * from admin_view_booking(True,'check_out_date','2025-02-07')
--Case7
select * from admin_view_booking(True,'booking_date','2025-02-01')
--Case8
select * from admin_view_booking(True,'user_id','500000001')
--Case9
select * from admin_view_booking(True,'hotel_id','1')
--Case10
select * from admin_view_booking(True,'room_id','201')