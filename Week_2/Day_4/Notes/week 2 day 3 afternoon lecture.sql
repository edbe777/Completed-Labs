USE bank;
select 2000;  -- returns 2000
select 10+5;  -- returns 15
select 10>5;  -- returns 1
select null;  -- returns null
select null+10;  -- returns null + 10
select null>10;  -- returns null>10
select 100;     -- returns 100
select count(100);  -- returs 1

select * from bank.order;   -- there are some empty rows
select * from bank.order 
where k_symbol is null;      -- check is any rows are null, returns nothing

select sum(isnull(k_symbol)) from bank.order;  -- sum returned values for column k_symbol, returns 0
select * from bank.order 
where (k_symbol is not null) and (k_symbol = ' ');

select *, concat('*', k_symbol, '*')from bank.order;     -- test for empty string, returns * * for the empty rows, so not null

select * from bank.account
where frequency in ('POPLATEK MESICNE', 'POPLATEK TYDNE');  

select * from bank.district 
where A1 between 5 and 10;   -- equivalent to >= to 5 and <10, so it INCLUDES 5

select * from bank.district 
where A3 like 'north%'; -- %, _ stand for any characters, WILDCARD character

-- -------------------------Activity 2----------------------------------------------------------------------------------------------------------
-- Get transactions in the first 15 days of 1993.
SELECT * FROM `bank`.`trans`;
SELECT * from bank.trans 
where CONVERT(date, DATE) between '1993-01-01' and '1993-01-15';
-- areks solution -- select * from trans where cast(date as DATE) between '1993-01-15'   
-- -------------------------------------------------------------------------------------------------------------
select * from bank.loan;
select status, avg(amount) 
from bank.loan 
where status = 'A';   -- to find the average amount in the loan status in category A

select status, avg(amount) 
from bank.loan 
group by status 
order by status;  -- will group by all statuses, applies average to all status categories
                                      
select status, count(status), avg(amount) 
from bank.loan 
group by status 
order by status;   -- make a new column count status and count the number of loans in each category

select k_symbol, SUM(amount) as sum       
from bank.trans 
where k_symbol <> ' ' 
group by k_symbol 
order by sum asc;                   -- new column as sum as a sum of the amount of loans in transaction table, loan table is much shorter

select bank_to, k_symbol, SUM(amount) as sum       -- sum amount for each k_symbol and bank ALSO need to ass in group by below
from bank.order 
where k_symbol <> ' ' 
group by k_symbol, bank_to 
order by bank_to, k_symbol asc;

select bank_to, k_symbol, SUM(amount) as sum       -- sum amount for each k_symbol and bank ALSO need to ass in group by below
from bank.order 
where k_symbol <> ' ' and bank_to <> 'AB'      -- where deals with individual rows, cannot use aggregate clause like SUM here
group by k_symbol, bank_to 
order by bank_to, k_symbol asc;

select bank_to, k_symbol, SUM(amount) as sum       -- sum amount for each k_symbol and bank ALSO need to ass in group by below
from bank.order 
where k_symbol <> ' '
group by k_symbol, bank_to 
having sum(amount)>100000                -- after we have grouped can we look at the sum amount and check if its > 100,000
order by bank_to, k_symbol asc;

select duration, avg(amount-payments) as avg_balance       -- calculate average balance for each duration
from bank.loan
group by duration;

select *, duration, avg(amount-payments) over (partition by duration)
from bank.loan;







