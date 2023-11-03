-- Chapter 04

SELECT  MAX(hiredate) - MIN(hiredate)
FROM    emp;

SELECT  deptno, sum(sal)
FROM    emp
GROUP   BY deptno;

SELECT  COUNT(*) AS "전체 사원의 수",
        COUNT(comm) AS "커미션 받는 사원 수"
FROM    emp;

SELECT  COUNT(DISTINCT job) AS "업무수"
FROM    emp;

-- GROUP BY 절

SELECT  deptno, COUNT(*) "부서별 사원수", COUNT(comm) "커미션 받는 사원 수"
FROM    emp
GROUP   BY deptno;

-- HAVING 절

SELECT  deptno, AVG(sal)
FROM    emp
GROUP   BY deptno
HAVING  AVG(sal) >= 500;

SELECT  job, COUNT(*), SUM(sal)
FROM    emp
WHERE   job NOT LIKE '%사원%'
GROUP   BY job
HAVING  SUM(sal) >= 1000
ORDER   BY SUM(sal);

-- 각 job별, 업무별 급여의 합계

SELECT  job
        ,sum(decode(deptno, '10', sal)) as d10
        ,sum(decode(deptno, '20', sal)) as d20
        ,sum(decode(deptno, '30', sal)) as d30
        ,sum(sal)
FROM    emp
GROUP   BY job;

-- CONN ace

SELECT  job_id
        ,sum(decode(department_id, '10', salary)) as d10        
        ,sum(decode(department_id, '20', salary)) as d20
        ,sum(decode(department_id, '50', salary)) as d50
        ,sum(decode(department_id, '60', salary)) as d60
        ,sum(decode(department_id, '90', salary)) as d90
        ,sum(decode(department_id, '110', salary)) as d110
        ,sum(salary)
FROM    employees
GROUP   BY job_id;