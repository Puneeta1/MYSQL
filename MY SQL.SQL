--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--********************************************** PUNEET SHARMA ***********************************************
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- This Is Single Line Comment

/* This Is 
   Mulltipl Line Comment */
-----------------------------------------------
CREATE DATABASE Data_Base_Name; -- DataBase Is Created

DROP DATABASE Data_Base_Name; -- DataBase Is Drop
-----------------------------------------------

CREATE DATABASE Collage; -- DataBase Is Created

USE Collage; -- DataBase Is Use

----------------------------------------------------------------------------------------------


CREATE TABLE Student -- Student Table Is Create 
(
 StudentId          INT(3)             PRIMARY KEY CHECK (StudentId>1000),
 StudentName        VARCHAR(20)        NOT NULL ,
 Class              VARCHAR(10)        NOT NULL,
 Phone              BIGINT(10)         UNIQUE NULL,
 Email              VARCHAR(30)        UNIQUE NULL,
 Address            VARCHAR(30)        NOT NULL,
 GUID               CHAR(4)            REFERENCES Guardian(GUID)
);

INSERT INTO Student -- Insert Valuse Student Table
(StudentId,StudentName,Class,Phone,Email,Address,GUID)
VALUES
(101,'Amit Sharma','1st year',9827487671,'Amitsharma@gmail.com','Partap Nager Sanganer Jaipur',1001),
(102,'Bhavesh Surmani','2st year',9827487674,'Bhaveshsurmani@gmail.com','Govind Pura Sanganer Jaipur',1002),
(103,'Sumit Sharma','1st year',9823487672,'Sumitsharma@gmail.com','Partap Nager Sanganer Jaipur',1003),
(104,'Ravi Kummar','3st year',9826487673,'Ravikummar@gmail.com','3 Sector Sanganer Jaipur',1004),
(105,'Gopal Kummar','2st year',9826487675,'Gopalkummar@gmail.com','Partap Nager Sanganer Jaipur',1005),
(106,'Manish Jain','2st year',9825488676,'Manishjain@gmail.com','11 Sector Sanganer Jaipur',1006),
(107,'Navneet Singh','1st year',9826487677,'Navneetsingh@gmail.com','5 Sector Sanganer Jaipur',1007),
(108,'Ashok Sha','1st year',9827389678,'Ashoksha@gmail.com','Partap Nager Sanganer Jaipur',1008),
(109,'Rakesh Surmani','3st year',9827236679,'Rakeshsurmani@gmail.com','3 Sector Sanganer Jaipur',1009),
(110,'Gopal Das','1st year',9827445670,'Gopaldas@gmail.com','Partap Nager Sanganer Jaipur',1010);

--------------------------------------------------------------------------------------------------------------

CREATE TABLE Guardian -- Guardian Table Is Create
(
 GUID              int(4)                     PRIMARY KEY CHECK (guid>100),
 GName             varchar(20)                NOT NULL,
 Phone             bigint(10)                 NOT NULL UNIQUE,
 City              varchar(10)                NOT NULL DEFAULT 'Jaipur'
) ;

INSERT  INTO Guardian -- Insert Valuse Guardian Table
(GUID, GName,Phone,City) 
VALUES

(1001,'Gopal Sharma',9878566431,''),
(1002,'Mhaveer Surmani',9878566432,'Jaipur'),
(1003,'Gopal Sharma',9878566433,'Jaipur'),
(1004,'Sameer Kummar',9878566434,'Jaipur'),
(1005,'Rohit Kummar',9878566435,'Jaipur'),
(1006,'Sorav Jain',9878566436,'Jaipur'),
(1007,'Deewan Singh',9878566437,'Jaipur'),
(1008,'Ali Sha',9878566438,''),
(1019,'Bhavesh Surmani',9878566439,'Jaipur'),
(1010,'Suraj Das',9878566430,'Jaipur');

