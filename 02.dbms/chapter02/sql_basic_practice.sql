-- CONN ACE

-- 1. 

SELECT  last_name, salary, job_id
FROM    employees
WHERE   salary >= 10000
    AND job_id LIKE '%MAN%';
    
-- 2.

SELECT  last_name, salary, job_id
FROM    employees
WHERE   salary >= 10000
    OR  job_id LIKE '%MAN%';
    
-- 3.

SELECT  last_name, job_id
FROM    employees
WHERE   job_id NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP');

-- 4.

SELECT  last_name, commission_pct
FROM    employees
WHERE   commission_pct IS NOT NULL;

-- 5.

SELECT  last_name, job_id, salary
FROM    employees
WHERE   job_id IN ('ST_CLERK', 'SA_REP')
    AND salary NOT IN (2500, 3500, 7000);