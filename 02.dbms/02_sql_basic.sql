-- employees 이름(last_name), 급여(salary), 연봉(salary*12+salary*commision+pct) 조회

SELECT last_name AS 이름, salary AS 급여, salary*12+salary*nvl(commission_pct,0) AS 연봉
FROM employees;

-- CONN tester1/1234@localhost:1521/xepdb1

-- SELECT

SELECT  *
FROM    dept;

SELECT  empno
        ,ename
FROM    emp;

-- 연산

SELECT  ename, sal*12+sal*nvl(comm,0) AS annsal FROM emp;
SELECT  ename, sal*12+sal*nvl(comm,0) AS "annsal" FROM emp;
SELECT  ename, sal*12+sal*nvl(comm,0) annsal FROM emp;
SELECT  ename, sal*12+sal*nvl(comm,0) "annsal" FROM emp;

-- concatenation 이용

SELECT 'SELECT * FROM ' || TNAME || ';';
FROM emp;

-- distinct

SELECT DISTINCT deptno
FROM emp;

-- to_date

SELECT *
FROM emp
WHERE hiredate < TO_DATE('2005/01/01', 'YYYY/MM/DD');

-- 현재 시간 출력

SELECT sysdate
FROM dual;

-- AND OR NOT

SELECT ename, deptno, JOB
FROM emp
WHERE deptno=10 AND JOB='과장';

SELECT ename, deptno, JOB
FROM emp
WHERE deptno=10 OR JOB='과장';

SELECT *
FROM emp
WHERE deptno <> 10;

-- CONN ACE

SELECT *
FROM employees
WHERE department_id IS NULL;

-- CONN TESTER1
-- BETWEEN

SELECT *
FROM emp
WHERE 400 <= sal AND sal <= 500;

SELECT *
FROM emp
WHERE sal BETWEEN 400 AND 500;

SELECT *
FROM emp
WHERE sal < 400 OR sal > 500;

SELECT *
FROM emp
WHERE NOT sal BETWEEN 400 AND 500;


-- 컬럼에 바로 연산자 적용은 지양 -> 성능 문제

SELECT  *
FROM    emp
WHERE   hiredate    BETWEEN TO_DATE('2003/01/01', 'YYYY/MM/DD')
                    AND     TO_DATE('2003/12/31', 'YYYY/MM/DD');
                    
SELECT  *
FROM    emp
WHERE   to_char(hiredate, 'YYYY')=2003;

-- IN

SELECT  *
FROM    emp
WHERE   comm IN(80, 100, 200);

SELECT  *
FROM    emp
WHERE   comm NOT IN(80, 100, 200);


-- 10/27

-- LIKE % 이용하기

SELECT  ename
FROM    emp
WHERE   ename LIKE '%이%';

SELECT  ename
FROM    emp
WHERE   ename LIKE '%' || '성' || '%';

-- _ 이용하기

SELECT  ename
FROM    emp
WHERE   ename LIKE '__이';

-- ORDER BY 절

SELECT  ename, sal
FROM    emp
ORDER   BY sal ASC;

SELECT  empno, ename
FROM    emp
ORDER   BY ename;

SELECT  empno, ename, hiredate
FROM    emp
ORDER   BY hiredate DESC;

SELECT  empno, ename, hiredate
FROM    emp
ORDER   BY hiredate DESC, ename ASC;

-- 집합 연산자 UNION

SELECT  name
FROM    group_star
UNION ALL
SELECT  name
FROM    single_star;

SELECT  name
FROM    group_star
UNION
SELECT  name
FROM    single_star;

-- 집합 연산자 INTERSECT

SELECT  name
FROM    group_star
INTERSECT
SELECT  name
FROM    single_star;

-- 집합 연산자 DIFFERENCE

SELECT  name
FROM    single_star
MINUS
SELECT  name
FROM    group_star;
