-- ROLLUP, CUBE
-- CONN tester1

SELECT  deptno, GROUPING(deptno),
        job, GROUPING(job),
        COUNT(*), AVG(sal)
FROM    emp
GROUP   BY ROLLUP(deptno, job)
ORDER   BY deptno, job;


--- CUBE 부서별 잡별 집계 / 잡별 집계 별도로 또 나옴

SELECT  deptno, GROUPING(deptno),
        job, GROUPING(job),
        COUNT(*), AVG(sal) * 12
FROM    emp
GROUP   BY CUBE(deptno, job);

-- 계층형 쿼리
-- CONN ace

DESC    employees;

SELECT  last_name, LEVEL
FROM    employees
START   WITH manager_id IS NULL
CONNECT BY manager_id = PRIOR employee_id;

SELECT  employee_id
        , LEVEL
        , CONNECT_BY_ROOT last_name AS 대표
        , CONNECT_BY_ISLEAF AS 막내
        , SYS_CONNECT_BY_PATH(last_name, '/') AS PATH
        , LPAD(' ', (LEVEL - 1) * 3) || last_name AS last_name
        , PRIOR last_name
FROM    employees
START   WITH manager_id IS NULL
CONNECT BY manager_id = PRIOR employee_id
ORDER   SIBLINGS BY employee_id DESC;

-- CONN tester1

SELECT  empno, ename, LEVEL
FROM    emp
START   WITH mgr IS NULL
CONNECT BY mgr = PRIOR empno;

-- GROUPING SETS

SELECT  deptno, job, mgr, avg(sal)
FROM    emp
GROUP   BY GROUPING SETS ((deptno, job), (job,mgr));

SELECT  department_id, job_id, manager_id, AVG(salary)
FROM    employees
GROUP   BY GROUPING SETS ((department_id, job_id), (job_id, manager_id));

-- WITH 절

WITH    A AS (  SELECT  deptno, SUM(sal) as sum_sal, count(*) AS cnt
                FROM    emp
                GROUP   BY deptno )
SELECT  'sum', SUM(sum_sal)
FROM    A
UNION   ALL
SELECT  'avg', sum_sal/cnt
FROM    A;

-- Multiple Column 서브쿼리

CREATE  TABLE fruits (
    name varchar2(20),
    grade varchar2(1));

INSERT INTO fruits VALUES ('딸기', 'A');
INSERT INTO fruits VALUES ('딸기', 'B');
INSERT INTO fruits VALUES ('바나나', 'A');
INSERT INTO fruits VALUES ('바나나', 'B');
INSERT INTO fruits VALUES ('바나나', 'C');

COMMIT;

SELECT  *
FROM    fruits;

CREATE TABLE purchases (
    name varchar2(20),
    grade varchar2(1));
    
INSERT INTO purchases VALUES ('딸기', 'A');
INSERT INTO purchases VALUES ('바나나', 'B');

SELECT  *
FROM    fruits
WHERE   name IN (SELECT name FROM purchases)
AND     grade IN (SELECT grade FROM purchases);

-- pairwise한 서브쿼리 이용하기

SELECT  *
FROM    fruits
WHERE   (name, grade) IN (SELECT name, grade FROM purchases);

SELECT  *
FROM    fruits
WHERE   (name, grade) NOT IN (SELECT name, grade FROM purchases);

SELECT  ename, deptno, sal
FROM    emp
WHERE   (deptno, sal) IN (  SELECT  deptno, MIN(sal)
                            FROM    emp
                            GROUP   BY deptno );

--

CREATE  TABLE employee (
        employee_id NUMBER(4) PRIMARY KEY,
        name VARCHAR2(30) NOT NULL,
        phone_number VARCHAR2(11) UNIQUE,
        salary NUMBER CHECK(salary >= 100),
        department_id NUMBER(2) REFERENCES department(department_id)
        );

CREATE  TABLE department (
        department_id NUMBER(2) PRIMARY KEY,
        name VARCHAR(30),
        location VARCHAR(10));

