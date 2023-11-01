-- Chapter 12 가상 테이블 뷰

CREATE  VIEW    testview
AS
SELECT  ename, sal
FROM    emp;

SELECT  *
FROM    testview;

CREATE  VIEW    emp_copy
AS
SELECT  *
FROM    emp;

CREATE  VIEW    emp_copy30
AS
SELECT  empno, ename, deptno
FROM    emp_copy
WHERE   deptno=30;

SELECT  *
FROM    emp_copy30;

-- 뷰에 INSERT문으로 데이터 추가하기

INSERT  INTO emp_copy30
VALUES  (1111, 'aaaa', 30);

CREATE  VIEW emp_view_dept
AS
SELECT  e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc
FROM    emp_copy e
JOIN    dept d ON e.deptno = d.deptno;

-- CREATE OR REPLACE VIEW

CREATE  OR REPLACE VIEW emp_view30
AS
SELECT  empno, ename, sal, comm, deptno
FROM    emp_copy
WHERE   deptno = 30;

CREATE  OR REPLACE NOFORCE VIEW emp_view30_1 -- 에러: employees가 없음
AS
SELECT  empno, ename, sal, comm, deptno
FROM    employees
WHERE   deptno = 30;

CREATE  OR REPLACE FORCE VIEW emp_view30_2
AS
SELECT  empno, ename, sal, comm, deptno
FROM    employees
WHERE   deptno = 30;

SELECT  view_name, text
FROM    user_views;

CREATE  TABLE emp_copy2
AS
SELECT  * FROM emp;

CREATE  OR REPLACE VIEW view_chk30
AS
SELECT  empno, ename, sal, comm, deptno
FROM    emp_copy2
WHERE   deptno=30 WITH CHECK OPTION;


UPDATE  view_chk30 SET deptno=20
WHERE   sal >= 1200;

-- ROWNUM

-- 페이징 처리

SELECT  B.*
FROM    (SELECT ROWNUM as rnum, A.*
        FROM    (SELECT empno, ename, hiredate
                FROM    emp
                ORDER   BY hiredate) A) B
WHERE   rnum BETWEEN 11 AND 15;
