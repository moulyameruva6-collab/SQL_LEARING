create database bank;
use bank;
USE bank;

CREATE TABLE accounts (
    acc_no INT PRIMARY KEY,
    name VARCHAR(50),
    amount DECIMAL(10,2)
);

INSERT INTO accounts(acc_no, name, amount)
VALUES
(101, 'moulya', 10000),
(102, 'shannu', 1500),
(103, 'mouni', 5000),
(104, 'charan', 1000),
(105, 'ram', 4000),
(106, 'seetha', 6000),
(107, 'ravi', 5000),
(108, 'hari', 4500);

select * from accounts;

begin;
-- create 2000 to 103 account
update accounts set amount=amount+2000
where acc_no = 103;
select * from accounts;

-- debit 2000  to 103 account
update accounts set amount=amount-2000
where acc_no = 103;
select * from accounts;
commit;

update accounts set amount=amount-2000
where acc_no = 109;
select * from accounts;
commit;
rollback;

-- save point
-- transfer 1000  from 101 to 104 and 105
begin;
update accounts set amount=amount-1000
where acc_no=101;

update accounts set amount=amount+1000
where acc_no=104;

update accounts set amount=amount+1000
where acc_no=105;

select * from accounts;

savepoint sp1;
#transfering 1000 rupees from 101 to 104
update accounts set amount=amount-1000
where acc_no=101;

update accounts set amount=amount+1000
where acc_no=104;
rollback;
select * from accounts;
update accounts set amount=amount+13000
where acc_no=101;

select * from accounts;

update accounts set amount=amount+10000
where acc_no = 101;
select * from accounts;

rollback to sp1;

BEGIN;

UPDATE accounts
SET amount = amount - 1000
WHERE acc_no = 101;

UPDATE accounts
SET amount = amount + 1000
WHERE acc_no = 104;

SAVEPOINT sp1;

UPDATE accounts
SET amount = amount - 1000
WHERE acc_no = 101;

UPDATE accounts
SET amount = amount + 1000
WHERE acc_no = 104;

SELECT * FROM accounts;

ROLLBACK TO sp1;

SELECT * FROM accounts;

COMMIT;