--===========================================================================================================--
-- Example
CREATE TABLE Attendance -- This Is A Employee Table
(
 RollNumber             INT(3),
 StudentName            VARCHAR(20),
 AttendanceStstus       VARCHAR(20),
 AttendanceDate         DATE               NOT NULL,
 Phone                  BIGINT(10)         UNIQUE NULL
);

INSERT INTO Attendance (RollNumber,StudentName,AttendanceStstus,AttendanceDate,phone)
VALUES
(101,'Amit Sharma','Present','2022/04/20',9827487671),
(102,'Bhavesh Surmani','Present','2022/04/20',9827487674);

---------------------------------------------------------------------------------------------------------------

UPDATE Attendance  -- Update Column To a Reation
SET AttendanceStstus = 'Absent'
WHERE RollNumber = 102;

DELETE FROM Attendance -- Delect Row To a Reation
Where RollNumber =101;

ALTER TABLE Attendance -- Add Primary Key To a Relation
ADD PRIMARY KEY (RollNumber); 

ALTER TABLE Attendance -- Add Foreign Key To a Relation
ADD FOREIGN KEY (phone)
REFERENCES Student(phone);

ALTER TABLE Attendance -- Add Constraint Unique to an existing attribute
ADD UNIQUE(phone);

ALTER TABLE Attendance -- Add an Attribute to an existing Table
ADD City CHAR(20);

ALTER TABLE Attendance -- Modify Datatype of an Attribute
MODIFY City VARCHAR(40);

ALTER TABLE Attendance -- Remove an Attribute
DROP City;

ALTER TABLE Attendance -- Remove an Attribute
DROP PRIMARY KEY;

DELETE FROM Attendance; -- Table Is Delete

DROP TABLE Attendance; -- Table Is Drop 

---------------------------------------------------------------------------------------------------------------

DESCRIBE Student; -- This Is Describe Steatment For Student Table

SHOW DATABASES; -- This Is Show All DataBase

SHOW TABLES; -- This Is Show All Table IN DataBase

CREATE UNIQUE INDEX index_name -- CREATE INDEX
ON Student (StudentName);

--===========================================================================================================--

SELECT 4+5 AS 'Addision'; -- This Steatment Is add Number and Aliases

SELECT 'Hello Friends My Name Is Puneet !!' AS 'This Is text'; -- This Steatment Is Show Text and Aliases

SELECT * FROM Student; -- This Is Select Steatment For Student

SELECT GName FROM Guardian; -- This Is Select Steatment For Guardian

SELECT DISTINCT Address FROM Student; -- This is Distinct Steatment Show the Unique Values

SELECT * FROM Student -- This Is Condision Steatment 'Where'
WHERE StudentId=101;

SELECT * FROM Student -- This Is IN Operators
WHERE StudentId IN (101,102,103);

SELECT * FROM Student -- This Is BETWEEN Operators
WHERE StudentId BETWEEN 101 AND 105;

SELECT * FROM Student -- This Is And Steatment
WHERE Class = '1st year' AND Address = 'Partap Nager Sanganer Jaipur';

SELECT * FROM Student -- This Is OR Steatment
WHERE Class = '3st year' OR Address = 'Partap Nager Sanganer Jaipur';

SELECT StudentId FROM Student -- This Is Order by Steatment Ascending Order 
ORDER By StudentId Asc;

SELECT * FROM Student -- This Is Order by Steatment Decending Order 
ORDER By StudentId DESC;

--===========================================================================================================--

/*  Like Opresion */


SELECT * FROM Student 
WHERE StudentName LIKE '%as%';

SELECT * FROM Student 
WHERE StudentName LIKE '_____Kummar';

SELECT * FROM Student 
WHERE StudentName LIKE 'B%';

SELECT * FROM Student 
WHERE StudentName LIKE '%a';

SELECT * FROM Student 
WHERE StudentName LIKE 'G_p%';

