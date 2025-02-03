-- CREATE Users' TABLE 
-- superclass/subclass by 8A method 

DROP TABLE IF EXISTS admin cascade;
DROP TABLE IF EXISTS unregisterred_user cascade;
DROP TABLE IF EXISTS registerred_user cascade;
DROP TABLE IF EXISTS usert cascade;

CREATE TABLE usert (
	user_id INT PRIMARY KEY,
	device_type VARCHAR(32) NOT NULL
);

CREATE TABLE admin(
	user_id INT,
	officer_id INT NOT NULL,
	admin_name VARCHAR(64) NOT NULL,
	admin_password VARCHAR(64) NOT NULL, 
    admin_email VARCHAR(64) NOT NULL;
	telephone_number VARCHAR(10), 
	FOREIGN KEY (user_id) REFERENCES usert(user_id)
);

CREATE TABLE unregisterred_user (
	FOREIGN KEY (user_id) REFERENCES usert(user_id) 
);
	
CREATE TABLE registerred_user(
	user_id INT,
	user_name VARCHAR(64) NOT NULL,
	user_password VARCHAR(64) NOT NULL, 
	user_email VARCHAR(64) NOT NULL,
	telephone_number VARCHAR(10),
	register_date TIMESTAMP NOT NULL,
	birth_date DATE NOT NULL,
	FOREIGN KEY(user_id) REFERENCES usert(user_id) 
);