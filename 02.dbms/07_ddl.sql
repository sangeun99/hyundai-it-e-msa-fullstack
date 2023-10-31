-- Chapter 07 DDL

-- CREATE TABLE

CREATE  TABLE emp01 (
        empno NUMBER(4),
        ename VARCHAR2(14),
        sal NUMBER(7, 3));
        
DESC    emp01;

-- ALTER TABLE

ALTER   TABLE emp01
ADD(birth DATE);

ALTER   TABLE emp01
MODIFY  ename VARCHAR2(30);

ALTER   TABLE emp01
DROP    COLUMN ename;

-- RENAME

RENAME emp02 TO emp05;

SELECT  * FROM tab; -- 많이 사용하지 않음
SELECT  * FROM user_tables;
SELECT  * FROM user_objects;

-- DROP

DROP    TABLE emp03;

-- 휴지통으로 가지 않고 바로 삭제

DROP    TABLE emp03 PURGE;

-- emp02를 삭제 전으로 되돌리기

FLASHBACK TABLE emp02 TO BEFORE DROP;

-- 휴지통 비우기

PURGE RECYCLEBIN;

-- 데이터 딕셔너리

-- CONN ace

SELECT  * FROM user_sequences;

SHOW    user;

SELECT  *
FROM    all_tables;

SELECT  *
FROM    dba_tables;