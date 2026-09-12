--  TRIGGERS:
use bank;
select * from accounts;
create table transactions(
acc_no int auto_increment primary key,
account int,
type enum('debit','credit'),
amount int,
create_at timestamp default current_timestamp);

-- create trigger after_trasaction_trigger
delimiter //
create trigger after_transaction_trigger
after update
on accounts
for each row
begin
insert into transactions(account,type,amount)
values(old.acc_no,
if(old.amount>new.amount,"debit","credit"),
abs(old.amount - new.amount));
end //
delimiter ;

-- now debit 2000 from 101account
select * from accounts;
update accounts set amount = amount-2000
where acc_no=101;
select * from accounts;

select * from transactions;
update accounts set amount = amount+2000
where acc_no=101;
select * from transactions;

update accounts set amount = amount+2000
where acc_no=103;
select * from transactions;
