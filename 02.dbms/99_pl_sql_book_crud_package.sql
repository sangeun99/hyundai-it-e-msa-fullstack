-- (1) 테이블 생성

drop table books purge;

create table books
    (id    number generated as identity primary key,
    name  varchar2(30),
    price number(10, 2));
    
-- (2) 위 테이블에 CRUD하는 stand-alone subprogram(stored procedure 및 stored function) 만들어줘

-- (2-1) Create

create or replace procedure insert_book (
    p_name in varchar2,
    p_price in number)
as
begin
    insert into books (name, price)
    values (p_name, p_price);
end insert_book;
/

-- (2-2) Read

create or replace function read_book_by_id (
    p_id in number
)
    return sys_refcursor
as
    v_cursor sys_refcursor;
begin
    open v_cursor for
        select name, price
        from books
        where id = p_id;
    return v_cursor;    
end;
/

-- (2-3) Update

create or replace procedure update_book_by_id (
    p_id in number,
    p_name in varchar2,
    p_price in number
)
as
begin
    update books
    set name = p_name,
        price = p_price
    where id = p_id;
end update_book_by_id;
/

-- (2-4) Delete

create or replace procedure delete_book_by_id (
    p_id in number
)
as
begin
    delete  from books
    where   id = p_id;
end delete_book_by_id;
/

-- (2-*) 테스트코드

-- create

select * from books;

begin
    insert_book('자바 입문', 10000);
    insert_book('데이터베이스 활용', 15000);
    commit;
end;
/

select * from books;

-- read

declare
    v_cursor sys_refcursor;
    v_name   varchar2(30);
    v_price  number(10, 2);
begin
    v_cursor := read_book_by_id(1);
    
    fetch v_cursor into v_name, v_price;
    dbms_output.put_line('Name: ' || v_name || ', Price: ' || v_price);
    
    close v_cursor;
end;
/

-- update

select * from books;

begin
    update_book_by_id(1, '자바 입문', 12000);
    commit;
end;
/

select * from books;

-- delete

select * from books;

begin
    delete_book_by_id(1);
    commit;
end;
/

select * from books;

-- (3) 위 테이블에 CRUD하는 패키지 만들어줘

-- 패키지 선언부분
create or replace package pack_books
as
	procedure insert_book(
        p_name in varchar2,
        p_price in number);
	function read_book_by_id (
        p_id in number
    )
        return sys_refcursor;
    procedure update_book_by_id (
        p_id in number,
        p_name in varchar2,
        p_price in number
    );
    procedure delete_book_by_id (
        p_id in number
    );
end pack_books;

create or replace package body pack_books
is
    function price_check (
        p_price in number
    )
        return varchar2
    is
    begin
        if p_price > 0 then
            return 'True';
        else
            return 'False';
        end if;    
    end;    
    
    procedure insert_book (
        p_name in varchar2,
        p_price in number)
    as
    begin
        if price_check(p_price) = 'True' then
            insert into books (name, price)
            values (p_name, p_price);
        else
            dbms_output.put_line('가격은 0원 미만일 수 없습니다.');
        end if;    
    end insert_book;
    
    function read_book_by_id (
        p_id in number
    )
        return sys_refcursor
    as
        v_cursor sys_refcursor;
    begin
        open v_cursor for
            select name, price
            from books
            where id = p_id;
        return v_cursor;    
    end;
    
    procedure update_book_by_id (
        p_id in number,
        p_name in varchar2,
        p_price in number
    )
    as
    begin
        update books
        set name = p_name,
            price = p_price
        where id = p_id;
    end update_book_by_id;
    
    procedure delete_book_by_id (
        p_id in number
    )
    as
    begin
        delete  from books
        where   id = p_id;
    end delete_book_by_id;
end pack_books;
/


-- (3-*) 테스트 코드 작성

-- create

truncate table books;

begin
    pack_books.insert_book('자바 입문', 10000);
    pack_books.insert_book('데이터베이스 활용', -15000);
    commit;
end;
/

select * from books;

drop procedure insert_book;
drop procedure update_book_by_id;
drop function read_book_by_id;
drop procedure delete_book_by_id ;

select * from user_objects
where object_type in ('PROCEDURE', 'FUNCTION', 'PACKAGE', 'PACKAGE BODY');

select * from user_source
where name = 'PACK_BOOKS';