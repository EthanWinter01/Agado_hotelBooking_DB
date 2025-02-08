-- Standard Hotel Setup
CALL insert_hotel(
    900000007,
    'http://example.com/hotel1', 
    'Grand Palace Hotel', 
    '14:00', '12:00', 
    'WiFi, Pool, Valet Parking, Gym, Spa, Restaurant, Bar, Conference Room', '0812345678',
    8, 25,   
    800, 1500,  
    1800, 2500,  
    3000, 4000,  
    2, 5, 7,
    'Single bed, ceiling fan, shared bathroom, free WiFi, basic toiletries, no minibar',
    'Queen bed, air conditioning, private bathroom, TV, WiFi, minibar, toiletries',
    'King bed, air conditioning, private jacuzzi, smart TV, high-speed WiFi, luxury toiletries, balcony, 24/7 room service'  
);

-- Minimal Input Value
CALL insert_hotel(
    900000008, 
    NULL, 
    'Cozy Cabin Inn', 
    NULL, NULL, 
    'WiFi, Free Breakfast', NULL,
    5, 10,   
    200, 300,  
    400, 500,  
    600, 700,  
    2, 3, 4,
    'Twin bed, heater, shared bathroom, free WiFi, basic toiletries, no TV',
    'Queen bed, heating, private bathroom, TV, WiFi, minibar, toiletries',
    'King bed, fireplace, private jacuzzi, smart TV, high-speed WiFi, luxury toiletries, scenic balcony, 24/7 room service'   
);

-- Missing Optional Fields
CALL insert_hotel(
    900000009, 
    NULL, 
    'Beachfront Resort', 
    '15:30', '11:00', 
    'WiFi, Beach Access, Restaurant, Spa', '0888888888',
    5, 15,  
    700, 1400,  
    1600, 2200,  
    2600, 3200,  
    2, 3, 4,
    'Cozy twin bed, ceiling fan, shared bathroom, free WiFi, beach access, no minibar, basic toiletries',
    'Queen bed, air conditioning, private balcony, ocean breeze, TV, minibar, WiFi, hammock',
    'King bed, panoramic sea view, private jacuzzi, smart TV, high-speed WiFi, luxury toiletries, beachside breakfast, personal butler'
);

-- No Pool, No Parking
CALL insert_hotel(
    900000009, 
    'http://example.com/hotel4', 
    'Mountain View Lodge', 
    '13:00', '10:30', 
    'WiFi, Hiking Trails, Free Breakfast', '0999999999',
    6, 18,  
    900, 1600,  
    1700, 2500,  
    2800, 3500,  
    2, 4, 6,
    'Cozy twin bed, heater, shared bathroom, free WiFi, mountain view, basic toiletries, no TV',
    'Queen bed, fireplace, private balcony, scenic view, TV, minibar, WiFi, toiletries',
    'King bed, panoramic mountain view, private hot tub, smart TV, luxury toiletries, high-speed WiFi, in-room dining, 24/7 concierge'
);

-- Late Check-in, Early Check-out
CALL insert_hotel(
    900000004, 
    'http://example.com/latecheckin', 
    'Downtown Plaza Hotel', 
    '18:00', '08:00', 
    'WiFi, Pool, Valet Parking, Gym, Spa, 24-hour Reception', '0777777777',
    9, 22,  
    750, 1300,  
    1800, 2400,  
    3000, 3800,  
    3, 6, 8,
    'Compact twin bed, air conditioning, shared bathroom, free WiFi, city view, basic toiletries, no minibar',
    'Queen bed, private bathroom, smart TV, minibar, WiFi, city skyline view, coffee maker',
    'King bed, floor-to-ceiling windows, executive lounge access, luxury toiletries, high-speed WiFi, in-room dining, 24/7 concierge'
);

