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
  ("Zia Hensley","624-6228"),
  ("Kiona Decker","625-4491"),
  ("Dale Russell","334-5657"),
  ("Keelie Garcia","311-1974"),
  ("Zelenia Jacobs","321-8465"),
  ("Kelly Mccoy","637-5033"),
  ("Dacey Mcneil","133-3354"),
  ("Shellie Walsh","362-9430"),
  ("Audra Padilla","611-5840"),
  ("Zoe Baxter","368-7856"),
  ("Gannon Horton","874-1665"),
  ("Uta Benjamin","744-2684"),
  ("Nathaniel Whitfield","742-2279"),
  ("Herman Owens","851-2165");


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
    ((SELECT id FROM contacts WHERE name = 'Herman Owens'), 'manager', 19000),
	((SELECT id FROM contacts WHERE name = 'Audra Padilla'), 'employee', 15500),
    ((SELECT id FROM contacts WHERE name = 'Keelie Garcia'), 'employee', 8500);

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
    ((SELECT id FROM contacts WHERE name = 'Herman Owens'), false, '1999-02-02', 'Odessa'),
	((SELECT id FROM contacts WHERE name = 'Audra Padilla'), false, '2003-03-03', 'Lviv'),
    ((SELECT id FROM contacts WHERE name = 'Keelie Garcia'), true, '2001-01-05', 'Lviv');
    
    -- SELECTS 1 --
CREATE PROCEDURE contactsinfo()
	SELECT name, home 
    FROM contacts
	INNER JOIN family
        ON contacts.id = contact_id;

CALL contactsinfo();

    -- SELECTS 2 --
CREATE PROCEDURE contactsMarriedInfo(marriedb BOOLEAN)    
	SELECT name, phone, dob, home FROM contacts	
		INNER JOIN family
			ON contacts.id = contact_id
	WHERE married = marriedb;

CALL  contactsMarriedInfo(true);
CALL  contactsMarriedInfo(false);

    -- SELECTS 3 --
CREATE PROCEDURE contactByPosition(pos VARCHAR(100))
	SELECT name, phone, dob FROM contacts
	INNER JOIN family
        ON contacts.id = family.contact_id
	INNER JOIN work
        ON contacts.id = work.contact_id			
	WHERE position = pos;		

CALL  contactByPosition('manager');
CALL  contactByPosition('CEO');
