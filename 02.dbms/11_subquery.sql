-- Chapter 11 서브 쿼리
                
-- 조향기보다 급여를 적게 받는 직원들

SELECT  ename, sal
FROM    emp
WHERE   sal < ( SELECT  sal
                FROM    emp
                WHERE   ename='조향기');
                
-- 이문세와 같은 부서에 속한 직원들

SELECT  ename, deptno
FROM    emp
WHERE   deptno = (  SELECT  deptno
                    FROM    emp
                    WHERE   ename = '이문세');

-- 이문세와 다른 부서에 속한 직원들

SELECT  ename, deptno
FROM    emp
WHERE   deptno != ( SELECT  deptno
                    FROM    emp
                    WHERE   ename = '이문세');

-- 평균 급여보다 많이 받는 사원의 이름과 급여

SELECT  ename, sal
FROM    emp
WHERE   sal > ( SELECT  AVG(sal)
                FROM    emp );

-- 가장 많은 급여를 받는 사원의 이름과 급여

SELECT  ename, sal
FROM    emp
WHERE   sal = ( SELECT  MAX(sal)
                FROM    emp );

-- CONN ace

-- 평균 급여보다 적게 받는 사원들의 이름과 급여

SELECT  last_name, salary
FROM    employees
WHERE   salary < (  SELECT  AVG(salary)
                    FROM    employees );

-- Mourgos의 직속 부하 사원 이름들을 모두 출력

SELECT  last_name
FROM    employees
WHERE   manager_id = (  SELECT  employee_id
                        FROM    employees
                        WHERE   last_name = 'Mourgos' );
                        
-- 업무가 IT_PROG인 사원들의 평균 급여보다 적은 급여를 받는 사원들을 출력

SELECT  last_name, salary
FROM    employees
WHERE   salary < (  SELECT  AVG(salary)
                    FROM    employees
                    WHERE   job_id = 'IT_PROG' );

-- (IN 연산자) 급여가 500을 초과하는 사원과 동일한 부서에서 근무하는 사원들의 정보

SELECT  ename
FROM    emp
WHERE   deptno IN ( SELECT  DISTINCT deptno
                    FROM    emp
                    WHERE   sal > 500 );


-- (ALL 연산자)

SELECT  ename, sal
FROM    emp
WHERE   sal > ALL ( SELECT  sal
                    FROM    emp
                    WHERE   deptno = 30 );

-- (ANY 연산자)

SELECT  ename, sal
FROM    emp
WHERE   sal > ANY ( SELECT  sal
                    FROM    emp
                    WHERE   deptno = 30 );

-- (EXISTS 연산자)
-- 서브쿼리의 값이 존재한다면 메인쿼리가 수행된다

SELECT  *
FROM    dept
WHERE   EXISTS (    SELECT  *
                    FROM    emp
                    WHERE   deptno = 10 );

-- correlated query

SELECT  *
FROM    dept
WHERE   EXISTS (    SELECT  *
                    FROM    emp
                    WHERE   emp.deptno = dept.deptno );

-- CTAS (서브쿼리로 CREATE TABLE 하기)

CREATE  TABLE emp02
AS
SELECT  * FROM emp;

DESC    emp02;
DESCRIBE emp;

CREATE  TABLE emp03
AS
SELECT  empno, ename FROM emp;

CREATE  TABLE emp04
AS
SELECT  * 
FROM    emp
WHERE   deptno=10;

CREATE  TABLE   emp05
AS
SELECT  *
FROM    emp
WHERE   1=0;

-- 서브쿼리로 INSERT 하기 

INSERT  INTO    emp05
SELECT  * FROM emp;

SELECT  * FROM emp05;

-- 서브쿼리로 DELETE 하기

DELETE  FROM    emp02;

INSERT  INTO    emp02
SELECT  * FROM  emp;

SELECT  * FROM  emp02;

DELETE  FROM    emp02
WHERE   deptno = (  SELECT  deptno
                    FROM    dept
                    WHERE   dname='영업부' );