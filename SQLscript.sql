CREATE TABLE Person ( 
    NIF VARCHAR2(9) PRIMARY KEY, 
    name VARCHAR(50) NOT NULL
)
;

ALTER TABLE Person ADD surname VARCHAR(50) NOT NULL; 

CREATE TABLE Buyer ( 
    person_NIF VARCHAR2(9) PRIMARY KEY, 
    locality VARCHAR2(20) NOT NULL, 
    FOREIGN KEY (person_NIF) REFERENCES Person(NIF) 
)
;

CREATE TABLE RealEstate( 
    id INT PRIMARY KEY, 
    type VARCHAR2(15), 
    name VARCHAR2(20), 
    capital NUMBER(15,2) 
)
;

CREATE TABLE Salesman ( 
    person_NIF VARCHAR2(9) PRIMARY KEY, 
    job VARCHAR2(15) NOT NULL, 
    realEstate_id INT,
    FOREIGN KEY (person_NIF) REFERENCES Person(NIF),
    FOREIGN KEY (realEstate_id) REFERENCES RealEstate(id)
)
;

CREATE TABLE Home( 
    cadastre_num VARCHAR2(50) PRIMARY KEY, 
    floor_num INT, 
    meters INT,
    deleting_obj INT,
    CHECK (floor_num > 0 AND meters>0) 
)
;

ALTER TABLE Home DROP COLUMN deleting_obj;

-- Relationship table for Favorites
CREATE TABLE Favorites(
    person_NIF VARCHAR2(9),
    home_cadastre VARCHAR2(50),
    score INT CHECK (score BETWEEN 0 AND 5),
    PRIMARY KEY (person_NIF, home_cadastre),
    FOREIGN KEY (person_NIF) REFERENCES Person(NIF),
    FOREIGN KEY (home_cadastre) REFERENCES Home(cadastre_num)
);

-- Relationship table for Represents
CREATE TABLE Represents(
    home_cadastre VARCHAR2(50),
    realEstate_id INT,
    certain_date DATE,
    PRIMARY KEY (home_cadastre, realEstate_id),
    FOREIGN KEY (realEstate_id) REFERENCES RealEstate(id),
    FOREIGN KEY (home_cadastre) REFERENCES Home(cadastre_num)
);

-- Relationship table for Visits
CREATE TABLE Visits(
    buyer_NIF VARCHAR2(9),
    realEstate_id INT,
    home_cadastre VARCHAR2(50),
    PRIMARY KEY (buyer_NIF, realEstate_id, home_cadastre),
    FOREIGN KEY (buyer_NIF) REFERENCES Buyer(person_NIF),
    FOREIGN KEY (realEstate_id) REFERENCES RealEstate(id),
    FOREIGN KEY (home_cadastre) REFERENCES Home(cadastre_num)
);

---- Inserts Section ----
-- RealEstate
INSERT INTO RealEstate (id, type, name, capital) VALUES (1, 'Apartment', 'Downtown Residence', 200000.00);
INSERT INTO RealEstate (id, type, name, capital) VALUES (2, 'House', 'Beachside Villa', 350000.00);
INSERT INTO RealEstate (id, type, name, capital) VALUES (3, 'Apartment', 'Suburban Living', 150000.00);
INSERT INTO RealEstate (id, type, name, capital) VALUES (4, 'House', 'Mountain Retreat', 500000.00);
INSERT INTO RealEstate (id, type, name, capital) VALUES (5, 'Apartment', 'City View Towers', 250000.00);
INSERT INTO RealEstate (id, type, name, capital) VALUES (6, 'House', 'Countryside Estate', 600000.00);
INSERT INTO RealEstate (id, type, name, capital) VALUES (7, 'Apartment', 'Green Park Residence', 220000.00);
INSERT INTO RealEstate (id, type, name, capital) VALUES (8, 'House', 'Lakeside Mansion', 700000.00);
INSERT INTO RealEstate (id, type, name, capital) VALUES (9, 'Apartment', 'Central Plaza', 180000.00);
INSERT INTO RealEstate (id, type, name, capital) VALUES (10, 'House', 'Country Manor', 450000.00);

