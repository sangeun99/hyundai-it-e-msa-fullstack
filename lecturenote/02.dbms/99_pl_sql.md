### 교재

- PL/SQL Tutorial : https://www.oracletutorial.com/plsql-tutorial/
- Oracle PL/SQL Articles : https://oracle-base.com/articles/plsql/articles-plsql
- 2 Day Developer's Guide : https://docs.oracle.com/en/database/oracle/oracle-database/21/tdddg/two-day-developer-intro.html
- Database PL/SQL Language Reference : https://docs.oracle.com/en/database/oracle/oracle-database/21/lnpls/index.html
- PL/SQL Packages and Types Reference : https://docs.oracle.com/en/database/oracle/oracle-database/21/arpls/index.html
- Oracle Live SQL의 Code Library : https://livesql.oracle.com/

### PL/SQL

- The Oracle procedural extension of SQL, is a portable, high-performance transaction-processing language.
    - https://docs.oracle.com/en/database/oracle/oracle-database/21/lnpls/overview.html#GUID-2FBCFBBE-6B42-4DB8-83F3-55B63B75B1EB
    - Advantages of PL/SQL
    - Main Features of PL/SQL
    - Architecture of PL/SQL
- PL/SQL = SQL(Manipulating Power) + 3GL(Processing Power)
    - SQL(Manipulating Power) + null + Java + MyBatis + JPA
        - Java 코드 내에 있는 SQL문은 그저 문자열. 바이트 코드로 변환되지 않음
    - SQL(Manipulating Power) + PL/SQL + Java + MyBatis + JPA
- Pascal -> Ada -> PL/SQL
- 코드구성
    
    ```sql
    declare       -- optional
      선언부
    begin         -- mandatory
      실행부
    exception     -- optional
      예외처리부
    end;          -- mandatory
    /             <- SQL*Plus에서 실행하라는 의미임
    ```
    

### Data가 움직이느냐, Logic이 움직이느냐

- Data는 최대한 움직이지 않는 것이 좋음
- Java에서 쿼리를 넘기고 그때마다 쿼리를 날릴 경우 항상 DBMS에 접근해야 함
    - 데이터가 계속해서 움직임
- DBMS에 프로시저나 함수로 정의해놓고 모든 질의를 마친 후 필요한 정보만 Java에 보내줌

### Anonymous Block: 스크립트 출력하기

