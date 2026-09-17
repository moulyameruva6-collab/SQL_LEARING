use school;

select * from students;

-- select 8class students data
select * from students
where class = 8;

-- get the students data based on class

delimiter //
create procedure get_students_by_class(in class_no int)
begin
select * from students
where class=class_no;
end //
delimiter ;

-- call stored procedure
call get_students_by_class(6);
call get_students_by_class(7);
call get_students_by_class(8);

-- get the class student count
delimiter //
create procedure get_class_count(in class_no int, out total_count int)
begin
select count(*) into total_count from students
where class = class_no;
end //
delimiter ;

-- define variable
set @count = 0;
call get_class_count(6,@count);
select @count;

set @count = 0;
call get_class_count(7,@count);
select @count;