-- Person
INSERT INTO Person (NIF, name, surname) VALUES ('12345678A', 'Miguel', 'Torres');
INSERT INTO Person (NIF, name, surname) VALUES ('23456789B', 'Ruben', 'Cotagge');
INSERT INTO Person (NIF, name, surname) VALUES ('34567890C', 'Silvia', 'Matamoros');
INSERT INTO Person (NIF, name, surname) VALUES ('45678901D', 'Teresa', 'Steadman');
INSERT INTO Person (NIF, name, surname) VALUES ('56789012E', 'Irene', 'Valrojo');
INSERT INTO Person (NIF, name, surname) VALUES ('67890123F', 'David', 'Gordillo');
INSERT INTO Person (NIF, name, surname) VALUES ('78901234G', 'Elena', 'Nito');
INSERT INTO Person (NIF, name, surname) VALUES ('89012345H', 'Nacho', 'Pistacho');
INSERT INTO Person (NIF, name, surname) VALUES ('90123456I', 'Cristina', 'Pelusa');
INSERT INTO Person (NIF, name, surname) VALUES ('01234567J', 'Javi', 'Paletas');
INSERT INTO Person (NIF, name, surname) VALUES ('12345679K', 'Ivan', 'Yvienen');
INSERT INTO Person (NIF, name, surname) VALUES ('23456780L', 'Marco', 'Elgrande');
INSERT INTO Person (NIF, name, surname) VALUES ('34567891M', 'Esther', 'Molina');
INSERT INTO Person (NIF, name, surname) VALUES ('45678902N', 'Laura', 'Buesa');
INSERT INTO Person (NIF, name, surname) VALUES ('56789013O', 'Josemari', 'Laurel');
INSERT INTO Person (NIF, name, surname) VALUES ('67890124P', 'Claudia', 'Cobaya');

-- Buyer
INSERT INTO Buyer (person_NIF, locality) VALUES ('12345678A', 'Valladolid');
INSERT INTO Buyer (person_NIF, locality) VALUES ('23456789B', 'Burgos');
INSERT INTO Buyer (person_NIF, locality) VALUES ('34567890C', 'Sevilla');
INSERT INTO Buyer (person_NIF, locality) VALUES ('45678901D', 'Granada');
INSERT INTO Buyer (person_NIF, locality) VALUES ('56789012E', 'Lisboa');
INSERT INTO Buyer (person_NIF, locality) VALUES ('67890123F', 'Granada');
INSERT INTO Buyer (person_NIF, locality) VALUES ('78901234G', 'Zaragoza');
INSERT INTO Buyer (person_NIF, locality) VALUES ('89012345H', 'Zaragoza');

-- Salesman
INSERT INTO Salesman (person_NIF, job, realEstate_id) VALUES ('90123456I', 'Agent', 1);
INSERT INTO Salesman (person_NIF, job, realEstate_id) VALUES ('01234567J', 'Manager', 2);
INSERT INTO Salesman (person_NIF, job, realEstate_id) VALUES ('12345679K', 'Agent', 3);
INSERT INTO Salesman (person_NIF, job, realEstate_id) VALUES ('23456780L', 'Assistant', 4);
INSERT INTO Salesman (person_NIF, job, realEstate_id) VALUES ('34567891M', 'Manager', 5);
INSERT INTO Salesman (person_NIF, job, realEstate_id) VALUES ('45678902N', 'Agent', 6);
INSERT INTO Salesman (person_NIF, job, realEstate_id) VALUES ('56789013O', 'Agent', 7);
INSERT INTO Salesman (person_NIF, job, realEstate_id) VALUES ('67890124P', 'Assistant', 8);

-- Home
INSERT INTO Home (cadastre_num, floor_num, meters) VALUES ('H001', 2, 85);
INSERT INTO Home (cadastre_num, floor_num, meters) VALUES ('H002', 3, 120);
INSERT INTO Home (cadastre_num, floor_num, meters) VALUES ('H003', 1, 60);
INSERT INTO Home (cadastre_num, floor_num, meters) VALUES ('H004', 4, 150);
INSERT INTO Home (cadastre_num, floor_num, meters) VALUES ('H005', 2, 95);
INSERT INTO Home (cadastre_num, floor_num, meters) VALUES ('H006', 5, 200);
INSERT INTO Home (cadastre_num, floor_num, meters) VALUES ('H007', 6, 250);
INSERT INTO Home (cadastre_num, floor_num, meters) VALUES ('H008', 2, 75);
INSERT INTO Home (cadastre_num, floor_num, meters) VALUES ('H009', 3, 110);
INSERT INTO Home (cadastre_num, floor_num, meters) VALUES ('H010', 1, 45);

--Favorites
INSERT INTO Favorites (person_NIF, home_cadastre, score) VALUES ('12345678A', 'H001', 4);
INSERT INTO Favorites (person_NIF, home_cadastre, score) VALUES ('23456789B', 'H002', 5);
INSERT INTO Favorites (person_NIF, home_cadastre, score) VALUES ('34567890C', 'H003', 3);
INSERT INTO Favorites (person_NIF, home_cadastre, score) VALUES ('45678901D', 'H004', 2);
INSERT INTO Favorites (person_NIF, home_cadastre, score) VALUES ('56789012E', 'H005', 4);
INSERT INTO Favorites (person_NIF, home_cadastre, score) VALUES ('67890123F', 'H006', 5);
INSERT INTO Favorites (person_NIF, home_cadastre, score) VALUES ('78901234G', 'H007', 1);
INSERT INTO Favorites (person_NIF, home_cadastre, score) VALUES ('89012345H', 'H008', 3);
INSERT INTO Favorites (person_NIF, home_cadastre, score) VALUES ('90123456I', 'H009', 2);
INSERT INTO Favorites (person_NIF, home_cadastre, score) VALUES ('01234567J', 'H010', 4);


