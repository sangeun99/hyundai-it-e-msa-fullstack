-- Chapter 10. Join

-----------------
-- Oracle JOIN --
-----------------

-- CROSS JOIN

SELECT  e.ename, e.deptno, d.deptno, d.dname
FROM    emp e, dept d;

-- EQUI JOIN

SELECT  e.ename, e.deptno, d.dname
FROM    emp e, dept d
WHERE   e.deptno=d.deptno
ORDER   BY e.ename;

SELECT  e.ename, e.deptno, d.dname
FROM    emp e, dept d
WHERE   e.deptno=d.deptno
        AND d.deptno = 20;
        
SELECT  e.ename, e.job, d.dname
FROM    emp e, dept d
WHERE   e.deptno=d.deptno
        AND e.job = '사원';
    
-- NON EQUI JOIN

SELECT  e.ename, e.sal, s.grade
FROM    emp e, salgrade s
WHERE   e.sal BETWEEN s.losal AND s.hisal
ORDER   BY s.grade ASC;

-- CONN ace

SELECT  e.last_name, e.salary, j.grade_level
FROM    employees e, job_grades j
WHERE   e.salary BETWEEN j.lowest_sal AND j.highest_sal
ORDER   BY j.grade_level;

-- OUTER JOIN
-- (1) LEFT OUTER JOIN

SELECT  e.ename, e.deptno
FROM    emp e
WHERE   e.deptno IS NULL;

SELECT  e.ename, e.deptno, d.dname
FROM    emp e, dept d
WHERE   e.deptno=d.deptno(+)
ORDER   BY e.ename;

SELECT  e.last_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id=d.department_id(+)
ORDER   BY e.last_name;

-- (2) RIGHT OUTER JOIN

SELECT  d.manager_id, e.last_name, d.department_name
FROM    employees e, departments d
WHERE   e.employee_id(+)=d.manager_id;

-- (3) FULL OUTER JOIN
-- 불가능

-- SELF JOIN

SELECT  e.ename AS "사원"
        , m.ename AS "멘토"
FROM    emp e, emp m
WHERE   e.mgr=m.empno(+);

SELECT  e.last_name AS employee, m.last_name AS manager
FROM    employees e, employees m
WHERE   e.manager_id = m.employee_id;

---------------
-- ANSI JOIN --
---------------

-- CROSS JOIN

SELECT  e.ename, e.deptno, d.deptno, d.dname
FROM    emp e
CROSS JOIN dept d;

-- NATURAL JOIN

SELECT  ename, dname
FROM    emp
NATURAL JOIN dept;

SELECT  last_name, department_name
FROM    employees
NATURAL JOIN departments;

SELECT  last_name, department_name
FROM    employees
JOIN departments
USING   (department_id);

-- JOIN ON

-- EQUI JOIN

SELECT  e.ename, e.deptno, d.dname
FROM    emp e
INNER JOIN dept d
ON   e.deptno=d.deptno
ORDER   BY e.ename;

-- NON EQUI JOIN

SELECT  e.ename, e.sal, s.grade
FROM    emp e
INNER JOIN salgrade s
ON      e.sal BETWEEN s.losal AND s.hisal
ORDER   BY s.grade ASC;

-- OUTER JOIN
-- (1) LEFT OUTER JOIN

SELECT  e.ename, e.deptno, d.dname
FROM    emp e
LEFT OUTER JOIN dept d
ON      e.deptno=d.deptno
ORDER   BY e.ename;

-- (2) RIGHT OUTER JOIN

SELECT  e.ename, e.deptno, d.dname
FROM    emp e
RIGHT OUTER JOIN dept d
ON      e.deptno=d.deptno
ORDER   BY e.ename;

-- (3) FULL OUTER JOIN

SELECT  e.ename, e.deptno, d.dname
FROM    emp e
FULL OUTER JOIN dept d
ON      e.deptno=d.deptno
ORDER   BY e.ename;

-- SELF JOIN

SELECT  e.ename AS "사원"
        , m.ename AS "멘토"
FROM    emp e
LEFT OUTER JOIN emp m
ON   e.mgr=m.empno;

