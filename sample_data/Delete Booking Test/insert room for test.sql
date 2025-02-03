INSERT INTO room (hotel_id, room_id, min_price, max_price, status, room_type) VALUES
-- Hotel 1
(1, 101, 1000, 1500, TRUE, 'Standard'),
(1, 102, 1200, 1800, TRUE, 'Deluxe'),
(1, 103, 1500, 2200, FALSE, 'Suite'),
(1, 104, 2000, 3000, TRUE, 'Family'),
(1, 105, 2500, 3500, FALSE, 'Penthouse'),

-- Hotel 2
(2, 201, 800, 1300, TRUE, 'Standard'),
(2, 202, 1100, 1600, FALSE, 'Deluxe'),
(2, 203, 1400, 2000, TRUE, 'Suite'),
(2, 204, 1900, 2700, TRUE, 'Family'),
(2, 205, 2300, 3200, FALSE, 'Penthouse'),

-- Hotel 3
(3, 301, 900, 1400, TRUE, 'Standard'),
(3, 302, 1150, 1700, TRUE, 'Deluxe'),
(3, 303, 1550, 2300, FALSE, 'Suite'),
(3, 304, 2100, 2900, TRUE, 'Family'),
(3, 305, 2600, 3600, TRUE, 'Penthouse'),

-- Hotel 4
(4, 401, 950, 1450, FALSE, 'Standard'),
(4, 402, 1250, 1750, TRUE, 'Deluxe'),
(4, 403, 1600, 2400, TRUE, 'Suite'),
(4, 404, 2200, 3100, FALSE, 'Family'),
(4, 405, 2700, 3700, TRUE, 'Penthouse'),

-- Hotel 5
(5, 501, 1050, 1550, TRUE, 'Standard'),
(5, 502, 1300, 1900, FALSE, 'Deluxe'),
(5, 503, 1650, 2500, TRUE, 'Suite'),
(5, 504, 2300, 3200, TRUE, 'Family'),
(5, 505, 2800, 3800, FALSE, 'Penthouse')

-- Same room in diff hotel
(1, 201, 1000, 1500, TRUE, 'Standard');
