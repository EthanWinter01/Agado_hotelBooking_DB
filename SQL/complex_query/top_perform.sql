SELECT 
    h.hotel_id, 
    h.hotel_location, 
    COUNT(DISTINCT bt.booking_id) AS total_bookings, 
FROM hotel h
LEFT JOIN booking_transaction bt ON h.hotel_id = bt.hotel_id
GROUP BY h.hotel_id, h.hotel_location
ORDER BY total_bookings DESC
LIMIT 10;