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
    
-- 1. set operator를 이용하여 job ID가 ST_CLERK을 포함하지 않는 부서의 ID를 출력하세요.

--DEPARTMENT_ID 
--10  
--20  
--60  
--80  
--90  
--110  
--190  

--7 rows selected.

SELECT  department_id
FROM    departments
MINUS
(SELECT  department_id
FROM    job_history
WHERE   job_id = 'ST_CLERK'
UNION
SELECT  department_id
FROM    employees
WHERE   job_id = 'ST_CLERK');

-- 2. set operator를 이용하여 부서가 없는 지역의 Country ID와 이름을 출력하세요.

--@결과
--COUNTR  COUNTRY_NAME  
--DE      Germany

SELECT  country_id, country_name
FROM    countries
WHERE   country_id NOT IN (
    SELECT  DISTINCT country_id
    FROM    locations l, departments d
    WHERE   l.location_id = d.location_id);

--3. 부서가 10, 50 그리고 20의 순서로 부서의 업무리스트를 정렬하고 set operators를 이용하여 job ID와 department ID를 출력하세요.

--JOB_ID  DEPARTMENT_ID  A_DUMMY  
--AD_ASST            10  1  
--ST_CLERK           50  2  
--ST_MAN             50  2  
--MK_MAN             20  3  
--MK_REP             20  3  
--

(SELECT  job_id, department_id, 1 a_dummy
FROM    employees
WHERE   department_id = 10
UNION
SELECT  job_id, department_id, 2 a_dummy
FROM    employees
WHERE   department_id = 50
UNION
SELECT  job_id, department_id, 3 a_dummy
FROM    employees
WHERE   department_id = 20)
ORDER   BY a_dummy;

--4. 입사후 현재 업무와 같은 업무를 담당한 적이 있는 사원의 employee ID와 job ID를 출력하세요.

--EMPLOYEE_ID  JOB_ID  
--176          SA_REP  
--200          AD_ASST 

(SELECT  employee_id, job_id
FROM    employees
INTERSECT
SELECT  employee_id, job_id
FROM    job_history)
ORDER BY employee_id;

-- 5. 소속된 부서에 상관 없이 employees 테이블에 있는 모든 사원의 last name과 부서 번호
-- 소속된 사원에 상관 없이 departments 테이블에 있는 모든 부서의 부서 번호와 부서 이름

SELECT  last_name, department_id, NULL AS department_name
FROM    employees
UNION
SELECT  NULL AS last_name, department_id, department_name
FROM    departments;

