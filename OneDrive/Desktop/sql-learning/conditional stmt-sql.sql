-- CONDITIONAL STATEMETS:
-- define one procedure find the number is even or odd
delimiter //
create procedure even_or_odd(in num int)
begin
if n%2=0 then
select "even";
else
select "odd";
end if;
end //
delimiter ;

call even_or_odd(10);
call even_or_odd(15);

DROP PROCEDURE IF EXISTS even_or_odd;

DELIMITER //

CREATE PROCEDURE even_or_odd(IN num INT)
BEGIN
    IF num % 2 = 0 THEN
        SELECT 'Even' AS result;
    ELSE
        SELECT 'Odd' AS result;
    END IF;
END //

DELIMITER ;
call even_or_odd(10);
call even_or_odd(15);

delimiter //
CREATE PROCEDURE positive_or_negitive(IN num INT)
BEGIN
if num > 0 THEN
SELECT 'positie';
elseif num < 0 then
SELECT 'negitive';
Else
select 'Zero';
END IF;
END //
DELIMITER ;
call positive_or_negitive(10);
call positive_or_negitive(-15);
call positive_or_negitive(0);

