-- FINAL PROJECT ***** ANNA GRZYBOWSKA *****

-- CAT ADOPTION MANAGEMENT DATA CENTRE --
-- *** FLUFFY HOME CAT ADDOPTION CENTRE *** --

-- CENTRAL DATA OF MANAGEMENT OF FOUR PLACES WORKING TOGETHER TO FIND COOL HOMES FOR CATS --

-- CENTRAL PLACE -- CALLED: FLUFFY HOME --
	-- INTO FLUFFY HOME MANAGEMENT SYSTEM GOES DATA FROM CENTERS:
		-- 1) CAT PAW SHELTER
		-- 2) FURRY RESCUE SANCTUARY
		-- 3) MIRACLE BREED
		-- 4) MEOWGNIFICENT WHISKERS BREED

-- FLUFFY HOME CENTRE IS A ONE PLACE TO STORE INFORMATION ABOUT AVAILABLE FOR ADDOPTION / RESERVED / ADOPTED CATS FROM FOUR LOCALISATIONS 
-- ASSUMPTION THAT MORE DETAILS ABOUT PERSONAL AND CONTACT DATA OF NEW CAT PARENTS ARE KEPT SAFELY IN PARTICULAR CENRIES

-- ____________________________________________________________________________________________________________________

-- Create relational  DB of your choice with minimum 5 tables
-- Set Primary and Foreign Key constraints to create relations between the tables

CREATE DATABASE FLUFFY_HOME;

USE FLUFFY_HOME;

CREATE TABLE CAT_CENTER_DATA(
	cat_center_id INTEGER,
    cat_center_name VARCHAR(30) NOT NULL,
    CONSTRAINT PK_cat_center_id PRIMARY KEY (cat_center_id));
    
INSERT INTO
CAT_CENTER_DATA (cat_center_id, cat_center_name)
VALUES
	(1, "CAT PAW SHELTER"),
    (2, "FURRY RESCUE SANCTUARY"),
    (3, "MIRACLE BREED"),
    (4, "MEOWGNIFICENT WHISKERS BREED");

SELECT * FROM CAT_CENTER_DATA;

CREATE TABLE CAT_CENTER_ADDRESS(
	address_info_id VARCHAR(3) PRIMARY KEY,
    cat_center_id INTEGER,
    street VARCHAR(50) NOT NULL,
    building_number VARCHAR(5) NOT NULL,
	post_code VARCHAR(10) NOT NULL,
    city VARCHAR(50)
    );

INSERT INTO
CAT_CENTER_ADDRESS (address_info_id, cat_center_id, street, building_number, post_code, city)
VALUES
	("A_1", 1, "Whiskasse", "43", "73-121", "Stargard"),
    ("A_2", 2, "Furriette", "25/3", "70-235", "Szczecin"),
    ("A_3", 3, "Miracatson", "4c/56", "76-658", "Kotogród"),
    ("A_4", 4, "Miminion", "3/4", "71-521", "Miałkołajki");
    
ALTER TABLE CAT_CENTER_ADDRESS
	ADD CONSTRAINT FK_cat_center_id
	FOREIGN KEY (cat_center_id)
	REFERENCES CAT_CENTER_DATA(cat_center_id);

SELECT * FROM CAT_CENTER_ADDRESS;

CREATE TABLE CAT_CENTER_EMAIL(
	email_info_id VARCHAR(3) PRIMARY KEY,
    email_address VARCHAR(30),
    address_info_id VARCHAR(3),
    CONSTRAINT FK_address_id FOREIGN KEY (address_info_id) REFERENCES CAT_CENTER_ADDRESS(address_info_id)
    );

INSERT INTO
CAT_CENTER_EMAIL (email_info_id, email_address, address_info_id)
VALUES
	("E_1", "shelter@catpaw.pl", "A_1"),
    ("E_2", "rescue@furry.pl", "A_2"),
    ("E_3", "breed@miracle.pl", "A_3"),
    ("E_4", "whiskers@meowgnificent.pl", "A_4");
    
SELECT * FROM CAT_CENTER_EMAIL;
    
CREATE TABLE CAT_CENTER_PHONES(
	phone_id VARCHAR(3) PRIMARY KEY,
    phone_number VARCHAR(55) NOT NULL,
	address_info_id VARCHAR(3),
	CONSTRAINT FK_phonetoaddress_id FOREIGN KEY (address_info_id) REFERENCES CAT_CENTER_ADDRESS(address_info_id)
    );
    
