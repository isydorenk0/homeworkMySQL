DROP DATABASE MyDB;
 -- Ex2 --
CREATE DATABASE MyDB;
USE MyDB;

-- Ex3 --
CREATE TABLE  contacts (
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(30),
    phone VARCHAR(15),
    PRIMARY KEY (id)
    );
INSERT INTO contacts (name, phone) VALUES
	('Max', '1000000001'), 
	('Alex', '1000000002'),
	('Iren', '1000000003');

CREATE TABLE work (
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(30),
    position VARCHAR(100),
    salary DOUBLE(15, 2),
    PRIMARY KEY (id)
    );
INSERT INTO work (name, position, salary) VALUES
	('Max', 'PM', 15000), 
	('Alex', 'developer', 9000),
	('Iren', 'QA', 15500);
    
CREATE TABLE family (
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(30),
    married BOOLEAN,
    dob DATE,
    home VARCHAR(50),
    PRIMARY KEY (id)
    );
INSERT INTO family (name, married, dob, home) VALUES
	('Max', false, '2000-01-01', 'Kyiv'), 
	('Alex', true, '2001-02-02', 'Ternopil'),
	('Iren', false, '2003-03-03', 'Lviv');
    
 -- Ex4 --
SELECT name 
	FROM work 
	WHERE salary > 10000;

-- Ex5 --
UPDATE family 
	SET married = true
	WHERE id = 1;
    
SELECT * FROM family;
    