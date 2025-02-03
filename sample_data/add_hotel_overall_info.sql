--Standard Hotel Setup
CALL add_hotel_overall_info(
    900000007, 
    'http://example.com/hotel1', 
    'Grand Palace Hotel', 
    '14:00', '12:00', 
    'Yes', 'Yes', 'Yes', '0812345678',
    8, 25,   
    800, 1500,  
    1800, 2500,  
    3000, 4000,  
    2, 5, 7     
);

--Minimal Input Value
CALL add_hotel_overall_info(
    900000008, 
    NULL, 
    'Cozy Cabin Inn', 
    NULL, NULL, 
    NULL, NULL, NULL, NULL,
    1, 1,   
    200, 300,  
    400, 500,  
    600, 700,  
    1, 1, 1   
);

--Missing Optional Fields
CALL add_hotel_overall_info(
    900000009, 
    NULL, 
    'Beachfront Resort', 
    '15:30', '11:00', 
    NULL, NULL, NULL, '0888888888',
    5, 15,  
    700, 1400,  
    1600, 2200,  
    2600, 3200,  
    2, 3, 4     
);

--No Pool, No Parking
CALL add_hotel_overall_info(
    900000010, 
    'http://example.com/hotel4', 
    'Mountain View Lodge', 
    '13:00', '10:30', 
    'Yes', 'No', 'No', '0999999999',
    6, 18,  
    900, 1600,  
    1700, 2500,  
    2800, 3500,  
    2, 4, 6     
);

--Late Check-in, Early Check-out
CALL add_hotel_overall_info(
    900000012, 
    'http://example.com/latecheckin', 
    'Downtown Plaza Hotel', 
    '18:00', '08:00', 
    'Yes', 'Yes', 'Yes', '0777777777',
    9, 22,  
    750, 1300,  
    1800, 2400,  
    3000, 3800,  
    3, 6, 8     
);

--Maximum Floors and Rooms
CALL add_hotel_overall_info(
    900000013, 
    'http://example.com/max1', 
    'Super Skyscraper Hotel', 
    '12:00', '10:00', 
    'Yes', 'Yes', 'Yes', '0111111111',
    50, 100,  
    1500, 3000,  
    3500, 5000,  
    6000, 7500,  
    2, 20, 35    
);

--Maximum Room Prices
CALL add_hotel_overall_info(
    900000014, 
    'http://example.com/max2', 
    'Luxury Haven Resort', 
    '13:30', '11:00', 
    'Yes', 'Yes', 'Yes', '0222222222',
    40, 80,  
    5000, 10000,  
    15000, 20000,  
    25000, 30000,  
    5, 15, 25    
);

--Maximum Admin ID & All Facilities
CALL add_hotel_overall_info(
    999999999, 
    'http://example.com/max3', 
    'Ultimate Tower Hotel', 
    '15:00', '12:30', 
    'Yes', 'Yes', 'Yes', '0333333333',
    45, 90,  
    4000, 9000,  
    13000, 18000,  
    22000, 27000,  
    3, 18, 30    
);

--Maximum Check-in & Check-out Time Values
CALL add_hotel_overall_info(
    900000015, 
    'http://example.com/max4', 
    'Midnight Express Hotel', 
    '23:59', '00:01', 
    'Yes', 'Yes', 'Yes', '0444444444',
    30, 60,  
    1200, 2200,  
    3000, 4200,  
    5000, 6200,  
    2, 10, 20    
);

--another Standard Hotel Setup test case
CALL add_hotel_overall_info(
    900000016, 
    'http://example.com/hotel_standard2', 
    'Sunset Paradise Resort', 
    '15:00', '11:30', 
    'Yes', 'Yes', 'No', '0555555555',
    12, 30,   -- 12 floors, 30 rooms per floor
    700, 1400,  -- Budget rooms: 700-1400 THB
    1600, 2500, -- Mid-range rooms: 1600-2500 THB
    2800, 4000, -- Luxury rooms: 2800-4000 THB
    2, 6, 9     -- Floors 2-5 Budget, 6-8 Mid-range, 9-12 Luxury
);