INSERT INTO
CAT_CENTER_PHONES (phone_id, phone_number, address_info_id)
VALUES
    ("PH1", 530130150, "A_1"),
    ("PH2", 856124963, "A_2"),
    ("PH3", 697123852, "A_3"),
    ("PH4", 641897235, "A_4");
    
SELECT * FROM CAT_CENTER_PHONES;

CREATE TABLE CAT_PARENTS(
	parent_id VARCHAR(5) PRIMARY KEY,
    parent_first_name VARCHAR(20),
    parent_last_name VARCHAR(30),
    cat_center_id INTEGER,
    CONSTRAINT FK_parent_center_id FOREIGN KEY (cat_center_id) REFERENCES CAT_CENTER_DATA(cat_center_id)
    );
    
INSERT INTO
CAT_PARENTS (parent_id, parent_first_name, parent_last_name, cat_center_id)
VALUES
	("P_01", "Franek", "Puchaty", 1),
    ("P_02", "Igor", "Bubulec", 3),
    ("P_03", "Bruno", "Misialski", 1),
    ("P_04", "Karolina", "Kowalska", 2),
    ("P_05", "Anna", "Polanna", 4),
    ("P_06", "Zofia", "Nowak", 1),
    ("P_07", "Halina", "Pieżyna", 2),
    ("P_08", "Joanna", "Psorska", 3),
    ("P_09", "Igor", "Trelek", 4),
    ("P_10", "Anna", "Myszalska", 4),
    ("P_11", "Katarzyna", "Kocolec", 3),
    ("P_12", "Bruno", "Milutec", 1),
    ("P_13", "Lucjan", "Wanienny", 2),
    ("P_14", "Franciszek", "Brunatny", 3),
    ("P_15", "Izabela", "Bella", 4);    

SELECT * FROM CAT_PARENTS;
    
CREATE TABLE CAT_STATUS(
	cat_status_id VARCHAR(2) PRIMARY KEY,
    cat_status_description VARCHAR(20)
    );
    
INSERT INTO
CAT_STATUS (cat_status_id, cat_status_description)
VALUES
    ("S1", "Available"),
    ("S2", "Reserved"),
    ("S3", "Adopted");

SELECT * FROM CAT_STATUS;

CREATE TABLE CAT_DETAILS(
	cat_details_id VARCHAR(3) PRIMARY KEY,
	cat_name VARCHAR(50),
	breed VARCHAR(20),
    is_lap VARCHAR(3),
    male_female VARCHAR(1),
    age_in_years DECIMAL(3,1),
    temperament VARCHAR(20)
    );

INSERT INTO
CAT_DETAILS (cat_details_id, cat_name, breed, is_lap, male_female, age_in_years, temperament)
VALUES
	("D01","Fluff", "Abyssinian", "YES","F", 3, "Affectionate"),
    ("D02", "Coral", "Bengal", "YES","F", 4, "Friendly"),
    ("D03", "Diablo", "Devon Rex", "YES","M", 1, "Curious"),
    ("D04", "Pumpkin", "Mixed Breed", "NO","M", 3, "Social"),
    ("D05", "Fatty", "Calico", "YES","M", 1, "Active"),
    ("D06", "Softie", "Maine Coon", "YES","F", 0.5, "Playful"),
    ("D07", "Bread", "Mixed Breed", "YES","F", 0.3, "Playful"),
    ("D08", "Mr. Whisker", "Maine Coon", "YES","M", 0.8, "Curious"),
    ("D09", "Princess CHonk", "Ragdoll", "YES","F", 1.5, "Affectionate"),
    ("D10", "Darth Wader", "Mixed Breed", "NO","M", 2, "Quiet"),
    ("D11", "Leia", "Abyssinian", "NO","F", 1, "Active"),
    ("D12", "Chumpkin", "Havana", "YES","F", 1, "Affectionate"),
    ("D13", "Spot", "Mixed Breed", "YES","M", 2, "Playful"),
    ("D14", "Mr. Spock", "Bengal", "YES","M", 8, "Affectionate"),
    ("D15", "Kirk", "Calico", "YES","M", 1, "Friendly"),
    ("D16", "Luck", "Maine Coon", "YES","F", 0.3, "Curious"),
    ("D17", "Diana", "Ragdoll", "YES","F", 0.7, "Friendly"),
    ("D18", "Sky", "Bobtail", "YES","M", 2, "Active"),
    ("D19", "Gluey", "Devon Rex", "YES","F", 1, "Social"),
    ("D20", "Plushee","Bengal", "YES","F", 9, "Affectionate"),
    ("D21", "Queen", "Mixed Breed", "YES","F", 13, "Affectionate"),
    ("D22", "Carrot", "Bobtail", "YES","M", 6, "Affectionate"),
    ("D23", "Duke", "Sphynx", "YES","M", 2, "Playful"),
    ("D24", "Sunny", "Bengal", "YES","F", 4, "Friendly"),
    ("D25", "Dracula", "Calico", "YES","M", 1, "Social"),
    ("D26", "Tiny Fluff", "Bengal", "YES","F", 0.5, "Affectionate"),
    ("D27", "Mr. Bite", "Bengal", "NO","M", 14, "Quiet"),
    ("D28", "Cookie", "Mixed Breed", "YES","M", 0.5, "Curious"),
    ("D29", "Ronda", "Bengal", "YES","F", 3, "Affectionate"),
    ("D30", "Cruncher", "Ocicat", "YES","F", 0.3, "Friendly"),
    ("D31", "Apple Pie", "Mixed Breed", "YES","F", 2, "Affectionate"),
    ("D32", "Lemonade", "Mixed Breed", "YES","F", 2, "Affectionate"),
    ("D33", "Chewie", "Sphynx", "YES","M", 1, "Affectionate"),
    ("D34", "Candy Fluff", "Bengal", "YES","F", 4, "Playful"),
    ("D35", "Octan", "Ocicat", "YES","M", 1, "Affectionate");
  