-- Maximum Floors and Rooms
CALL insert_hotel(
    900000005,
    'http://example.com/max1', 
    'Super Skyscraper Hotel', 
    '12:00', '10:00', 
    'WiFi, Pool, Valet Parking, Rooftop Bar, Business Center, Gym, Spa, Indoor Pool', '0111111111',
    50, 100,  
    1500, 3000,  
    3500, 5000,  
    6000, 7500,  
    2, 20, 35,
    'Twin bed, air conditioning, shared bathroom, free WiFi, city skyline view, basic toiletries, no minibar',
    'Queen bed, private bathroom, smart TV, minibar, WiFi, high-floor city view, coffee maker',
    'King bed, floor-to-ceiling windows, skyline panorama, private jacuzzi, luxury toiletries, high-speed WiFi, in-room dining, personal butler'
);

-- Maximum Room Prices
CALL insert_hotel(
    900000005, 
    'http://example.com/max2', 
    'Luxury Haven Resort', 
    '13:30', '11:00', 
    'WiFi, Pool, Valet Parking, Butler Service, Private Beach, Fine Dining, Spa, Private Cabanas', '0222222222',
    40, 80,  
    5000, 10000,  
    15000, 20000,  
    25000, 30000,  
    5, 15, 25,
    'Cozy queen bed, garden view, air conditioning, free WiFi, mini-fridge, basic toiletries, no room service',
    'King bed, private balcony, ocean view, smart TV, minibar, rainfall shower, coffee machine',
    'Private villa, infinity pool, butler service, spa access, luxury linens, premium minibar, oceanfront terrace'    
);

-- Maximum Facilities
CALL insert_hotel(
    900000007, 
    'http://example.com/max3', 
    'Ultimate Tower Hotel', 
    '15:00', '12:30', 
    'WiFi, Pool, Valet Parking, Rooftop Bar, Nightclub, Movie Theater, Golf Course, Tennis Court, Bowling Alley, Helipad', '0333333333',
    45, 90,  
    4000, 9000,  
    13000, 18000,  
    22000, 27000,  
    3, 18, 30,
    'Single bed, city view, air conditioning, free WiFi, shared bathroom, basic toiletries, no minibar',
    'Queen bed, private bathroom, smart TV, minibar, high-speed WiFi, skyline view, coffee maker',
    'Penthouse suite, panoramic windows, executive lounge access, luxury toiletries, in-room dining, 24/7 concierge'
);

-- Maximum Check-in & Check-out Time Values
CALL insert_hotel(
    900000008, 
    'http://example.com/max4', 
    'Midnight Express Hotel', 
    '23:59', '00:01', 
    'WiFi, Pool, Valet Parking, 24-hour Room Service, Casino, Spa, Gym, Live Entertainment', '0444444444',
    30, 60,  
    1200, 2200,  
    3000, 4200,  
    5000, 6200,  
    2, 10, 20
    'Twin bed, dim lighting, air conditioning, free WiFi, shared bathroom, basic toiletries, no minibar',
    'Queen bed, private bathroom, smart TV, minibar, city skyline view, coffee maker',
    'King bed, mood lighting, soundproof walls, luxury linens, 24/7 room service, in-room bar, VIP lounge access'   
);

-- Another Standard Hotel Setup
CALL insert_hotel(
    900000002,
    'http://example.com/hotel_standard2', 
    'Sunset Paradise Resort', 
    '15:00', '11:30', 
    'WiFi, Pool, Beachfront, Spa, Restaurant, Bar, Kids Club', '0555555555',
    12, 30,   
    700, 1400,  
    1600, 2500,  
    2800, 4000,  
    2, 6, 9,
    'Cozy double bed, garden view, air conditioning, free WiFi, mini-fridge, basic toiletries, no room service',
    'King bed, private balcony, ocean view, smart TV, minibar, rainfall shower, coffee machine',
    'Beachfront villa, infinity pool, butler service, spa access, luxury linens, premium minibar, sunset terrace'
);
