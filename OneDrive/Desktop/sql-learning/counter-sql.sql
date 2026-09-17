-- IMPLEMENT  COUNTER:
use school;
-- implement counter
delimiter //
create procedure counter(inout num int)
begin
set num=num+1;
end //
delimiter ;

-- initiaze a count variable with 0
set @count=0;
call counter(@count);
select @count;

call counter(@count);
call counter(@count);
call counter(@count);

-- for drop
drop procedure counter;
delimiter //
create procedure counter(inout num int)
begin
set num=num+1;
end //
delimiter ;

-- initiaze a count variable with 0
set @count=0;
call counter(@count);
select @count;

call counter(@count);
call counter(@count);
call counter(@count);
select @count;

-- in,inout parameters
delimiter //
create procedure counters(in start_value int,inout count_value int)
begin
set count_value=count_value + start_value;
end //
delimiter ;
set @count = 10;
call counters (5,@count);
select @count;





