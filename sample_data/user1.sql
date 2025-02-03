-- Admin Sample 1
call insert_user(
    'mobile', 101, 'John Doe', 'adminpass123', '1234567890', 'john.doe@email.com', 
    current_timestamp, '1980-05-15', 'admin'
);

-- Admin Sample 2
call insert_user(
    'tablet', 102, 'Alice Smith', 'adminpass456', '2345678901', 'alice.smith@email.com', 
    current_timestamp, '1985-06-20', 'admin'
);

-- Admin Sample 3
call insert_user(
    'desktop', 103, 'Bob Johnson', 'adminpass789', '3456789012', 'bob.johnson@email.com', 
    current_timestamp, '1978-11-10', 'admin'
);

-- Admin Sample 4
call insert_user(
    'laptop', 104, 'Emma White', 'adminpass012', '4567890123', 'emma.white@email.com', 
    current_timestamp, '1990-02-25', 'admin'
);

-- Admin Sample 5
call insert_user(
    'mobile', 105, 'David Brown', 'adminpass345', '5678901234', 'david.brown@email.com', 
    current_timestamp, '1992-07-30', 'admin'
);

-- Unregisterred User Sample 1
call insert_user(
    'mobile', 0, 'No Name', 'no_pass', '1234567890', 'noemail1@email.com', 
    current_timestamp, null, 'unregisterred_user'
);

-- Unregisterred User Sample 2
call insert_user(
    'tablet', 0, 'Unknown User', 'no_pass', '2345678901', 'noemail2@email.com', 
    current_timestamp, null, 'unregisterred_user'
);

-- Unregisterred User Sample 3
call insert_user(
    'desktop', 0, 'Guest User', 'no_pass', '3456789012', 'noemail3@email.com', 
    current_timestamp, null, 'unregisterred_user'
);

-- Unregisterred User Sample 4
call insert_user(
    'laptop', 0, 'Anonymous User', 'no_pass', '4567890123', 'noemail4@email.com', 
    current_timestamp, null, 'unregisterred_user'
);

-- Unregisterred User Sample 5
call insert_user(
    'mobile', 0, 'Stranger', 'no_pass', '5678901234', 'noemail5@email.com', 
    current_timestamp, null, 'unregisterred_user'
);

-- Registerred User Sample 1
call insert_user(
    'mobile', 0, 'James Taylor', 'password123', '1234567890', 'james.taylor@email.com', 
    current_timestamp, '2000-01-01', 'registerred_user'
);

-- Registerred User Sample 2
call insert_user(
    'tablet', 0, 'Sophia Clark', 'password456', '2345678901', 'sophia.clark@email.com', 
    current_timestamp, '1995-03-12', 'registerred_user'
);

-- Registerred User Sample 3
call insert_user(
    'desktop', 0, 'Michael Harris', 'password789', '3456789012', 'michael.harris@email.com', 
    current_timestamp, '1990-05-20', 'registerred_user'
);

-- Registerred User Sample 4
call insert_user(
    'laptop', 0, 'Olivia Lee', 'password012', '4567890123', 'olivia.lee@email.com', 
    current_timestamp, '1998-11-10', 'registerred_user'
);

-- Registerred User Sample 5
call insert_user(
    'mobile', 0, 'Ethan Walker', 'password345', '5678901234', 'ethan.walker@email.com', 
    current_timestamp, '1997-07-15', 'registerred_user'
);

CALL insert_user('iOS', 113, 'Sittipong Wongsakul', 'password123', '1090123456', 'sittipong.wongsakul@example.com', '2024-02-25 10:00:00', '1987-09-11', 'admin');
CALL insert_user('Android', 114, 'Pimchanok Jirawat', 'password456', '1101234567', 'pimchanok.jirawat@example.com', '2024-02-26 11:00:00', '1990-02-14', 'admin');
CALL insert_user('Windows', 115, 'Chanin Sutharak', 'password789', '1112345678', 'chanin.sutharak@example.com', '2024-02-27 12:00:00', '1992-12-22', 'admin');

CALL insert_user('iOS', NULL, 'Sudarat Meesang', 'regpass123', '1123456789', 'sudarat.meesang@example.com', '2024-02-28 13:00:00', '1996-10-30', 'registerred_user');
CALL insert_user('Android', NULL, 'Sakchai Phongsak', 'regpass456', '1134567890', 'sakchai.phongsak@example.com', '2024-03-01 14:00:00', '1994-04-17', 'registerred_user');
CALL insert_user('Windows', NULL, 'Thanyarat Rattanasak', 'regpass789', '1145678901', 'thanyarat.rattanasak@example.com', '2024-03-02 15:00:00', '1995-03-03', 'registerred_user');

CALL insert_user('iOS', NULL, 'Apichart Tanthanuch', 'regpass123', '1156789012', 'apichart.tanthanuch@example.com', '2024-03-03 16:00:00', '1991-07-25', 'registerred_user');
CALL insert_user('Android', NULL, 'Kwanjai Chuchai', 'regpass456', '1167890123', 'kwanjai.chuchai@example.com', '2024-03-04 17:00:00', '1993-01-19', 'registerred_user');
CALL insert_user('Windows', NULL, 'Nattanon Manachai', 'regpass789', '1178901234', 'nattanon.manachai@example.com', '2024-03-05 18:00:00', '1990-11-10', 'registerred_user');

CALL insert_user('iOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Android', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Windows', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');


