DROP database ShopDB;

CREATE DATABASE ShopDB;
USE ShopDB;

-- w/out PK ---
CREATE TABLE Customers
	(
	CustomerNo int NOT NULL,
	FName nvarchar(15) NOT NULL,
	LName nvarchar(15) NOT NULL,
	MName nvarchar(15) NULL,
	Address1 nvarchar(50) NOT NULL,
	Address2 nvarchar(50) NULL,
	City nchar(10) NOT NULL,
	Phone char(12) NOT NULL,
	DateInSystem date NULL
    -- primary key(CustomerNo)
	);  

INSERT Customers 
(CustomerNo, LName, FName, MName, Address1, Address2, City, Phone,DateInSystem)
VALUES
(0, 'Круковский','Анатолий','Петрович','Лужная 15',NULL,'Харьков','(092)3212211','2009-11-20'),
(1, 'Дурнев','Виктор','Викторович','Зелинская 10',NULL,'Киев','(067)4242132','2009-11-20'),
(2, 'Унакий','Зигмунд','федорович','Дихтяревская 5',NULL,'Киев','(092)7612343','2009-11-20'),
(3, 'Левченко','Виталий','Викторович','Глущенка 5','Драйзера 12','Киев','(053)3456788','2009-11-20'),
(4, 'Выжлецов','Олег','Евстафьевич','Киевская 3','Одесская 8','Чернигов','(044)2134212','2009-11-20');

SELECT * FROM Customers;
EXPLAIN SELECT * FROM Customers;

SELECT * FROM Customers
	where LNAME = 'Левченко';
    
EXPLAIN SELECT * FROM Customers
	where LNAME = 'Левченко';

drop table Customers;

-- with PK and index -- 

CREATE TABLE Customers
	(
	CustomerNo int NOT NULL unique,
	FName nvarchar(15) NOT NULL,
	LName nvarchar(15) NOT NULL,
	MName nvarchar(15) NULL,
	Address1 nvarchar(50) NOT NULL,
	Address2 nvarchar(50) NULL,
	City nchar(10) NOT NULL,
	Phone char(12) NOT NULL,
	DateInSystem date NULL,
    primary key(CustomerNo)
	);  

ALTER TABLE Customers ADD INDEX
	lname_index (LName);		

INSERT Customers 
(CustomerNo, LName, FName, MName, Address1, Address2, City, Phone,DateInSystem)
VALUES
(0, 'Круковский','Анатолий','Петрович','Лужная 15',NULL,'Харьков','(092)3212211','2009-11-20'),
(1, 'Дурнев','Виктор','Викторович','Зелинская 10',NULL,'Киев','(067)4242132','2009-11-20'),
(2, 'Унакий','Зигмунд','федорович','Дихтяревская 5',NULL,'Киев','(092)7612343','2009-11-20'),
(3, 'Левченко','Виталий','Викторович','Глущенка 5','Драйзера 12','Киев','(053)3456788','2009-11-20'),
(4, 'Выжлецов','Олег','Евстафьевич','Киевская 3','Одесская 8','Чернигов','(044)2134212','2009-11-20');

SELECT * FROM Customers
	where LNAME = 'Левченко';

EXPLAIN SELECT * FROM Customers
	where LNAME = 'Левченко';

show index from customers; 