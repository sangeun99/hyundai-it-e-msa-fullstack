-- Chapter 09 무결성 제약조건

INSERT  INTO    dept
VALUES  (10, 'test', 'test'); -- UNIQUE 제약조건 위배

INSERT  INTO    dept
VALUES  (null, 'test', 'test'); -- NOT NULL 제약조건 위배

DESC    user_constraints;

SELECT  *
FROM    user_constraints;

-- 제약조건 만들기

CREATE  TABLE test01 (
name    VARCHAR2(10) NOT NULL);
CREATE  TABLE test02 (
name    VARCHAR2(10) CHECK(NAME IS NOT NULL));
CREATE  TABLE test03 (
name    VARCHAR2(10),
CONSTRAINT  CHK_MYCHECK CHECK(NAME IS NOT NULL));

-- 제약조건 조회하기

SELECT  constraint_name, constraint_type, table_name
FROM    user_constraints;

INSERT  INTO dept01
VALUES  (null, null, null);

SELECT  *
FROM    dept01;

-- (NOT NULL CONSTRAINT) 실습 진행하기 

DROP TABLE  emp02;

CREATE  TABLE emp02 (
    empno   NUMBER(4)   NOT NULL,
    ename   VARCHAR2(10) NOT NULL,
    job     VARCHAR2(9),
    deptno  NUMBER(2)
);

SELECT  *
FROM    emp02;

INSERT  INTO emp02
VALUES  (null, null, '사원', 30); -- 제약조건 위반

INSERT  INTO emp02
VALUES  (1000, '허준', '사원', 30);

-- (UNIQUE CONSTRAINT) 실습 진행하기 

CREATE  TABLE emp03 (
    empno   NUMBER(4) UNIQUE,
    ename   VARCHAR2(10) NOT NULL,
    job     VARCHAR2(9),
    deptno  NUMBER(2)
);

SELECT  *
FROM    emp03;

INSERT  INTO emp03
VALUES  (1000, '홍길동', '사원', 30);

INSERT  INTO emp03
VALUES  (1000, '허준', '과장', 20); -- 제약조건 위반

INSERT  INTO emp03
VALUES  (null, '안중근', '과장', 20); -- NULL 값은 가능함

INSERT  INTO emp03
VALUES  (null, '이순신', '사원', 10); -- NULL 값은 가능함

SELECT  *
FROM    user_indexes;

-- (UNIQUE CONSTRAINT) 실습 진행하기 

CREATE  TABLE emp04 (
        empno NUMBER(4)
            CONSTRAINT EMP04_EMPNO_UK UNIQUE,
        ename VARCHAR2(10)
            CONSTRAINT EMP04_ENAME_NN NOT NULL,
        job VARCHAR2(9),
        deptno NUMBER(2)
        );
        
SELECT  constraint_name, constraint_type, table_name
FROM    user_constraints
WHERE   table_name in ('EMP04');

INSERT  INTO emp04
VALUES  (1000, '허준', '사원', 30);
INSERT  INTO emp04
VALUES  (1000, '홍길동', '과장', 20); -- 무결성 제약 조건 위반

-- (PRIMARY KEY CONSTRAINT) 실습 진행하기 

CREATE  TABLE emp05 (
        empno NUMBER(4)
            CONSTRAINT EMP05_EMPNO_PK PRIMARY KEY,
        ename VARCHAR2(10)
            CONSTRAINT EMP05_ENAME_NN NOT NULL,
        job VARCHAR2(9),
        deptno NUMBER(2)
        );  

SELECT  constraint_name, constraint_type, table_name
FROM    user_constraints
WHERE   table_name in ('EMP05');

SELECT  *
FROM    emp05;

INSERT  INTO emp05
VALUES  (1000, '허준', '사원', 30);
INSERT  INTO emp05
VALUES  (1000, '홍길동', '과장', 20); -- 무결성 제약 조건 위반
INSERT  INTO emp05
VALUES  (null, '홍길동', '과장', 20); -- 무결성 제약 조건 위반

-- (FOREIGN KEY CONSTRAINT) 실습 진행하기

SELECT  constraint_name, constraint_type, table_name
FROM    user_constraints
WHERE   table_name in ('DEPT');

-- (FOREIGN KEY CONSTRAINT) 실습 진행하기

CREATE  TABLE emp06 (
        empno NUMBER(4)
            CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,
        ename VARCHAR2(10)
            CONSTRAINT EMP06_ENAME_NN NOT NULL,
        job VARCHAR2(9),
        deptno NUMBER(2)
            CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT(DEPTNO)
            );
            
INSERT  INTO emp06
VALUES  (1010, '허준', '사원', 30);

SELECT  *
FROM    emp06;

INSERT  INTO emp06
VALUES  (1000, '홍길동', '사원', 50); -- 무결성 제약 조건 위반

-- (CHECK CONSTRAINT) 실습 진행하기

CREATE  TABLE emp07 (
        empno NUMBER(4)
            CONSTRAINT EMP07_EMPNO_PK PRIMARY KEY,
        ename VARCHAR2(10)
            CONSTRAINT EMP07_ENAME_NN NOT NULL,
        sal NUMBER(7, 2)
            CONSTRAINT EMP07_SAL_CK CHECK(sal BETWEEN 500 AND 5000),
        gender VARCHAR2(1)
            CONSTRAINT EMP07_GENDER_CK CHECK(gender IN ('M', 'F'))
            );

INSERT  INTO emp07
VALUES  (1010, '허준', 200, 'M'); -- 무결성 제약 조건 위반

INSERT  INTO emp07
VALUES  (1010, '허준', 700, 'A'); -- 무결성 제약 조건 위반

-- DEFAULT 제약조건

DROP    TABLE dept01;

CREATE  TABLE dept01 (
    deptno  NUMBER(2) PRIMARY KEY,
    dname   VARCHAR2(14),
    loc VARCHAR2(13) DEFAULT '서울'
    );
    
INSERT  INTO dept01
(deptno, dname)
VALUES (10, '경리부');

SELECT  *
FROM    dept01;