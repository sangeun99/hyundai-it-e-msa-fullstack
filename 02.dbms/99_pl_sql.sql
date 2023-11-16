set serveroutput on

begin
    for i in 1..10 loop
        dbms_output.put_line('Hello World!');
    end loop;
end;
/

-- if문 실습

drop table t1 purge;

create table t1 (col1 number, col2 number);

declare
    v_employee_id   employees.employee_id%type;
    v_salary        employees.salary%type;
begin
    select  employee_id, salary into v_employee_id, v_salary
    from    employees
    where   employee_id = 100;
    
    if v_salary < 5000 then
        dbms_output.put_line('Are you kidding me?');
    else
        insert into t1(col1, col2)
        values  (v_employee_id, v_salary);
    end if;
end;
/

-- 프로시저 DBMS에 저장하기

create or replace procedure p1
is
begin
    dbms_output.put_line('hello world');
end;
/

-- 프로시저 실행하기
execute p1;

-- anonymous 블럭을 이용해 프로시저 사용하기
begin
    p1;
end;

-- 저장된 프로시저 확인하기
select  *
from    user_objects
where   object_type = 'PROCEDURE';

-- 매개변수가 포함된 프로시저 named block으로 만들기 (Quiz)

create or replace procedure get_employees_sum_sal_by_department_id(p_department_id number)
is
    v_sum_sal   employees.salary%type;
begin
    select  sum(salary) into v_sum_sal
    from    employees
    where   department_id = p_department_id;
    
    dbms_output.put_line(v_sum_sal);
end;

show errors;
begin
    get_employees_sum_sal_by_department_id(10);
end;
/

begin
    get_employees_sum_sal_by_department_id(50);
end;
/

-- 함수

-- Quiz. 방법1 if문 이용하기

create or replace function tax1(
  p_salary employees.salary%type
) return number
is
  v_tax_rate number;
begin
  if p_salary < 10000 then
    v_tax_rate := 0.013;
  elsif p_salary < 20000 then
    v_tax_rate := 0.015;
  else
    v_tax_rate := 0.02;
  end if;

  return p_salary * v_tax_rate;
end;
/


-- Quiz. 방법2 case 표현식 이용하기
-- 방법1보다 나음

create or replace function tax2(
  p_salary employees.salary%type
) return number
is
  v_tax number;
begin
  v_tax := case
    when p_salary < 10000 then p_salary * 0.013
    when p_salary < 20000 then p_salary * 0.015
    else p_salary * 0.02
  end;

  return v_tax;
end;

  return v_tax;
end;
/

-- Quiz. 방법3 dual 이용하기


create or replace function tax3(
  p_salary employees.salary%type
) return number
is
  v_tax number;
begin
    select  decode(trunc(p_salary/10000), 0, p_salary*0.013,
                                        1, p_salary*0.015,
                                            p_salary*0.02) into v_tax
    from    dual;
  return v_tax;
end;
/


-- Quiz. 방법4

drop table t_tax_rate purge;

create table t_tax_rate
(id     number generated as identity,
lowest_sal  number,
highest_sal number,
tax_rate    number);

insert into t_tax_rate(lowest_sal, highest_sal, tax_rate)
values  (0, 10000, 0.013);
insert into t_tax_rate(lowest_sal, highest_sal, tax_rate)
values  (10000, 20000, 0.015);
insert into t_tax_rate(lowest_sal, highest_sal, tax_rate)
values  (20000, null, 0.02);

commit;

create or replace function tax4(
    p_salary number
) return number
is
    v_tax_rate t_tax_rate.tax_rate%type;
begin
    select  tax_rate into v_tax_rate
    from    t_tax_rate
    where   p_salary >= lowest_sal and p_salary < nvl(highest_sal, 1000000000);
    
    return v_tax_rate * p_salary;
end;

select  employee_id, last_name, salary
        , tax1(salary) as tax1
        , tax2(salary) as tax2
        , tax3(salary) as tax3
        , tax4(salary) as tax4
from    employees;

