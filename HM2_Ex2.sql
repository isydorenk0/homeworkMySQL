DROP database Warehouse;

CREATE database Warehouse;
USE Warehouse;

CREATE table company (
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(30),
    phone VARCHAR(15),
    address VARCHAR(200),
    email VARCHAR(50),
    PRIMARY KEY(id)    
);

INSERT into company
	(name, phone, address, email)
    VALUE ('ABC Inc', '+123456789', 'ABC Street, City, Country', 'abc@abc.com');

CREATE table warehouse (
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(30),
    phone VARCHAR(15),
    address VARCHAR(200),
    email VARCHAR(50),
    PRIMARY KEY(id)    
);

INSERT into warehouse
	(name, phone, address, email)
    VALUE ('QWE Inc', '+987654321', 'QWE Street, City, Country', 'qwe@qwe.com');

CREATE table comp_wareh (	
	id INT AUTO_INCREMENT NOT NULL,
    company_id INT NOT NULL,
    FOREIGN KEY(company_id) REFERENCES company(id),
    warehouse_id INT NOT NULL,
    FOREIGN KEY(warehouse_id) REFERENCES warehouse(id),
    PRIMARY KEY(id,company_id, warehouse_id)    
);

INSERT into comp_wareh
	SET company_id = (
		SELECT id FROM company WHERE name = 'ABC Inc'),
    warehouse_id = (
		SELECT id FROM warehouse WHERE name = 'QWE Inc');

CREATE table items (	
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(30),
    description VARCHAR(500),
    PRIMARY KEY(id)   
);

CREATE table clients (
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(30),
    phone VARCHAR(15),
    address VARCHAR(200),
    email VARCHAR(50),
    PRIMARY KEY(id)    
);

CREATE table inventory (	
    id INT AUTO_INCREMENT NOT NULL,    
    status VARCHAR(100),
    quantity INT,
    date DATETIME,
    item_id INT,
    FOREIGN KEY(item_id) REFERENCES items(id),
    warehouse_id INT,
    FOREIGN KEY(warehouse_id) REFERENCES warehouse(id),
    supplier_id INT,
    FOREIGN KEY(supplier_id) REFERENCES clients(id),    
    PRIMARY KEY(id,date,item_id,warehouse_id,supplier_id)   
);

CREATE table orders (	
    id INT AUTO_INCREMENT NOT NULL,    
    status VARCHAR(100),
    quantity INT,
    date DATETIME,
    item_id INT,
    FOREIGN KEY(item_id) REFERENCES items(id),
    warehouse_id INT,
    FOREIGN KEY(warehouse_id) REFERENCES warehouse(id),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES clients(id),    
    PRIMARY KEY(id,date,item_id,warehouse_id,customer_id)   
);
