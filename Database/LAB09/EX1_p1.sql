------ EX1 Part1
-- inti :
CREATE TABLE CLIENTS  (
ID SERIAL NOT NULL ,
NAME VARCHAR(255) NOT NULL,
CREDIT FLOAT NOT NULL,
PRIMARY KEY(ID)
);
COMMIT;
INSERT INTO CLIENTS(NAME,CREDIT)VALUES('C1',1000),('C2',1000),('C3',1000);
COMMIT;

-- code:
SAVEPOINT SP0;
UPDATE CLIENTS  SET CREDIT = CREDIT-500 WHERE (ID = 1);
UPDATE CLIENTS  SET CREDIT = CREDIT+500 WHERE (ID = 3);
SAVEPOINT SP1;
UPDATE CLIENTS  SET CREDIT = CREDIT-700 WHERE (ID = 2);
UPDATE CLIENTS  SET CREDIT = CREDIT+700 WHERE (ID = 1);
SAVEPOINT SP2;
UPDATE CLIENTS  SET CREDIT = CREDIT-100 WHERE (ID = 2);
UPDATE CLIENTS  SET CREDIT = CREDIT+100 WHERE (ID = 3);
SAVEPOINT SP3;
ROLLBACK;

-- view data 
SELECT * FROM CLIENTS ORDER BY ID;

-- ROLLBACK 
ROLLBACK;

-- view data 
SELECT * FROM CLIENTS ORDER BY ID;

