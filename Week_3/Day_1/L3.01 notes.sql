DROP DATABASE bank_demo;
CREATE DATABASE bank_demo;

CREATE DATABASE IF NOT EXISTS bank_demo;

DROP DATABASE bank_demo;

DROP DATABASE IF EXISTS bank_demo;

USE bank_demo;

DROP TABLE IF EXISTS district_demo;

CREATE TABLE IF NOT EXISTS district_demo (
district_id int,
district_name varchar(50),    -- you have to define the max length (50) of the column beforehand
region_name varchar(50),
population int,
average_salary float      -- no comma after the last element in the list
);

SELECT * FROM district_demo;

INSERT INTO district_demo(district_id, district_name, region_name, population, average_salary) 
VALUES (1,'Hl.m. Praha','Prague',123456,159);
select * from bank_demo.district_demo;
SELECT * FROM district_demo;

-- multiple rows, type interpretation, appends, does not override
INSERT INTO district_demo(district_id, district_name, region_name, population, average_salary) 
VALUES
(2,'Benesov','central Bohemia',87756.33,'234'),             -- converts FLOAT number into INT automatically
(3,'Beroun','central Bohemia',84623,149);
SELECT * FROM district_demo;

-- atomicity of statement, irreconcilable type interpretations
INSERT INTO district_demo(district_id, district_name, region_name, population, average_salary)
VALUES
(4,'Kladno','central Bohemia',2000,130),
(5,'Hl.p. Praha','Prague','over nine million',251);  -- if a statement fails, then the whole statement will not be executed
SELECT * FROM district_demo;

-- no constraints
INSERT INTO district_demo(district_id, district_name, region_name, population, average_salary) 
VALUES
(1,'Hl.m. Praha','Prague',123456,159),
(2,'Benesov','central Bohemia',87756,234),
(3,'Beroun','central Bohemia',84623,149),
(4,'Kladno','central Bohemia',20000,130);
SELECT * FROM district_demo;

DROP TABLE IF EXISTS district_demo;

-- contraints on content
CREATE TABLE IF NOT EXISTS district_demo (
district_id SERIAL,         -- int number starting at 1, gets the next highest number after
district_name varchar(50) UNIQUE NOT NULL,    -- no same name (unique), and not null 
region_name varchar(50) DEFAULT NULL,       -- default null or default 'unknown'
population int DEFAULT 0,   -- null is better than 0 in this case, population is never 0, just unknown (null)
average_salary float DEFAULT NULL
);
SELECT * FROM district_demo;

INSERT INTO district_demo(district_name, region_name, population, average_salary)   -- leave out district_id, system will assign value for that
VALUES
('Hl.m. Praha','Prague',123456,159),
('Benesov','central Bohemia',87756,234);
SELECT * FROM district_demo;

-- protected from duplicates
INSERT INTO district_demo(district_name, region_name, population, average_salary) 
VALUES
('Benesov','central Bohemia',87756,234),
('Beroun','central Bohemia',84623,149),
('Kladno','central Bohemia',20000,130);

-- default values. Notice SERIAL "issue" skips 3,4,5 because of previous statement error
INSERT INTO district_demo(district_name, region_name, average_salary) 
VALUES
('Beroun','central Bohemia',149),
('Kladno','central Bohemia',130);
SELECT * FROM district_demo;

-- another table and constraints..
DROP TABLE IF EXISTS account_demo;

CREATE TABLE account_demo (
  account_id SERIAL,
  district_id int DEFAULT NULL,
  frequency text,
  date int DEFAULT NULL
) ;

INSERT INTO account_demo(district_id,frequency,date) 
VALUES
(4,'POPLATEK MESICNE',950324),
(1,'POPLATEK MESICNE',930226),
(5,'POPLATEK MESICNE',970707);
SELECT * FROM account_demo;

SELECT *                -- error because we don't ahve the district_id 4,5 originally 
FROM district_demo
JOIN account_demo
USING(district_id);   -- using not on because both columns have the district_id 
select * from district_demo;

-- what is the issue? REFERENTIAL INTEGRITY
DROP TABLE IF EXISTS district_demo;

-- contraints on content
CREATE TABLE IF NOT EXISTS district_demo (
district_id SERIAL PRIMARY KEY,            -- you need to tell the system that this is a primary key
district_name varchar(50) UNIQUE NOT NULL,
region_name varchar(50) DEFAULT NULL,
population int DEFAULT 0,
average_salary float DEFAULT NULL
);

