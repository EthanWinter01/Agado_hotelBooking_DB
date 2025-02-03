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


-- Testcases for unregisterred_user and registerred_user with different device types
CALL insert_user('iOS', NULL, 'Amonrat Chaisiri', 'regpass123', '1390123456', 'amonrat.chaisiri@example.com', CAST(NOW() AS TIMESTAMP), '1995-02-19', 'registerred_user');
CALL insert_user('Android', NULL, 'Prasert Bunkhot', 'regpass456', '1401234567', 'prasert.bunkhot@example.com', CAST(NOW() AS TIMESTAMP), '1998-08-02', 'registerred_user');
CALL insert_user('Windows', NULL, 'Rujira Phonrak', 'regpass789', '1412345678', 'rujira.phonrak@example.com', CAST(NOW() AS TIMESTAMP), '2000-01-10', 'registerred_user');

CALL insert_user('iOS', NULL, 'Pattaraporn Kittikulsri', 'regpass123', '1423456789', 'pattaraporn.kittikulsri@example.com', CAST(NOW() AS TIMESTAMP), '1994-06-22', 'registerred_user');
CALL insert_user('Android', NULL, 'Sittichai Ratthanaporn', 'regpass456', '1434567890', 'sittichai.ratthanaporn@example.com', CAST(NOW() AS TIMESTAMP), '1993-09-30', 'registerred_user');
CALL insert_user('Windows', NULL, 'Sopida Lertwittayaporn', 'regpass789', '1445678901', 'sopida.lertwittayaporn@example.com', CAST(NOW() AS TIMESTAMP), '1988-11-04', 'registerred_user');

CALL insert_user('iOS', NULL, 'Thanya Phothong', 'regpass123', '1456789012', 'thanya.phothong@example.com', CAST(NOW() AS TIMESTAMP), '1991-03-12', 'registerred_user');
CALL insert_user('Android', NULL, 'Nattakarn Phonghantakarn', 'regpass456', '1467890123', 'nattakarn.phonghantakarn@example.com', CAST(NOW() AS TIMESTAMP), '2001-07-14', 'registerred_user');
CALL insert_user('Windows', NULL, 'Anusorn Hiranratcha', 'regpass789', '1478901234', 'anusorn.hiranratcha@example.com', CAST(NOW() AS TIMESTAMP), '1997-10-08', 'registerred_user');

CALL insert_user('iOS', NULL, 'Chalida Boonsri', 'regpass123', '1489012345', 'chalida.boonsri@example.com', CAST(NOW() AS TIMESTAMP), '1990-01-21', 'registerred_user');
CALL insert_user('Android', NULL, 'Soraya Chumphu', 'regpass456', '1490123456', 'soraya.chumphu@example.com', CAST(NOW() AS TIMESTAMP), '1992-04-17', 'registerred_user');
CALL insert_user('Windows', NULL, 'Krissanapong Phonchai', 'regpass789', '1501234567', 'krissanapong.phonchai@example.com', CAST(NOW() AS TIMESTAMP), '1995-05-28', 'registerred_user');

CALL insert_user('iOS', NULL, 'Chananchida Charoen', 'regpass123', '1512345678', 'chananchida.charoen@example.com', CAST(NOW() AS TIMESTAMP), '2000-02-25', 'registerred_user');
CALL insert_user('Android', NULL, 'Orapin Chaisongkram', 'regpass456', '1523456789', 'orapin.chaisongkram@example.com', CAST(NOW() AS TIMESTAMP), '1999-11-13', 'registerred_user');
CALL insert_user('Windows', NULL, 'Nongluck Phuengkasem', 'regpass789', '1534567890', 'nongluck.phuengkasem@example.com', CAST(NOW() AS TIMESTAMP), '1994-06-03', 'registerred_user');

CALL insert_user('iOS', NULL, 'Varit Phaechan', 'regpass123', '1545678901', 'varit.phaechan@example.com', CAST(NOW() AS TIMESTAMP), '1996-12-05', 'registerred_user');
CALL insert_user('Android', NULL, 'Chinwadee Tangpai', 'regpass456', '1556789012', 'chinwadee.tangpai@example.com', CAST(NOW() AS TIMESTAMP), '1998-03-22', 'registerred_user');
CALL insert_user('Windows', NULL, 'Peechaya Wongsuwan', 'regpass789', '1567890123', 'peechaya.wongsuwan@example.com', CAST(NOW() AS TIMESTAMP), '2002-01-09', 'registerred_user');

CALL insert_user('iOS', NULL, 'Apirak Chokchaisiri', 'regpass123', '1578901234', 'apirak.chokchaisiri@example.com', CAST(NOW() AS TIMESTAMP), '1995-07-17', 'registerred_user');
CALL insert_user('Android', NULL, 'Pornsuda Wongsuntharam', 'regpass456', '1589012345', 'pornsuda.wongsuntharam@example.com', CAST(NOW() AS TIMESTAMP), '1991-08-26', 'registerred_user');
CALL insert_user('Windows', NULL, 'Sivaporn Manodhin', 'regpass789', '1590123456', 'sivaporn.manodhin@example.com', CAST(NOW() AS TIMESTAMP), '1993-09-05', 'registerred_user');

-- Unregistered users
CALL insert_user('iOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Android', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Windows', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');

-- Testcases for unregisterred_user with different device types
CALL insert_user('iOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Android', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Windows', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');

CALL insert_user('iOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Android', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Windows', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');

CALL insert_user('iOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Android', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Windows', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');

CALL insert_user('iOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
CALL insert_user('Android', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'unregisterred_user');