SELECT * FROM CAT_DETAILS;
  
CREATE TABLE CATS(
	cat_id VARCHAR(3) PRIMARY KEY,
    cat_details_id VARCHAR(3),
    CONSTRAINT FK_cat_details_id FOREIGN KEY (cat_details_id) REFERENCES CAT_DETAILS(cat_details_id),
    cat_status_id VARCHAR(2),
    CONSTRAINT FK_cat_status_id FOREIGN KEY (cat_status_id) REFERENCES CAT_STATUS(cat_status_id),
    cat_center_id INTEGER,
    CONSTRAINT FK_cataddoption_center_id FOREIGN KEY (cat_center_id) REFERENCES CAT_CENTER_DATA(cat_center_id),
    parent_id VARCHAR(5)
    );
    
INSERT INTO
CATS (cat_id, cat_details_id, cat_status_id, cat_center_id, parent_id)
VALUES
	("C01", "D24", "S1", 4, ""),
    ("C02", "D13", "S1", 3, ""),
    ("C03", "D03", "S3", 2, "P_04"),
    ("C04", "D09", "S1", 1, ""),
    ("C05", "D21", "S3", 1, "P_01"),
    ("C06", "D26", "S2", 3, "P_02"),
    ("C07", "D19", "S1", 4, ""),
    ("C08", "D30", "S3", 2, "P_07"),
    ("C09", "D27", "S3", 3, "P_02"),
    ("C10", "D17", "S3", 4, "P_09"),
    ("C11", "D02", "S1", 2, ""),
    ("C12", "D31", "S3", 1, "P_03"),
    ("C13", "D35", "S3", 1, "P_12"),
    ("C14", "D01", "S1", 2, ""),
    ("C15", "D33", "S1", 3, ""),
    ("C16", "D28", "S3", 2, "P_13"),
    ("C17", "D08", "S3", 4, "P_10"),
    ("C18", "D10", "S1", 1, ""),
    ("C19", "D18", "S1", 2, ""),
    ("C20", "D20", "S3", 3, "P_02"),
    ("C21", "D14", "S2", 1, "P_12"),
    ("C22", "D25", "S3", 2, "P_13"),
    ("C23", "D11", "S1", 2, ""),
    ("C24", "D04", "S1", 1, ""),
    ("C25", "D15", "S3", 3, "P_08"),
    ("C26", "D22", "S3", 4, "P_05"),
    ("C27", "D32", "S2", 2, "P_07"),
    ("C28", "D29", "S1", 1, ""),
    ("C29", "D34", "S1", 4, ""),
    ("C30", "D06", "S1", 1, ""),
    ("C31", "D16", "S3", 3, "P_11"),
    ("C32", "D12", "S3", 3, "P_02"),
    ("C33", "D05", "S2", 2, "P_13"),
    ("C34", "D13", "S1", 1, ""),
    ("C35", "D23", "S1", 1, "");

