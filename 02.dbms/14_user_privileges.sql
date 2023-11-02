-- Chapter 14 사용자 권한

-- CONN system
-- tester2를 만들고 세션 접속 권한 부여하기

CREATE  USER tester2
IDENTIFIED  BY 1234;

GRANT   CREATE SESSION
TO      tester2;

-- CONN tester2

SHOW    user;

CREATE  TABLE emp01 ( -- 에러 : 권한 없음
        empno NUMBER(4),
        ename VARCHAR2(10),
        job VARCHAR2(9),
        deptno NUMBER(2)
);

-- CONN system
-- tester2에게 TABLE 생성 권한 부여하기

GRANT   CREATE TABLE
TO      tester2;

-- CONN system

CREATE  USER tester3
IDENTIFIED  BY 1234;

GRANT   CREATE SESSION
TO      tester3
WITH    ADMIN OPTION;

-- CONN tester3

GRANT   CREATE SESSION
TO      tester2;

-- CONN tester1
-- tester1의 테이블 객체 권한을 tester2에게 부여하기

GRANT   SELECT ON dept TO tester2;

-- CONN tester2

SELECT  *
FROM   tester1.dept;

-- tester2가 다른 사용자에게 부여한 권한 정보 조회

SELECT  *
FROM    user_tab_privs_made;

-- tester2가 자신에게 부여한 사용자 권한 정보 조회

SELECT  *
FROM    user_tab_privs_recd;

-- REVOKE

REVOKE  SELECT  ON dept FROM tester2;

-- CONN tester2

-- 에러: 더이상 tester1의 dept를 조회할 수 없음

SELECT  *
FROM   tester1.dept;

-- CONN tester1
-- WITH GRANT OPTION

GRANT   SELECT ON tester1.dept TO tester3
WITH    GRANT OPTION;

-- CONN tester3

SELECT  *
FROM    tester1.dept;

GRANT   SELECT ON tester1.dept TO tester2;

-- 롤을 이용하여 권한 부여하기

CREATE  USER tester5
IDENTIFIED BY 1234;

GRANT   CONNECT, RESOURCE TO tester5;

-- 롤에 대한 정보 조회

SELECT  *
FROM    user_role_privs;

-- tester1으로 접속할 수 있게 하는 롤 만들기

-- CONN sys

CREATE  ROLE mrole;
GRANT   CREATE SESSION, CREATE TABLE, CREATE VIEW TO mrole;

CREATE  USER tester6
IDENTIFIED BY 1234;

GRANT   mrole TO tester6;

-- CONN tester6
-- 부여된 권한 확인하기

SELECT  *
FROM    user_role_privs;

-- CONN sys

CREATE  ROLE mrole2;
GRANT   SELECT ON tester1.dept TO mrole2;
GRANT   mrole2 TO tester6;

-- CONN tester6
-- 부여된 권한 확인하기

SELECT  *
FROM    user_role_privs;

-- tester6이 접속된 상태에서 권한을 부여받고 확인하면 select 결과 확인 불가능
-- 접속 해제 후 재접속하면 조회 가능

SELECT  *
FROM    tester1.dept;

SELECT  *
FROM    role_tab_privs
WHERE   table_name IN ('DEPT');

-- 롤 회수하기

REVOKE  mrole2 FROM tester6;

-- 롤 제거하기

DROP    role mrole2;

-- 동의어

-- CONN sys
CREATE  TABLE systbl (
        ename VARCHAR2(20)
);

INSERT  INTO systbl
VALUES  ('전수빈');
INSERT  INTO systbl
VALUES  ('전원지');

SELECT  *
FROM    systbl;

GRANT   SELECT  ON systbl TO tester1;

-- CONN tester1

-- 에러: 테이블 접근 불가
SELECT  *
FROM    systbl;

SELECT  *
FROM    sys.systbl;

-- tester1에서 비공개 동의어 생성하기

-- CONN sys
GRANT   CREATE SYNONYM TO tester1;

-- CONN tester1
CREATE  SYNONYM PRISYSTBL FOR sys.systbl;

SELECT  *
FROM    prisystbl;

-- DBA로 접속해 공개 동의어 정의하기

CREATE  PUBLIC SYNONYM pubDept FOR tester1.dept;

-- 모든 사용자에서 동의어 접근 가능

SELECT  *
FROM    pubDept;

-- 비공개 동의어 제거하기

DROP    SYNONYM prisystbl;

-- 공개 동의어 제거하기

DROP    PUBLIC SYNONYM pubDept;

