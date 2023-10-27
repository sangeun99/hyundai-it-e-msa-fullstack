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