SELECT * FROM CATS;
    
DROP DATABASE FLUFFY_HOME;

DROP TABLE CAT_DETAILS;

DROP TABLE CATS;

-- _________________________________________________________________________

-- SOME SELECT QUERIES

USE FLUFFY_HOME;


SELECT * FROM CAT_CENTER_DATA;
SELECT * FROM CAT_CENTER_ADDRESS;
SELECT * FROM CAT_CENTER_EMAIL;
SELECT * FROM CAT_CENTER_PHONES;
SELECT * FROM CAT_PARENTS;
SELECT * FROM CAT_STATUS;
SELECT * FROM CAT_DETAILS;
SELECT * FROM CATS;

SELECT COUNT(*) FROM CATS WHERE cat_status_id = "S2";
SELECT COUNT(*) FROM CATS WHERE cat_status_id = "S3";

SELECT COUNT(*) FROM CATS WHERE cat_status_id = "S1" AND cat_center_id ="2";

SELECT * FROM CATS WHERE cat_status_id = "S1" AND cat_center_id ="2";

-- ____________________________________________________________________________________________________________________________


-- Using any type of the joins create a view that combines multiple tables in a logical way

-- Example 1.  -  details of all centres:

SELECT a.cat_center_id, d.cat_center_name, e.email_address, p.phone_number, a.city FROM CAT_CENTER_ADDRESS AS a
INNER JOIN CAT_CENTER_EMAIL AS e ON a.address_info_id = e.address_info_id
INNER JOIN CAT_CENTER_DATA AS d ON a.cat_center_id = d.cat_center_id
INNER JOIN CAT_CENTER_PHONES AS p ON a.address_info_id = p.address_info_id;

-- Example 2.  -  connection - parents for each center:

SELECT par.parent_id, par.parent_first_name, par.parent_last_name, d.cat_center_name FROM CAT_PARENTS AS par
INNER JOIN CAT_CENTER_DATA AS d ON par.cat_center_id = d.cat_center_id;

-- Example 3.  -  connection - parents for particular center MIRACLE BREED IN DESCENDING ORDER (BY PARENT id):

SELECT par.parent_id, par.parent_first_name, par.parent_last_name, d.cat_center_name FROM CAT_PARENTS AS par
INNER JOIN CAT_CENTER_DATA AS d ON par.cat_center_id = d.cat_center_id WHERE par.cat_center_id = 3 ORDER BY par.parent_id DESC;

-- Example 4.  -   connection - cats id with status connected with information about center:

SELECT CAT.cat_id,  CAT.cat_status_id, CAT.cat_center_id, D.street, D.building_number, D.post_code, D.city 
FROM CATS AS CAT JOIN CAT_CENTER_ADDRESS AS D ON CAT.cat_center_id = D.cat_center_id 
WHERE CAT.cat_status_id = "S1" 
ORDER BY CAT.cat_center_id;


-- ________________________________________________________________________________________________

-- In your database, create a stored function that can be applied to a query in your DB

-- Example: stored function to return cat status explained (if cat is available, reserved or adoptes)

DELIMITER $$$

