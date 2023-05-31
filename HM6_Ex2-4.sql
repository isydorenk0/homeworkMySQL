DROP DATABASE MyJoinsDB; 
CREATE DATABASE MyJoinsDB;
USE MyJoinsDB;

CREATE TABLE contacts (
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(30),
    phone VARCHAR(15),
    PRIMARY KEY (id)
    );
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
SELECT * FROM contacts
	WHERE phone = '611-5840';       

ALTER TABLE contacts ADD UNIQUE INDEX   -- заявлення телефон як індекс дозволить скоріше знаходити контакт по номеру телефона 
	phone_index (phone);				-- хоча не дуже оптимально, так як телефон текстового типу

show index from contacts;    

SELECT * FROM contacts
	WHERE phone = '611-5840';       
    
        -- SELECTS 2 --
SELECT name, phone, dob, home FROM contacts	
	INNER JOIN family
        ON contacts.id = contact_id
	WHERE married;

ALTER TABLE family ADD INDEX   
	married_index (married);			
    
show index from family;    

CREATE VIEW MarriedEmpl  
AS SELECT name, phone, dob, home FROM contacts	
	INNER JOIN family
        ON contacts.id = contact_id
	WHERE married;

SELECT * FROM MarriedEmpl;
 
    -- SELECTS 3 --
SELECT name, phone, dob FROM contacts
	INNER JOIN family
        ON contacts.id = family.contact_id
INNER JOIN work
        ON contacts.id = work.contact_id			
	WHERE position = 'manager';		
    
ALTER TABLE work ADD INDEX   		-- є зміст зробити position ключем, якщо передбачається часта генерація запитів 
	position_index (position);		-- по позиціям (кількість працівників у відділах / з/п по відділу), також текстовий тип, і тому краще зробити ще одну таблицю <id : position> і використовувати foreign key
    
show index from work;    

CREATE VIEW ManagerEmpl  
As SELECT name, phone, dob FROM contacts
	INNER JOIN family
        ON contacts.id = family.contact_id
INNER JOIN work
        ON contacts.id = work.contact_id			
	WHERE position = 'manager';		
    
SELECT * from ManagerEmpl;    