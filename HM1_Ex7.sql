-- Используя MySQL Workbench создать пустую базу данных автомобилей. Заполнить таблицу данными (id(Autoincrement),
--  марка, модель, объем двигателя, цена, макс. скорость).
DROP DATABASE cars;

CREATE DATABASE cars;
USE cars;

CREATE TABLE cars (
	id INT AUTO_INCREMENT NOT NULL,
    brand VARCHAR(30),
    model VARCHAR(30),
    engine INT,
    price INT,
    max_speed INT,
    PRIMARY KEY (id)
    );
    
INSERT INTO cars (brand, model, engine, price, max_speed) VALUES
	('brand1', 'some_model', 1000, 55200, 220), 
	('brand2', 'some_model', 2000, 155200, 320),
	('brand3', 'some_model1', 3000, 255200, 350);
