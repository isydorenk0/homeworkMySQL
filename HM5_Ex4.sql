DROP DATABASE MyJoinsDB; 
CREATE DATABASE MyJoinsDB;
USE MyJoinsDB;

CREATE TABLE  contacts (
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(30),
    phone VARCHAR(15),
    PRIMARY KEY (id)
    );
INSERT INTO contacts (name, phone) VALUES
	('Max',  '1000000001'), 
	('Alex', '1000000002'),
    ('Andy', '1000000004'),
	('Iren', '1000000003'),
    ('Jon',  '1000000005');

CREATE TABLE work (
	id INT AUTO_INCREMENT NOT NULL,    
    position VARCHAR(100),
    salary DOUBLE(15, 2),
    contact_id INT,
    FOREIGN KEY (contact_id) REFERENCES contacts(id), 
    PRIMARY KEY (id)
    );
    
INSERT INTO work (contact_id, position, salary) VALUES
	((SELECT id FROM contacts WHERE name = 'Max'), 'CEO', 15000), 
	((SELECT id FROM contacts WHERE name = 'Alex'), 'manager', 9000),
    ((SELECT id FROM contacts WHERE name = 'Andy'), 'manager', 19000),
	((SELECT id FROM contacts WHERE name = 'Iren'), 'employee', 15500),
    ((SELECT id FROM contacts WHERE name = 'Jon'), 'employee', 8500);
    
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
	((SELECT id FROM contacts WHERE name = 'Max'), false, '2000-01-01', 'Kyiv'), 
	((SELECT id FROM contacts WHERE name = 'Alex'), true, '2001-02-02', 'Ternopil'),
    ((SELECT id FROM contacts WHERE name = 'Andy'), false, '1999-02-02', 'Odessa'),
	((SELECT id FROM contacts WHERE name = 'Iren'), false, '2003-03-03', 'Lviv'),
    ((SELECT id FROM contacts WHERE name = 'Jon'), true, '2001-01-05', 'Lviv');

SELECT name, phone, (SELECT home FROM family WHERE contacts.id = family.id) AS home FROM contacts;
                
SELECT (SELECT name FROM contacts WHERE family.id = contacts.id) AS name, 
		dob, home,
		(SELECT phone FROM contacts WHERE family.id = contacts.id) AS name
	FROM family
	WHERE married;	

SELECT (SELECT contacts.name FROM contacts WHERE contacts.id = family.id) as name,
		(SELECT contacts.phone FROM contacts WHERE contacts.id = family.id) as phone,
		dob    
	FROM family
	WHERE family.id IN (SELECT id FROM work WHERE position = 'manager');

	


    