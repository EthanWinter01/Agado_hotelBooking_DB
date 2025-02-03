CALL insert_user('iOS', 113, 'Sittipong Wongsakul', 'password123', '1090123456', 'sittipong.wongsakul@example.com', CAST(NOW() AS TIMESTAMP), '1987-09-11', 'admin');
CALL insert_user('Android', 114, 'Pimchanok Jirawat', 'password456', '1101234567', 'pimchanok.jirawat@example.com', CAST(NOW() AS TIMESTAMP), '1990-02-14', 'admin');
CALL insert_user('Windows', 115, 'Chanin Sutharak', 'password789', '1112345678', 'chanin.sutharak@example.com', CAST(NOW() AS TIMESTAMP), '1992-12-22', 'admin');

CALL insert_user('iOS', NULL, 'Sudarat Meesang', 'regpass123', '1123456789', 'sudarat.meesang@example.com', CAST(NOW() AS TIMESTAMP), '1996-10-30', 'registerred_user');
CALL insert_user('Android', NULL, 'Sakchai Phongsak', 'regpass456', '1134567890', 'sakchai.phongsak@example.com', CAST(NOW() AS TIMESTAMP), '1994-04-17', 'registerred_user');
CALL insert_user('Windows', NULL, 'Thanyarat Rattanasak', 'regpass789', '1145678901', 'thanyarat.rattanasak@example.com', CAST(NOW() AS TIMESTAMP), '1995-03-03', 'registerred_user');

CALL insert_user('iOS', NULL, 'Apichart Tanthanuch', 'regpass123', '1156789012', 'apichart.tanthanuch@example.com', CAST(NOW() AS TIMESTAMP), '1991-07-25', 'registerred_user');
CALL insert_user('Android', NULL, 'Kwanjai Chuchai', 'regpass456', '1167890123', 'kwanjai.chuchai@example.com', CAST(NOW() AS TIMESTAMP), '1993-01-19', 'registerred_user');
CALL insert_user('Windows', NULL, 'Nattanon Manachai', 'regpass789', '1178901234', 'nattanon.manachai@example.com', CAST(NOW() AS TIMESTAMP), '1990-11-10', 'registerred_user');

CALL insert_user('iOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Android', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Windows', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');


-- Insert more sample users with CURRENT_TIMESTAMP for register_date
CALL insert_user('iOS', 116, 'Thanakorn Rattanapong', 'password123', '1189012345', 'thanakorn.rattanapong@example.com', CAST(NOW() AS TIMESTAMP), '1988-01-22', 'admin');
CALL insert_user('Android', 117, 'Wassana Pongsuk', 'password456', '1190123456', 'wassana.pongsuk@example.com', CAST(NOW() AS TIMESTAMP), '1991-04-25', 'admin');
CALL insert_user('Windows', 118, 'Supaporn Raksri', 'password789', '1201234567', 'supaporn.raksri@example.com', CAST(NOW() AS TIMESTAMP), '1992-07-30', 'admin');

CALL insert_user('iOS', NULL, 'Kittima Pongtavee', 'regpass123', '1212345678', 'kittima.pongtavee@example.com', CAST(NOW() AS TIMESTAMP), '1993-08-18', 'registerred_user');
CALL insert_user('Android', NULL, 'Phakphum Chailai', 'regpass456', '1223456789', 'phakphum.chailai@example.com', CAST(NOW() AS TIMESTAMP), '1994-05-21', 'registerred_user');
CALL insert_user('Windows', NULL, 'Nirun Phonjan', 'regpass789', '1234567890', 'nirun.phonjan@example.com', CAST(NOW() AS TIMESTAMP), '1995-06-12', 'registerred_user');

CALL insert_user('iOS', NULL, 'Rapeeporn Thitiphan', 'regpass123', '1245678901', 'rapeeporn.thitiphan@example.com', CAST(NOW() AS TIMESTAMP), '1996-03-15', 'registerred_user');
CALL insert_user('Android', NULL, 'Saranya Kittinan', 'regpass456', '1256789012', 'saranya.kittinan@example.com', CAST(NOW() AS TIMESTAMP), '1992-02-05', 'registerred_user');
CALL insert_user('Windows', NULL, 'Orawan Khemtong', 'regpass789', '1267890123', 'orawan.khemtong@example.com', CAST(NOW() AS TIMESTAMP), '1990-11-17', 'registerred_user');

CALL insert_user('iOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Android', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Windows', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');

-- Insert more sample users with different ages and CURRENT_TIMESTAMP for register_date
CALL insert_user('iOS', 119, 'Jirawat Charoenwong', 'password123', '1278901234', 'jirawat.charoenwong@example.com', CAST(NOW() AS TIMESTAMP), '1985-02-15', 'admin');
CALL insert_user('Android', 120, 'Piyarat Sittipong', 'password456', '1289012345', 'piyarat.sittipong@example.com', CAST(NOW() AS TIMESTAMP), '1998-06-10', 'admin');
CALL insert_user('Windows', 121, 'Prapaporn Saengsawang', 'password789', '1290123456', 'prapaporn.saengsawang@example.com', CAST(NOW() AS TIMESTAMP), '2001-03-24', 'admin');

CALL insert_user('iOS', NULL, 'Nattapol Phinyo', 'regpass123', '1301234567', 'nattapol.phinyo@example.com', CAST(NOW() AS TIMESTAMP), '1997-12-17', 'registerred_user');
CALL insert_user('Android', NULL, 'Tassana Pongsathaporn', 'regpass456', '1312345678', 'tassana.pongsathaporn@example.com', CAST(NOW() AS TIMESTAMP), '2003-08-05', 'registerred_user');
CALL insert_user('Windows', NULL, 'Kritsanapong Srisai', 'regpass789', '1323456789', 'kritsanapong.srisai@example.com', CAST(NOW() AS TIMESTAMP), '1994-10-22', 'registerred_user');

CALL insert_user('iOS', NULL, 'Panchalee Ruksa', 'regpass123', '1334567890', 'panchalee.ruksa@example.com', CAST(NOW() AS TIMESTAMP), '1999-07-30', 'registerred_user');
CALL insert_user('Android', NULL, 'Viroj Phothong', 'regpass456', '1345678901', 'viroj.phothong@example.com', CAST(NOW() AS TIMESTAMP), '1990-11-25', 'registerred_user');
CALL insert_user('Windows', NULL, 'Sumalee Duangchun', 'regpass789', '1356789012', 'sumalee.duangchun@example.com', CAST(NOW() AS TIMESTAMP), '1986-04-14', 'registerred_user');

CALL insert_user('iOS', NULL, 'Atchara Sukhavasi', 'regpass123', '1367890123', 'atchara.sukhavasi@example.com', CAST(NOW() AS TIMESTAMP), '1992-01-18', 'registerred_user');
CALL insert_user('Android', NULL, 'Pattaraporn Wiphatthanasri', 'regpass456', '1378901234', 'pattaraporn.wiphatthanasri@example.com', CAST(NOW() AS TIMESTAMP), '2000-09-09', 'registerred_user');
CALL insert_user('Windows', NULL, 'Ananya Roongkiat', 'regpass789', '1389012345', 'ananya.roongkiat@example.com', CAST(NOW() AS TIMESTAMP), '1993-12-13', 'registerred_user');

CALL insert_user('iOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Android', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Windows', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');

