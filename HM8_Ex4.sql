USE MyJoinsDB;

SELECT * FROM contacts;

DROP PROCEDURE IF EXISTS exercise4;

DELIMITER |
CREATE PROCEDURE exercise4 (IN nameInsert VARCHAR(30), IN phoneInsert VARCHAR(15), IN positionInsert varchar(100), IN salaryInsert DOUBLE(15, 2) )
	BEGIN
	DECLARE newId INT;
	
    START transaction;
		INSERT contacts (name, phone) VALUES
			(nameInsert, phoneInsert);
		SET newId = @@IDENTITY;
  
		INSERT work (contact_id, position, salary) VALUES
			(newId, positionInsert, salaryInsert);

		IF EXISTS (SELECT * FROM contacts WHERE name = nameInsert AND id != newId)
		THEN 
			ROLLBACK;
		END IF;
		COMMIT;
END; |

CALL exercise4	( 'Blossom Beard', '317-0182' , 'employee', 123456); |

SELECT * FROM contacts;