-- CONN ace

-- NON EQUI JOIN

SELECT  e.last_name, e.salary, j.grade_level
FROM    employees e
INNER JOIN job_grades j
ON      e.salary BETWEEN j.lowest_sal AND j.highest_sal
ORDER   BY j.grade_level;

-- OUTER JOIN
-- (1) LEFT OUTER JOIN

SELECT  e.last_name, e.department_id, d.department_name
FROM    employees e LEFT JOIN departments d
ON      e.department_id=d.department_id
ORDER   BY e.last_name;

-- (2) RIGHT OUTER JOIN

SELECT  d.manager_id, e.last_name, d.department_name
FROM    employees e
RIGHT JOIN departments d
ON      e.employee_id=d.manager_id;

-- (3) FULL OUTER JOIN

SELECT  d.manager_id, e.last_name, d.department_name
FROM    employees e
FULL JOIN departments d
ON      e.employee_id=d.manager_id;

-- SELF JOIN

SELECT  e.last_name AS employee, m.last_name AS manager
FROM    employees e
LEFT JOIN employees m
ON      e.manager_id = m.employee_id;

-- Threeways JOIN

SELECT  e.ename AS 사원명
        , NVL(d.dname, '대기발령') AS 부서명
        , s.grade AS 등급
FROM    emp e, dept d, salgrade s
WHERE   e.deptno = d.deptno(+)
        AND e.sal BETWEEN s.losal AND s.hisal;
        
SELECT  e.last_name, d.department_id, j.grade_level
FROM    employees e, departments d, job_grades j
WHERE   e.department_id = d.department_id(+)
        AND e.salary BETWEEN j.lowest_sal AND j.highest_sal;

-- Threeways JOIN (ANSI)

SELECT  e.ename AS 사원명
        , d.dname AS 부서명
        , e.sal AS 급여
        , s.grade AS 등급
FROM    emp e
LEFT JOIN dept d
ON      e.deptno = d.deptno
JOIN    salgrade s
ON      e.sal BETWEEN s.losal AND s.hisal;

SELECT  e.last_name AS 사원명
        , d.department_name AS 부서명
        , e.salary AS 급여
        , j.grade_level AS 등급
FROM    employees e
LEFT JOIN departments d
ON      e.department_id = d.department_id
JOIN    job_grades j
ON      e.salary BETWEEN j.lowest_sal AND j.highest_sal;

---

SELECT  e.last_name AS 사원명
        , m.last_name AS 사수명
        , d.department_name AS 부서명
        , lo.city AS 도시명
        , j.job_id AS 업무명
FROM    employees e, departments d, employees m, locations lo, jobs j
WHERE   e.department_id = d.department_id (+)
        AND e.manager_id = m.employee_id (+)
        AND d.location_id = lo.location_id (+)
        AND e.job_id = j.job_id;


SELECT  e.last_name
        , d.department_id
        , m.last_name
        , lo.city
        , j.job_title
FROM    employees e
LEFT JOIN departments d
ON      e.department_id = d.department_id
LEFT JOIN employees m
ON      e.manager_id = m.employee_id
LEFT JOIN locations lo
ON      d.location_id = lo.location_id
INNER JOIN jobs j
ON      e.job_id = j.job_id;

---

SELECT  e.last_name, e.salary, j.grade_level, d.department_name, lo.city, c.country_name
FROM    employees e
JOIN    job_grades j
ON      e.salary BETWEEN j.lowest_sal AND j.highest_sal
LEFT JOIN    departments d
ON      e.department_id = d.department_id
LEFT JOIN   locations lo
ON      d.location_id = lo.location_id
LEFT JOIN   countries c
ON      lo.country_id = c.country_id;

SELECT  e.last_name, e.salary, j.grade_level, d.department_name, lo.city, c.country_name
FROM    employees e
        , job_grades j
        , departments d
        , locations lo
        , countries c
WHERE   e.salary BETWEEN j.lowest_sal AND j.highest_sal
        AND e.department_id = d.department_id (+)
        AND d.location_id = lo.location_id (+)
        AND lo.country_id = c.country_id (+);
        