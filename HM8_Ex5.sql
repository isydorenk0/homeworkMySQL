USE MyJoinsDB;

SELECT * FROM contacts;|    

DELIMITER |
CREATE PROCEDURE selectAllInfo(IN nameSelect VARCHAR(30))
BEGIN 
SELECT * FROM contacts
	INNER JOIN	work
		ON contacts.id = work.contact_id
	INNER JOIN family
        ON contacts.id = family.contact_id			
	WHERE name = nameSelect;
End| 

CALL selectAllInfo("Keegan Hale"); |

DROP TRIGGER IF EXISTS onDelete;|

CREATE TRIGGER onDelete
BEFORE DELETE ON contacts 
FOR EACH ROW 
  BEGIN
    DELETE FROM work WHERE id = OLD.id;
    DELETE FROM family WHERE id = OLD.id;
 END; |
 
 SET SQL_SAFE_UPDATES = 0; |
 DELETE FROM contacts WHERE name = 'Keegan Hale'; |
 
CALL selectAllInfo("Keegan Hale"); |

SELECT * FROM contacts;|    
SELECT * FROM family;|
SELECT * FROM work;|
    
    