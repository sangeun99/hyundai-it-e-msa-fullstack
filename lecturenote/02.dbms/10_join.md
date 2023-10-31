## Chapter 10. 조인

- Oracle JOIN
- ANSI JOIN

### Oracle JOIN

- CROSS JOIN (Cartesian JOIN)
    - 조인 조건을 주지 않아 모든 경우의 수가 출력
- EQUI JOIN
- NON EQUI JOIN
- OUTER JOIN
    - LEFT JOIN
        - 왼쪽 테이블의 모든 것을 출력
        - (+)를 붙여 e.deptno가 null이어서 조건에 만족하지 않는 e도 모두 출력할 수 있음
        
        ```sql
        SELECT  e.ename, e.deptno, d.dname
        FROM    emp e, dept d
        WHERE   e.deptno=d.deptno(+)
        ORDER   BY e.ename;
        ```
        
    - RIGHT JOIN
    - FULL JOIN
        - 지원하지 않음
        - FULL OUTER JOIN이 필요하다면 LEFT JOIN한 결과에 RIGHT JOIN한 결과를 UNION
- SELF JOIN

### ANSI JOIN

- CROSS JOIN
    
    ```sql
    SELECT  e.ename, e.deptno, d.deptno, d.dname
    FROM    emp e CROSS JOIN dept d;
    ```
    
- NATURAL JOIN
    - 조건 없이 사용
    - 안 쓰는 것이 좋음 → JOIN USING을 사용하는 것이 좋음
- JOIN ON
    - EQUI JOIN, NON EQUI JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN, SELF JOIN 가능
    - FULL OUTER JOIN도 가능
    - JOIN으로 두 테이블을 연결
        - 명시적으로 `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`으로 표시
    - ON으로 JOIN 조건 명시
- JOIN USING
    
    ```sql
    SELECT  last_name, department_name
    FROM    employees JOIN departments
    USING   (department_id);
    ```
    

### 가이드

- 테이블명에 AS 붙이면 오류 발생
    
    ```sql
    SELECT  e.ename, e.deptno, d.dname
    FROM    emp e, dept d
    WHERE   e.deptno=d.deptno
    ORDER   BY e.name;
    ```
    
- 새로 짜는 쿼리문에서는 Oracle JOIN 지양
    - ANSI JOIN이 훨씬 명확함

### Threeways JOIN

- Oracle JOIN시 한꺼번에 JOIN하는 것은 좋지 않음
- 두개씩 조인하며 결과를 꼭 확인해야 함

```sql
SELECT  e.ename, d.dname, s.grade
FROM    emp e, dept d, salgrade s
WHERE   e.deptno = d.deptno(+)
        AND e.sal BETWEEN s.losal AND s.hisal;
```

### 질의작성기로 쿼리문 작성하기

- 조인할 테이블 선택 (순서 중요)
- 테이블 별칭 지정
- 출력할 컬럼을 선택 및 별칭 지정
- 링크 선택을 통해 JOIN 속성 변경 가능

    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/6e48b824-62ee-446d-b200-ad3ffe5a41b1)


- 오라클이 생각하는 좋은 포맷팅
    
    ```sql
    SELECT
        e.last_name       AS 사원명,
        d.department_name AS 부서명
    FROM
             ace.employees e
        INNER JOIN ace.departments d ON e.department_id = d.department_id
    ```
    
![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/29a5aa1e-2d34-408f-9225-f7524aad8336)