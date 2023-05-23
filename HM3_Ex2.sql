-- DROP database weapon;

CREATE DATABASE weapon;
USE weapon;

CREATE table ranks (	
	id INT auto_increment NOT NULL,        
	rank_name VARCHAR(15),
    code INT,    
    -- other_info;
    PRIMARY KEY(id)
);

CREATE table platoon (	
	id INT auto_increment NOT NULL,        
	platoon_name VARCHAR(15),
    code INT,    
    -- other_info;
    PRIMARY KEY(id)
);

CREATE table personal (	
	id INT auto_increment NOT NULL,        
	first_name VARCHAR(15),
    last_name VARCHAR(25),    
    platoon_id INT,
    FOREIGN KEY(platoon_id) REFERENCES platoon(id),
    rank_id INT,
    FOREIGN KEY(rank_id) REFERENCES ranks(id),
    -- other_info;
    PRIMARY KEY(id)
);

CREATE table weapons (	
	id INT auto_increment NOT NULL,        
	name VARCHAR(15),    
    -- tech_charac;
    PRIMARY KEY(id)
);

CREATE table firearms_records (	
	id INT auto_increment NOT NULL,        
	soldier_id INT,
    FOREIGN KEY(soldier_id) REFERENCES personal(id),
	weapon_id INT,
    FOREIGN KEY(weapon_id) REFERENCES weapons(id),
	officer_id INT,
    FOREIGN KEY(officer_id) REFERENCES personal(id),
    PRIMARY KEY(id, soldier_id, weapon_id)    
);