- [소스코드](https://github.com/sangeun99/hyundai-it-e-java-fullstack/tree/master/02.dbms/99_pl_sql.sql)
- 클라이언트 툴에 출력을 위해 한 번 실행해줘야 하는 명령어
    - `set serveroutput on`
- for문 이용하여 출력하기
    
    ```sql
    begin
    	for i in 1..10 loop
    		dbms_output.put_line('Hello World!');
    	end loop;
    end;
    /
    ```
    
    - sqlplus에서 프로시저 실행을 원한다면 `/` 가 필요함
    - SQLDeveloper에서는 필요하지 않지만 오류가 나는 것은 아님

### Anonymous Block: if문 이용하기

- [소스코드](https://github.com/sangeun99/hyundai-it-e-java-fullstack/tree/master/02.dbms/99_pl_sql.sql)

```sql
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
```

- declare
    - 직접 타입을 지정하지 않고 employees.employee_id%type; 를 이용하여 employee_id의 타입이 바뀌더라도 v_employee_id 타입이 함께 바뀔 수 있도록 함
- begin
    - if문을 이용해 최저 연봉보다 낮은 급여가 들어왔을 때 예외처리 해주도록 함
        - 이 부분이 Java에 들어있다면 최저 연봉 바뀔 때마다 Java 코드를 수정해야 함

### Named Block으로 수정하여 프로시저 이용하기

- [소스코드](https://github.com/sangeun99/hyundai-it-e-java-fullstack/tree/master/02.dbms/99_pl_sql.sql)
- 프로시저 만들기
    
    ```sql
    create or replace procedure p1
    is
    begin
        dbms_output.put_line('hello world');
    end;
    /
    ```
    
- 프로시저 실행하기
    
    ```sql
    execute p1;
    ```
    
- anonymous 블럭을 이용해 프로시저 사용하기
    
    ```sql
    begin
        p1;
    end;
    ```
    
- 저장된 프로시저 확인하기
    
    ```sql
    select  *
    from    user_objects
    where   object_type = 'PROCEDURE';
    ```
    
- 이름이 있는 블럭은 에러가 컴파일 에러로 뜨기에 `show errors;` 명령어를 알면 좋음
- 매개변수가 있는 프로시저 만들기
    - 프로시저 선언 시
        
        ```sql
        create or replace procedure get_employees_sum_sal_by_department_id(p_department_id number)
        ```
        
    - 프로시저 호출 시
        
        ```sql
        begin
            get_employees_sum_sal_by_department_id(50);
        end;
        /
        ```
        

### 함수 만들기

- [소스코드](https://github.com/sangeun99/hyundai-it-e-java-fullstack/tree/master/02.dbms/99_pl_sql.sql)
- 함수 정의하기
    
    ```sql
    create or replace function tax(
        p_salary employees.salary%type
    ) return number
    is
    begin
        return  p_salary * 0.013;
    end;
    /
    ```
    
- 함수 이용하기
    
    ```sql
    select  employee_id, last_name, salary, tax(salary)
    from    employees;
    ```
    

### Identity Columns

- [소스코드](https://github.com/sangeun99/hyundai-it-e-java-fullstack/tree/master/02.dbms/99_pl_sql_identity_columns.sql)
- https://oracle-base.com/articles/12c/identity-columns-in-oracle-12cr1
- 프로시저로 Identity Columns 성능 비교를 할 수 있는 예제 포함
    - 트리거 이용한 자동 생성 컬럼, 시퀀스 이용한 자동 생성 컬럼, identity 컬럼 이용
    - 트리거 이용한 자동 생성 컬럼이 최악. 12c 버전 이후의 기본 제공되는 컬럼 생성 방식을 이용할 것

### CRUD 패키지(프로시저 및 함수) 만들기

- [Book 패키지 소스코드](https://github.com/sangeun99/hyundai-it-e-java-fullstack/tree/master/02.dbms/99_pl_sql_book_crud_package.sql)
- 테이블
    
    ```sql
    create table books
    (id    number generated as identity primary key,
    name  varchar2(30),
    price number(10, 2));
    ```
    
- Create하는 프로시저
- Read하는 프로시저
    
    ```sql
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
    ```
    
    - DB 서버 내부에 있는 레퍼런스 변수 자체를 리턴 받음
    - 객체를 핸들링할 수 있도록 함
- Update하는 프로시저
- Delete하는 프로시저
- 패키지 만들기
    - 패키지 선언
        
        ```sql
        create or replace package pack_books
        as
        end pack_books;
        ```
        
        - 여기에 넣은 프로시저 및 함수는 private이 될 것
        - 안쪽에 스펙을 정의해주면 밖에서도 사용할 수 있게 됨
    - 프로시저들을 `create or replace package body pack_books` 안에 넣음

### PL/SQL Datatypes

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/5b7489b0-0d1b-4c70-ae7f-496a507af030)

- Scalar Types : number, character, date, boolean
- Composite Types : plsql record, plsql table, ...
- Reference Types : ref cursor, ...
- LOB : http://me2.do/F3hYsYX7

### 변수와 상수

- variable
- constant
- parameter
- argument

### 프로시저 vs 함수

- 함수
    - 정해진 형태로 만들 때 이용
    - sql문에 끼워쓸 수 있는 형태로 만들기
- 프로시저
    - 이외의 경우에서 이용
    - sql문에 끼워쓸 수 없다면 프로시저 이용
    - 프로시저 out 사용 시 select문에 사용할 수 없음


### 6가지 유형의 SELECT 문장과 적절한 변수 설정

- [소스코드](https://github.com/sangeun99/hyundai-it-e-java-fullstack/tree/master/02.dbms/99_pl_sql_six_types_of_select.sql)
- [1] 값 하나를 리턴하는 SELECT문 (1, 1)
    - 값 하나를 담을 타입: `employees.salary%type`
- [2] 행 하나를 리턴하는 SELECT문 (*, 1)
    - 행 하나를 넣을 수 있는 타입: `rowtype`
        - `employees%rowtype`
        - `rowtype` 에 들은 값들을 각각 리턴할 수도, `rowtype` 자체를 리턴하고 `employee_row.last_name` 같은 식으로 꺼내쓸 수 있음
- [3] 행 하나의 몇몇 컬럼을 리턴하는 SELECT문(n, 1)
    - 새로운 type `record`을 프로시저 안에 선언하기
        
        ```sql
        TYPE            employee_record_type IS RECORD (
            last_name   employees.last_name%type, 
            salary      employees.salary%type, 
            job_id      employees.job_id%type
        );
        ```
        
        - 프로시저 안에서 정의한 타입은 프로시저 안에서만 사용 가능
        - out 파라미터로 줄 수도 없음
            - 프로시저 호출 시 타입 정의를 할 수 없기 때문
    - 뷰를 이용하여 데이터 `rowtype` 으로 선언하기
        - 특정 컬럼 만을 선택하는 SELECT 질의를 뷰에 저장
            
            ```sql
            create or replace view view_for_rowtype
            as
            select  last_name, salary, job_id
            from    employees;
            ```
            
        - 뷰의 `rowtype`을 사용하기
            
            ```sql
            create or replace procedure p1(
                p_employee_id   in  employees.employee_id%type,
                employee_row    out view_for_rowtype%rowtype
            )
            ```
            
    - 패키지 안에 레코드 변수를 선언하여 사용하기(!)
        
        ```sql
        create or replace package pack_datatypes
        is
            TYPE employee_record_type IS RECORD (
                last_name   employees.last_name%type, 
                salary      employees.salary%type, 
                job_id      employees.job_id%type
            );
        end;
        /
        ```
        
        - 제일 좋은 방법
        - 밖에서도 안에서도 해당 타입을 사용할 수 있음
- [4] 같은 유형의 값 여러 개를 리턴하는 SELECT문 (1, m)
    - 프로시저 안에 타입 정의하고 이용하기
        
        ```sql
        TYPE        employees_salary_tab_type IS TABLE OF employees.salary%type INDEX BY pls_integer;
        ```
        
        - `BULK COLLECT INTO`
            - 값 여러 개에 대한 요청을 한 번에 받을 수 있는 예약어
        - 값에 접근하기
            
            ```sql
            for i in emp_sal_tab.first .. emp_sal_tab.last loop        
                    dbms_output.put_line(emp_sal_tab(i));
                end loop;
            ```
            
            - PL/SQL의 인덱스는 1부터 시작함
            - COLLECTIONS의 메서드
                - first
                    - 첫 번째 인덱스를 리턴
                - last
                    - 마지막 인덱스를 리턴
- [5] 행 여러 개를 리턴하는 SELECT문 (*, m)
    
    ```sql
    TYPE    employees_table_type IS TABLE OF employees%rowtype INDEX BY pls_integer;
    ```
    
- [6] 몇몇 컬럼을 포함하는 행 여러 개를 리턴하는 SELECT문 (n, m)
    - RECORD 타입과 그들을 담는 TABLE 타입 필요함
        
        ```sql
        TYPE            employee_record_type IS RECORD (
            last_name   employees.last_name%type, 
            salary      employees.salary%type, 
            job_id      employees.job_id%type
        );
        TYPE employees_table_type IS TABLE OF employee_record_type
            INDEX BY pls_integer;
        employees_tab employees_table_type;
        ```
        
- https://refactoring.guru/