INSERT INTO district_demo(district_name, region_name, population, average_salary) 
VALUES
('Hl.m. Praha','Prague',123456,159),
('Benesov','central Bohemia',87756,234),
('Beroun','central Bohemia',84623,149),
('Kladno','central Bohemia',20000,130);
SELECT * FROM district_demo;

DROP TABLE IF EXISTS account_demo;

CREATE TABLE account_demo (
  account_id SERIAL PRIMARY KEY,
  district_id bigint unsigned NOT NULL,  -- bigint is an int >2 billion, usually int is sufficient, need to specify unsigned
  frequency text,
  date int DEFAULT NULL,
  CONSTRAINT FOREIGN KEY (district_id) REFERENCES district_demo(district_id)      -- this statement is crucial to differentiate keys
);

INSERT INTO account_demo(district_id,frequency,date)   -- get error because 5 in last row district_id 
VALUES
(4,'POPLATEK MESICNE',950324),
(1,'POPLATEK MESICNE',930226),
(5,'POPLATEK MESICNE',970707);

INSERT INTO account_demo(district_id,frequency,date)  -- correct
VALUES
(4,'POPLATEK MESICNE',950324),
(1,'POPLATEK MESICNE',930226),
(4,'POPLATEK MESICNE',970707);

SELECT * FROM account_demo;

SELECT * 
FROM district_demo
JOIN account_demo
USING(district_id);
 
 
-- IS THERE AN ACTIVITY HERE? 
 -- 2 Now use the bank database to make the following changes: Use the insert command to create a new entry in the loan table with the following values 
 -- (8000,8000000,930705,96396,12,8033.0,'C'). Here each element corresponds to the values in columns in the table (in the order the columns appear in the table). 
 -- This might raise an error. Why is that?
 -- use bank;
 INSERT INTO bank.loan(loan_id,account_id,date,amount,duration,payments,status)  
VALUES
(8000,8000000,930705,96396,12,8033.0,'C');
 select * from bank.loan;
 -- Use the delete command to delete an entry from the table account where the account_id is 11382. Does this result in an error? If it does, then why?
 delete from bank.loan       -- works with bank.account
 where account_id = 11382;
 
 
-- changing tables
ALTER TABLE account_demo
MODIFY date date;

SELECT * FROM account_demo;

ALTER TABLE account_demo
RENAME TO accountDemo;     -- give table a new name

ALTER TABLE district_demo
RENAME COLUMN district_id to dist_id;        -- can rename column but need to specify column

SELECT * FROM district_demo;

INSERT INTO district_demo(district_name, region_name, population, average_salary) 
VALUES
('Hl.p. Praha','Prague',20000,130);

ALTER TABLE accountDemo
ADD COLUMN balance int AFTER date;   -- can specify which column it goes after

SELECT * FROM accountDemo;

-- watch out for defaults!
ALTER TABLE accountDemo
ADD COLUMN balance2 int NOT NULL AFTER balance;   -- you have to specify not null , so the values will be 0

SELECT * FROM accountDemo;

-- activity 2.6.4
use bank;
-- Design and create a new database structure. At least 3 changes. Don't execute the statements. Justify your changes.
-- Some ideas include renaming columns to ones that make more sense and, for eg., in the table district, adding foreign keys wherever necessary.

-- change the column names under district to meaningful names, separated by commas
-- change disp table to disposition 
-- modifying the dates, changing the data type from string/int to date
-- most of the tables have account_id, use as a foreign key (except in account table)
select * from disp;
select * from account;


-- DELETE AND DROP

DELETE FROM accountDemo
WHERE account_id=1;

SELECT * FROM accountDemo;

DELETE FROM accountDemo;

SELECT * FROM accountDemo;

DROP TABLE accountDemo;

SELECT * FROM accountDemo;

-- UPDATE
use bank_demo;

SELECT * FROM district_demo;

UPDATE district_demo
SET population = 0, average_salary = 0
WHERE region_name = 'Prague';

SELECT * FROM district_demo;

UPDATE district_demo
SET population = 1;

SELECT * FROM district_demo;

-- ACTIVITY 2.7.1 1 - watch out, bad idea
-- instead change activity to change accountDemo to "north" if district_id > 3 and "south otherwise

ALTER TABLE accountDemo
ADD location VARCHAR(30);

SELECT * FROM accountDemo;

UPDATE accountDemo set location =
  CASE
  WHEN district_id > 3 THEN 'north' 
  ELSE 'south'
  END;

SELECT * FROM accountDemo;
