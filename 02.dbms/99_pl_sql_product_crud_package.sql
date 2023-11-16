-- ChatGPT를 활용해 PL/SQL 패키지 만들기
  
-- (1) 테이블 생성

drop table products purge;

create table products
    (id    number generated as identity primary key,
    prod_name  varchar2(30),
    prod_price number(10, 2));

-- (2) 프로시저 및 함수 생성

-- (2-1) create

create or replace procedure insert_product (
    p_prod_name in products.prod_name%type,
    p_prod_price in products.prod_price%type
) as
begin
    insert into products (prod_name, prod_price)
    values (p_prod_name, p_prod_price);
    commit;
end;
/

-- (2-2) read

create or replace function read_product_by_id (
    p_id in products.id%type
)
    return sys_refcursor
as 
    v_prod_refcur sys_refcursor;
begin
    open v_prod_refcur for
        select id, prod_name, prod_price
        from products
        where id = p_id;
    return v_prod_refcur;
end;
/

-- (2-3) update

create or replace procedure update_product_by_id (
    p_id in products.id%type,
    p_prod_name in products.prod_name%type,
    p_prod_price in products.prod_price%type
)
as
begin
    update products
    set prod_name = p_prod_name, prod_price = p_prod_price
    where id = p_id;
    commit;
end;
/

-- (2-4) delete

create or replace procedure delete_product_by_id (
    p_id in products.id%type
)
as
begin
    delete from products
    where id = p_id;
    commit;
end;
/

-- (2-*) 프로시저 및 함수 테스트 코드

-- create

select  * from products;

begin
    create_product('Test Product', 10000);
    create_product('Test Product 2', 35000);
end;
/

select  * from products;

-- read

declare
    v_prod_refcur sys_refcursor;
    v_product products%rowtype;
begin
    v_prod_refcur := read_product_by_id(1);
    fetch v_prod_refcur into v_product;
    close v_prod_refcur;
    dbms_output.put_line('Product ID: ' || v_product.id || ', Name: ' || v_product.prod_name || ', Price: ' || v_product.prod_price);
end;
/

-- update

select  * from products;

begin
   update_product_by_id(1, 'Updated Product', 20000);
end;
/

select  * from products;

-- delete

begin
   delete_product_by_id(1);
end;
/

select  * from products;

-- (3) 패키지 생성

-- 패키지 선언부
create or replace package pack_products
as
    procedure insert_product (
        p_prod_name in products.prod_name%type,
        p_prod_price in products.prod_price%type
    );
    
    function read_product_by_id (
        p_id in products.id%type
    )
        return sys_refcursor;
    
    procedure update_product_by_id (
        p_id in products.id%type,
        p_prod_name in products.prod_name%type,
        p_prod_price in products.prod_price%type
    );
    
    procedure delete_product_by_id (
        p_id in products.id%type
    );
end;

-- 패키지 바디

create or replace package body pack_products
is
    procedure insert_product (
        p_prod_name in products.prod_name%type,
        p_prod_price in products.prod_price%type
    ) as
    begin
        insert into products (prod_name, prod_price)
        values (p_prod_name, p_prod_price);
        commit;
    end;
    
    function read_product_by_id (
        p_id in products.id%type
    )
        return sys_refcursor
    as 
        v_prod_refcur sys_refcursor;
    begin
        open v_prod_refcur for
            select id, prod_name, prod_price
            from products
            where id = p_id;
        return v_prod_refcur;
    end;
    
    procedure update_product_by_id (
        p_id in products.id%type,
        p_prod_name in products.prod_name%type,
        p_prod_price in products.prod_price%type
    )
    as
    begin
        update products
        set prod_name = p_prod_name, prod_price = p_prod_price
        where id = p_id;
        commit;
    end;
    
    procedure delete_product_by_id (
        p_id in products.id%type
    )
    as
    begin
        delete from products
        where id = p_id;
        commit;
    end;
end;

-- (3-*) 패키지 테스트 코드

-- create

truncate table products;

begin
    pack_products.insert_product('Test Product', 10000);
    pack_products.insert_product('Test Product 2', 35000);
end;
/

select  * from products;

-- read

declare
    v_prod_refcur sys_refcursor;
    v_product products%rowtype;
begin
    v_prod_refcur := pack_products.read_product_by_id(1);
    fetch v_prod_refcur into v_product;
    close v_prod_refcur;
    dbms_output.put_line('Product ID: ' || v_product.id || ', Name: ' || v_product.prod_name || ', Price: ' || v_product.prod_price);
end;
/

-- update

select  * from products;

begin
   pack_products.update_product_by_id(1, 'Updated Product', 20000);
end;
/

select  * from products;

-- delete

begin
   pack_products.delete_product_by_id(1);
end;
/

select  * from products;