CREATE FUNCTION for_adoption(
	cat_status_id VARCHAR(3))
    RETURNS VARCHAR(20)
    
    DETERMINISTIC 
    BEGIN
    
    DECLARE adoption_status VARCHAR(20);
    
    IF cat_status_id = "S1" THEN SET adoption_status = "Available";
    ELSEIF cat_status_id = "S2" THEN SET adoption_status = "Reserved";
    ELSEIF cat_status_id = "S3" THEN SET adoption_status = "Adopted";
    END IF;
    
    RETURN adoption_status;
    
    END $$$
    DELIMITER ;
    
    -- usage of stored function for_adopton:
    
    -- example 1. function used in query - info about cat id combined with details and their status explained (stored function used)
    -- ordered by cat id (ascending)
    
    SELECT c.cat_id, det.cat_name, det.breed, det.male_female, det.age_in_years, det.temperament, for_adoption(c.cat_status_id) FROM CATS AS c
    INNER JOIN CAT_DETAILS AS det ON c.cat_details_id = det.cat_details_id ORDER BY c.cat_id ASC;
    
	-- example 2.  function used in query -  info about cat id combined with details and their status explained (stored function used)
    -- limited to S1 and S2 status - ordered by cat id (ascending)
    
    SELECT c.cat_id, det.cat_name, det.breed, det.male_female, det.age_in_years, det.temperament, for_adoption(c.cat_status_id) FROM CATS AS c
    INNER JOIN CAT_DETAILS AS det ON c.cat_details_id = det.cat_details_id WHERE c.cat_status_id IN ("S1", "S2") ORDER BY c.cat_id ASC;
    
    -- __________________________________________________________________________________________________________________________________
    
    -- Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis 
    
    -- Example: data about adopted cats in particular center  but where center id = 4
    
    SELECT c.cat_id, det.cat_name, det.male_female, det.age_in_years, c.parent_id FROM CATS AS c
    INNER JOIN CAT_DETAILS AS det ON c.cat_details_id = det.cat_details_id WHERE c.cat_status_id IN (
		SELECT c.cat_status_id FROM CATS AS c
        JOIN CAT_PARENTS AS par ON c.parent_id = par.parent_id WHERE par.parent_id LIKE 'P%' 
        ) AND c.cat_center_id = 4;
        
-- _______________________________________________________________________________________________________________________--

-- Create DB diagram where all table relations are shown
-- made separately as EER Diagram

-- __________________________________________________________________________________________________________________________

-- In your database, create a stored procedure and demonstrate how it runs

-- Example 1:  storet procedure to add information about new cat into CAT_DETAILS

DELIMITER ***

CREATE PROCEDURE insert_into(
	IN cat_details_id VARCHAR(3),
    IN cat_name VARCHAR(50),
    IN breed VARCHAR(20),
    IN is_lap VARCHAR(3),
    IN male_female VARCHAR(1),
    IN age_in_years DECIMAL(3,1),
    IN temperament VARCHAR(20))
    
    BEGIN
    
    INSERT INTO CAT_DETAILS(cat_details_id, cat_name, breed, is_lap, male_female, age_in_years, temperament)
    VALUES (cat_details_id, cat_name, breed, is_lap, male_female, age_in_years, temperament);
    
    END ***
    
DELIMITER ;

-- usage of stored procedure:

CALL insert_into("D36", "Mirage", "Devon Rex", "YES","F", 1.5, "Playful");

SELECT * FROM CAT_DETAILS;

-- -- Example 2:  storet procedure to add information about new cat into CATS

DELIMITER ///

CREATE PROCEDURE insert_into_cats(
	IN cat_id VARCHAR(3),
    IN cat_details_id VARCHAR(3),
    IN cat_status_id VARCHAR(2),
    IN cat_center_id INTEGER,
    IN parent_id VARCHAR(5))
    
    BEGIN
    
    INSERT INTO CATS(cat_id, cat_details_id, cat_status_id, cat_center_id, parent_id)
    VALUES (cat_id, cat_details_id, cat_status_id, cat_center_id, parent_id);
        
	END ///
    
DELIMITER ;

-- usage of stored procedure:

CALL insert_into_cats("C36", "D36", "S3", 1, "P_12");

SELECT * FROM CATS;   


-- __________________________________________________________________________________________

-- In your database, create a trigger and demonstrate how it runs

-- Example: trigger to keep newly inserted data into CAT_PARENTS consistent by their format (capitalized first letters of first and last name and keep rest of letters as lowercase)

DELIMITER $$$

CREATE trigger autocapitalize
BEFORE INSERT on CAT_PARENTS 
FOR EACH ROW
BEGIN
	SET NEW.parent_first_name = concat(upper(substr(NEW.parent_first_name, 1, 1)), lower(substr(NEW.parent_first_name FROM 2)));
	SET NEW.parent_last_name = concat(upper(substr(NEW.parent_last_name, 1, 1)), lower(substr(NEW.parent_last_name FROM 2)));
END $$$

DELIMITER ;

-- Example 1.

INSERT INTO CAT_PARENTS
VALUES ("P_16", "oLGierd", "trEE", 2);

SELECT * FROM CAT_PARENTS;

-- Example 2.

INSERT INTO CAT_PARENTS
VALUES ("P_17", "mARTIN", "AcE", 4);

SELECT * FROM CAT_PARENTS;

-- Example 3.

INSERT INTO CAT_PARENTS
VALUES ("P_18", "BrUcE", "lEE", 1);