--Represents
INSERT INTO Represents (home_cadastre, realEstate_id, certain_date) VALUES ('H001', 1, TO_DATE('2024-01-10', 'YYYY-MM-DD'));
INSERT INTO Represents (home_cadastre, realEstate_id, certain_date) VALUES ('H002', 2, TO_DATE('2024-01-12', 'YYYY-MM-DD'));
INSERT INTO Represents (home_cadastre, realEstate_id, certain_date) VALUES ('H003', 3, TO_DATE('2024-01-14', 'YYYY-MM-DD'));
INSERT INTO Represents (home_cadastre, realEstate_id, certain_date) VALUES ('H004', 4, TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO Represents (home_cadastre, realEstate_id, certain_date) VALUES ('H005', 5, TO_DATE('2024-01-16', 'YYYY-MM-DD'));
INSERT INTO Represents (home_cadastre, realEstate_id, certain_date) VALUES ('H006', 6, TO_DATE('2024-01-18', 'YYYY-MM-DD'));
INSERT INTO Represents (home_cadastre, realEstate_id, certain_date) VALUES ('H007', 7, TO_DATE('2024-01-20', 'YYYY-MM-DD'));
INSERT INTO Represents (home_cadastre, realEstate_id, certain_date) VALUES ('H008', 8, TO_DATE('2024-01-21', 'YYYY-MM-DD'));
INSERT INTO Represents (home_cadastre, realEstate_id, certain_date) VALUES ('H009', 9, TO_DATE('2024-01-22', 'YYYY-MM-DD'));
INSERT INTO Represents (home_cadastre, realEstate_id, certain_date) VALUES ('H010', 10, TO_DATE('2024-01-22', 'YYYY-MM-DD'));


--Visits
INSERT INTO Visits (buyer_NIF, realEstate_id, home_cadastre) VALUES ('12345678A', 1, 'H001');
INSERT INTO Visits (buyer_NIF, realEstate_id, home_cadastre) VALUES ('23456789B', 2, 'H002');
INSERT INTO Visits (buyer_NIF, realEstate_id, home_cadastre) VALUES ('34567890C', 3, 'H003');
INSERT INTO Visits (buyer_NIF, realEstate_id, home_cadastre) VALUES ('45678901D', 4, 'H004');
INSERT INTO Visits (buyer_NIF, realEstate_id, home_cadastre) VALUES ('56789012E', 5, 'H005');
INSERT INTO Visits (buyer_NIF, realEstate_id, home_cadastre) VALUES ('67890123F', 6, 'H006');
INSERT INTO Visits (buyer_NIF, realEstate_id, home_cadastre) VALUES ('78901234G', 7, 'H007');
INSERT INTO Visits (buyer_NIF, realEstate_id, home_cadastre) VALUES ('89012345H', 8, 'H008');
INSERT INTO Visits (buyer_NIF, realEstate_id, home_cadastre) VALUES ('12345678A', 9, 'H009');
INSERT INTO Visits (buyer_NIF, realEstate_id, home_cadastre) VALUES ('23456789B', 10, 'H010');
INSERT INTO Visits (buyer_NIF, realEstate_id, home_cadastre) VALUES ('34567890C', 1, 'H001');
INSERT INTO Visits (buyer_NIF, realEstate_id, home_cadastre) VALUES ('45678901D', 2, 'H002');


----Selects
--We select the whole Persona table for seeing what we have
SELECT * FROM Person;

--We select the NIF from buyers which are from a certain locality, in this case Zaragoza
SELECT person_NIF AS buyers_from_Zaragoza from Buyer WHERE locality = 'Zaragoza';

--Updating the real estate´s capital with id 5 to 550000.00
UPDATE RealEstate
SET capital = 550000.00
WHERE id = 5;

--Deleting a favorite
DELETE FROM Favorites
WHERE person_NIF = '12345678A' AND home_cadastre = 'H001';



--Complex query
--Find the average score that each RealEstate has received for its homes marked as favorites by different people.
--Include only real estate entries that have an average score above a specified one
--List the result ordered by the average score in descending order.

SELECT 
    RealEstate.id AS real_estate_id,
    RealEstate.name AS real_estate_name,
    AVG(Favorites.score) AS avg_score,
    COUNT(Favorites.person_NIF) AS num_of_favorites
FROM 
    RealEstate
JOIN 
    Represents ON RealEstate.id = Represents.realEstate_id
JOIN 
    Home ON Represents.home_cadastre = Home.cadastre_num
JOIN 
    Favorites ON Home.cadastre_num = Favorites.home_cadastre
WHERE 
    RealEstate.capital > 100000 --only considering RealEstate with capital over 100,000
GROUP BY 
    RealEstate.id, RealEstate.name
HAVING 
    AVG(Favorites.score) >= 3 --only include those with an average score of 3 or higher
ORDER BY 
    avg_score DESC, num_of_favorites DESC;

--Find the number of houses that have 3 or more floors
SELECT COUNT(cadastre_num) as homes_with_3_or_more_floors FROM Home WHERE floor_num >= 3;  
