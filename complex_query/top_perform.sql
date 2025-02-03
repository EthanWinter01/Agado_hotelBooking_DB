SELECT 
    h.hotel_id, 
    h.hotel_location, 
    COUNT(bt.booking_id) AS total_bookings,
    ROUND(AVG(CAST((bt.check_out_date - bt.check_in_date) AS FLOAT))) AS avg_stay_duration,
    ROUND(SUM(r.max_price - r.min_price) / COUNT(bt.booking_id), 2) AS avg_booking_amount,
    COUNT(DISTINCT vhi.user_id) AS unique_visitors,
    COUNT(eoi.edit_timestamp) AS admin_edits
FROM hotel h
LEFT JOIN booking_transaction bt ON h.hotel_id = bt.hotel_id
LEFT JOIN room r ON h.hotel_id = r.hotel_id
LEFT JOIN view_hotel_info vhi ON h.hotel_id = vhi.hotel_id
LEFT JOIN edit_overall_info eoi ON h.hotel_id = eoi.hotel_id
GROUP BY h.hotel_id, h.hotel_location
ORDER BY total_bookings DESC
LIMIT 10;