SELECT * FROM CAT_PARENTS;

-- ___________________________________________________________________________________________________


-- Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis 

-- example 1. - details about cats grouped by cat details id having affectionate temperament - resuts ordered descending by cats age

SELECT c.cat_details_id, c.cat_name, c.male_female, c.age_in_years, c.temperament FROM CAT_DETAILS AS c
GROUP BY c.cat_details_id HAVING c.temperament = "Affectionate" ORDER BY c.age_in_years DESC;

-- example 2. - details about cats grouped by cat details id having affectionate or friendly temperament - resuts ordered descending by cats age

SELECT c.cat_details_id, c.cat_name, c.male_female, c.age_in_years, c.temperament FROM CAT_DETAILS AS c
GROUP BY c.cat_details_id HAVING c.temperament = "Affectionate" OR c.temperament = "Friendly" ORDER BY c.age_in_years DESC;

-- example 3. - information about cat id joined with cat details and joined with center data grouped by cat id having more than 0.5 years

SELECT  cat.cat_id, c.cat_details_id, c.cat_name, c.male_female, c.age_in_years, c.temperament, d.cat_center_name FROM CAT_DETAILS AS c
JOIN CATS AS cat ON c.cat_details_id = cat.cat_details_id
JOIN CAT_CENTER_DATA AS d ON cat.cat_center_id = d.cat_center_id
GROUP BY cat.cat_id HAVING c.age_in_years > 0.5;

-- example 4. - information about cat id joined with cat details and joined with center data grouped by cat id having age in range 1 - 10 years and having temperament quiet or social.

SELECT  cat.cat_id, c.cat_details_id, c.cat_name, c.male_female, c.age_in_years, c.temperament, d.cat_center_name FROM CAT_DETAILS AS c
JOIN CATS AS cat ON c.cat_details_id = cat.cat_details_id
JOIN CAT_CENTER_DATA AS d ON cat.cat_center_id = d.cat_center_id
GROUP BY cat.cat_id HAVING c.age_in_years > 1 AND c.age_in_years < 10 AND c.temperament IN ("Quiet", "Social");

-- _________________________________________________________________________________________________________________

-- Create a view that uses at least 3-4 base tables; 
-- prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis.

-- Example 1 - view of contact info of ceach cat center joined with information about cats


CREATE VIEW VW_CONTACT_INFO AS
	SELECT cn.cat_name, c.cat_center_id, c.cat_center_name, a.street, a.building_number, 
    a.city, e.email_address, p.phone_number
    FROM CAT_CENTER_DATA AS c
    JOIN CAT_CENTER_ADDRESS AS a ON c.cat_center_id = A.cat_center_id
    JOIN CAT_CENTER_EMAIL AS e ON a.address_info_id = e.address_info_id
    JOIN CAT_CENTER_PHONES AS p ON a.address_info_id = p.address_info_id
    JOIN CATS AS cd ON c.cat_center_id = cd.cat_center_id
    JOIN CAT_DETAILS AS cn ON cd.cat_details_id = cn.cat_details_id
    WITH CHECK OPTION;
    
SELECT * FROM VW_CONTACT_INFO ORDER BY c.cat_center_id DESC;

SELECT DISTINCT(cat_center_name) FROM VW_CONTACT_INFO WHERE cat_center_id != 1;

DROP VIEW VW_CONTACT_INFO;

-- Example 2 - view of informatio about cats and their parents together with info about center

CREATE VIEW VW_CATS_INFO AS
	SELECT  ci.parent_id, ci.cat_id, det.cat_name, det.breed, 
    det.is_lap, det.male_female, det.age_in_years, det.temperament, st.cat_status_description,
    info.cat_center_name
    FROM CATS AS ci
    JOIN CAT_DETAILS AS det ON ci.cat_details_id = det.cat_details_id
    JOIN CAT_STATUS AS st ON ci.cat_status_id = st.cat_status_id
    JOIN CAT_CENTER_DATA AS info ON ci.cat_center_id = info.cat_center_id
    WITH CHECK OPTION;
    
SELECT * FROM VW_CATS_INFO ORDER BY ci.parent_id DESC;

SELECT cat_name, breed, male_female, age_in_years, temperament, cat_center_name FROM VW_CATS_INFO WHERE cat_status_description = "Available" ORDER BY temperament ASC;

DROP VIEW VW_CATS_INFO;