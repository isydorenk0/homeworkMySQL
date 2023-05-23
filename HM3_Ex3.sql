-- DROP database HR;

CREATE database HR;
USE HR;

CREATE table address (	
	id INT auto_increment NOT NULL,        
	street VARCHAR(30),
    city VARCHAR(30),
    country VARCHAR(30),
    PRIMARY KEY(id)
);

CREATE table personalinfo (
	id INT auto_increment NOT NULL,        
	first_name VARCHAR(15),
    family_name VARCHAR(25),    
    pers_address_id INT,
    FOREIGN KEY(pers_address_id) REFERENCES address(id),    
    birthday DATE,
    gender VARCHAR(15),
    marital_stat VARCHAR(15),    
    phone VARCHAR(15),
    PRIMARY KEY(id)
);

CREATE table education (	
	id INT auto_increment NOT NULL,        
	edu_name VARCHAR(30),
    degree VARCHAR(30),
    edu_address_id INT,
    FOREIGN KEY(edu_address_id) REFERENCES address(id),
    PRIMARY KEY(id)
);

CREATE table person_edu (	
	id INT auto_increment NOT NULL,        	
    person_id INT,
    FOREIGN KEY(person_id ) REFERENCES personalinfo(id),
    education_id INT,
    FOREIGN KEY(education_id) REFERENCES education(id),
    PRIMARY KEY(id, person_id, education_id)
);

CREATE table departments (
	id INT auto_increment NOT NULL,        
    name VARCHAR(20),
    phone VARCHAR(15),
    location_id INT,
    FOREIGN KEY(location_id) REFERENCES address(id),    
    PRIMARY KEY(id, location_id)
);

CREATE table titles (
	id INT auto_increment NOT NULL,        
    name VARCHAR(30),    
    PRIMARY KEY(id)
);

CREATE table employee (
	id INT auto_increment NOT NULL,
    personalinfo_id INT,
    FOREIGN KEY(personalinfo_id) REFERENCES personalinfo(id), 
    department_id INT,
    FOREIGN KEY(department_id) REFERENCES departments(id),
    title_id INT,
    FOREIGN KEY(title_id) REFERENCES titles(id),
    workphone VARCHAR(15),
    hired DATE,
    dismissed DATE,
    current_status VARCHAR(50),
    PRIMARY KEY(id, department_id, title_id)
);	