SELECT * FROM Student -- This Is NOT Operators
WHERE StudentName NOT LIKE '%a';

--==========================================================================================================--

SELECT Studentid from Student -- This Is 'Sub Query'
WHERE GUID =(SELECT MAX(GUID) FROM Student);

SELECT GUID FROM Guardian -- This Is 'Union'
UNION
SELECT GUID FROM Student;

SELECT GUID FROM Guardian -- This Is 'Union' And 'All' 
UNION ALL
SELECT GUID FROM Student;

SELECT * FROM Student , Guardian; -- This Is 'Cartision Poduct'


SELECT * FROM Guardian G,Student S -- This Is a Simple Join Quary
WHERE  G.GUID = S.GUID;

SELECT Guardian.GName , Student.CLASS , Guardian.Phone -- This Is Inner Join KeyWord
FROM Guardian
INNER JOIN Student
ON Guardian.GUID = Student.Studentid;

SELECT Guardian.GName , Student.StudentName -- This Is left Join 
FROM Guardian
LEFT JOIN Student
ON Guardian.GUID = Student.StudentId
ORDER BY Guardian.GNAME ASC;

SELECT Guardian.GNAME , Student.StudentName -- This Is Right Join
FROM Guardian
RIGHT JOIN Student
ON Guardian.GUID = Student.StudentId
ORDER BY Guardian.GNAME ASC;


SELECT Class, COUNT(Class) AS 'Class' FROM Student -- This Is Group By
GROUP BY Class;

-- MINUS AND INTER SECIT or group by and user


SELECT Studentid,StudentName, IF(class>2, "Old Student", "New Student") AS 'ALL Student'
FROM Student;











SELECT StudentName, Phone,Email, -- This Is Case Statment

CASE

    WHEN Class LIKE '1%' THEN "This Is student stady in 1st Class Student"

    WHEN Class LIKE '2%' THEN "This Is student stady in 2nd Class Student"

    ELSE "This Is student stady in Final Class Student"

END AS 'Student Class'

FROM Student ORDER BY CLASS;


--===========================================================================================================--
/* User */

SELECT SESSION_USER();
SELECT SYSTEM_USER();
SELECT USER();
SELECT VERSION();


--===========================================================================================================--
/* Numeric Function */

SELECT MOD(5,3);

SELECT ROUND(16.78);

SELECT POWER(6,2);

--===========================================================================================================--

--===========================================================================================================--
/* String Functions */

SELECT UPPER('Puneet Sharma') AS 'UPPER';

SELECT LOWER('Puneet Sharma') AS ' LOWER';

SELECT LEFT('Puneet Sharma',6) AS 'LEFT';

SELECT RIGHT('Puneet Sharma',6) AS 'RIGHT';

SELECT LENGTH('Puneet Sharma') AS 'LENGTH';

select SUBSTRING('Puneet Sharma',8,4) AS 'SUBSTRING';

SELECT INSTR('Puneet Sharma','Sha') AS 'INSTR';

SELECT LENGTH(LTRIM('   Puneet  ')) AS 'LTRIM';

SELECT LENGTH(RTRIM('   Puneet  ')) AS 'RTRIM';

SELECT LENGTH(TRIM('   Puneet  ')) AS 'TRIM';

--===========================================================================================================--
--===========================================================================================================--
/* Date Time Functions */

SELECT NOW();

SELECT DATE('1999-9-9');

SELECT YEAR('1999-9-9');

SELECT MONTH('1999-9-9');

SELECT MONTHNAME('1999-9-9');

SELECT DAY('1999-9-9');

SELECT DAYNAME('1999-9-9');

--===========================================================================================================--
--===========================================================================================================--
/* Aggregate Functions */

SELECT COUNT(GUID) FROM Guardian;

SELECT AVG(GUID) Guardian;

SELECT MAX(GUID) FROM Guardian;

SELECT MIN(GUID) FROM Guardian;

--===========================================================================================================--