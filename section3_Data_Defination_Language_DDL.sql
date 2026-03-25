----------------------------- CREATE Command --------------------------
/* CREATE command creates the empty table of define structure
	create table with id, person_name, birth_date, phone_no
*/


CREATE TABLE persons(
	id INT NOT NULL,
	person_name VARCHAR(20) NOT NULL,
	birth_date DATE,
	phone_no VARCHAR(20) NOT NULL ---AS THIS ARE THE IMPORTANT INFORMATION FOR THE CONTACT.
	--ADDING PRIMARY KEY
	CONSTRAINT PK_PERSON PRIMARY KEY (id)
	/*
	pk_person is name given to the constraint 
	- Easier to identify in error messages (instead of seeing "PRIMARY KEY violation",
	you’ll see "PK_PERSON violation").

*/
)


/*
	In SQL, the CONSTRAINT keyword is used to define rules on table columns to ensure data integrity, 
	accuracy, and consistency. It prevents invalid data from being inserted or updated, making sure the database always follows business logic and structural requirements.
*/




------------------------------------ ALTER TABLE ----------------------------------------
--- THIS command is use to change the structure of an existing table.
--- like adding new column etc.

--- add the new column

ALTER TABLE persons
ADD email VARCHAR(20) NOT NULL


--- DELETE the column phone no from the persons table
ALTER TABLE persons
DROP COLUMN phone_no 

---------------------------------------- DROP command ------------------------------------------
--- this command will drop everything and delete the table permanently
DROP TABLE persons

SELECT * FROM persons