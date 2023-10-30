SELECT
    e.last_name             AS 사원명,
    d.department_name       AS 부서명,
    m.last_name             AS 사수명,
    g.grade_level           AS 등급명,
    ace.regions.region_name AS 지역명,
    c.country_name          AS 나라명,
    lo.city                 AS 도시명
FROM
    ace.employees   e
    LEFT JOIN ace.employees   m ON e.manager_id = m.employee_id
    LEFT JOIN ace.departments d ON e.department_id = d.department_id
    INNER JOIN ace.job_grades  g ON e.salary BETWEEN g.lowest_sal AND g.highest_sal
    LEFT JOIN ace.locations   lo ON d.location_id = lo.location_id
    LEFT JOIN ace.countries   c ON lo.country_id = c.country_id
    LEFT JOIN ace.regions ON c.region_id = ace.regions.region_id