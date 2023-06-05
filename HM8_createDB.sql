DROP DATABASE MyJoinsDB; 
CREATE DATABASE MyJoinsDB;
USE MyJoinsDB;

CREATE TABLE contacts (
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(30),
    phone VARCHAR(15),
    PRIMARY KEY (id)
    );

ALTER TABLE contacts ADD UNIQUE INDEX   
	phone_index (phone);				

INSERT INTO contacts (name, phone) VALUES
  ("Blossom Beard","317-0181"),
  ("Alden Figueroa","336-2551"),
  ("Carly Waters","824-3742"),
  ("Stella Cameron","456-4555"),
  ("Keegan Hale","511-6352"),
  ("Ila Rich","275-7246"),
  ("Zia Hensley","624-6228");

CREATE TABLE work (
	id INT AUTO_INCREMENT NOT NULL,    
    position VARCHAR(100),
    salary DOUBLE(15, 2),
    contact_id INT,
    FOREIGN KEY (contact_id) REFERENCES contacts(id), 
    PRIMARY KEY (id)
    );

INSERT INTO work (contact_id, position, salary) VALUES
	((SELECT id FROM contacts WHERE name = 'Blossom Beard'), 'CEO', 15000), 
	((SELECT id FROM contacts WHERE name = 'Carly Waters'), 'manager', 9000),
    ((SELECT id FROM contacts WHERE name = 'Stella Cameron'), 'manager', 19000),
	((SELECT id FROM contacts WHERE name = 'Ila Rich'), 'employee', 15500),
    ((SELECT id FROM contacts WHERE name = 'Keegan Hale'), 'employee', 8500);

ALTER TABLE work ADD INDEX   		
	position_index (position);		
    
CREATE TABLE family (
	id INT AUTO_INCREMENT NOT NULL,    
    married BOOLEAN,
    dob DATE,
    home VARCHAR(50),
    contact_id INT,
    FOREIGN KEY (contact_id) REFERENCES contacts(id), 
    PRIMARY KEY (id)
    );
    
INSERT INTO family (contact_id, married, dob, home) VALUES
	((SELECT id FROM contacts WHERE name = 'Blossom Beard'), false, '2000-01-01', 'Kyiv'), 
	((SELECT id FROM contacts WHERE name = 'Carly Waters'), true, '2001-02-02', 'Ternopil'),
    ((SELECT id FROM contacts WHERE name = 'Stella Cameron'), false, '1999-02-02', 'Odessa'),
	((SELECT id FROM contacts WHERE name = 'Ila Rich'), false, '2003-03-03', 'Lviv'),
    ((SELECT id FROM contacts WHERE name = 'Keegan Hale'), true, '2001-01-05', 'Lviv');
    
