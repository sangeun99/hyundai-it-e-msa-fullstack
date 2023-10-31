-- Chapter 08 DML

CREATE  TABLE   dept01 (
        deptno  NUMBER(2),
        dname   VARCHAR2(14),
        loc     VARCHAR2(13));

DESC    dept01;

-- INSERT INTO

INSERT  INTO    dept01
VALUES  (10, '경리부', '서울');
INSERT  INTO    dept01 (deptno, dname)
VALUES  (20, '테스트');

SELECT  *
FROM    dept01;

INSERT  INTO    dept01
VALUES  (30, '영업부', '');

CREATE  TABLE   emp02 (
        empno   NUMBER(4),
        ename   VARCHAR2(10),
        job     VARCHAR2(9),
        hiredate   DATE,
        deptno  NUMBER(2));

INSERT  INTO emp02
VALUES (1001, '김사랑', '사원', '2015/03/01', 20);

SELECT  *
FROM    emp02;

INSERT  INTO emp02
VALUES (1002, '한예슬', '대리', '2016/05/01', 20);

INSERT  INTO emp02
VALUES (1003, 'Jerry', 'SALESMAN', sysdate, 30);

-- UPDATE

UPDATE  dept01
SET     dname = '생산부'
WHERE   deptno = 10;

COMMIT;

-- DELETE

DELETE  dept01
WHERE   deptno=20;

ROLLBACK;

-- 트랜잭션 관리

DELETE  emp02;

SELECT  *
FROM    emp02;

ROLLBACK;

SAVEPOINT   a;

DELETE  emp02
WHERE   empno = (   SELECT  MAX(empno)
                    FROM    emp02 );
SAVEPOINT   b;

DELETE  emp02
WHERE   empno = (   SELECT  MAX(empno)
                    FROM    emp02 );
SAVEPOINT   c;

DELETE  emp02
WHERE   empno = (   SELECT  MAX(empno)
                    FROM    emp02 );

ROLLBACK    TO  a; -- ROLLBACK 이후에는 SAVEPOINT b, c로 이동 불가