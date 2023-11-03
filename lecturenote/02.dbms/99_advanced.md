### ROLLUP, CUBE

- GROUP BY의 확장으로 기본적인 수행 성능을 보장
- ROLLUP은 나열되는 컬럼의 순서가 매우 중요, CUBE는 중요하지 않음
- GROUPING 함수
    - 원래 컬럼 값의 NULL인지, ROLLUP과 CUBE에 의해 생성된 NULL인지 구분을 위해 사용

---

- ROLLUP
    - deptno 별, job 별로 인원과 급여를 출력
    - deptno가 바뀔 때마다, deptno별 집계가 출력. 모든 deptno가 출력되면 집계 정보가 출력

```sql
SELECT  deptno, GROUPING(deptno),
        job, GROUPING(job),
        COUNT(*), AVG(sal)
FROM    emp
GROUP   BY ROLLUP(deptno, job)
ORDER   BY deptno, job;
```

- CUBE
    - deptno가 바뀔 때마다 deptno별 집계 출력
    - 모든 deptno가 출력되면 job별 집계 정보 출력
    - job별 전체 집계 정보 출력이 ROLLUP과의 이

```sql
SELECT  deptno, GROUPING(deptno),
        job, GROUPING(job),
        COUNT(*), AVG(sal) * 12
FROM    emp
GROUP   BY CUBE(deptno, job);
```

### 계층형 쿼리

- 참고 자료 [Hierarchical Queries (oracle.com)](https://docs.oracle.com/database/121/SQLRF/queries003.htm#SQLRF52332)
- 계층 구조를 가진 데이터를 쿼리하고 조작
- 계층 구조 데이터는 트리 구조로 표현
- 부서 조직도, 제품 카테고리, 계정 계층 구조, 답변형 게시판에서 이용 가능

```sql
SELECT  last_name, LEVEL
FROM    employees
START   WITH manager_id IS NULL
CONNECT BY manager_id = PRIOR employee_id;
```

- 작업 과정
    - 첫 레코드의 employee_id를 manager_id로 가진 사람을 찾고 그걸 보여줌
    - 만약 manager_id로 두는 사람이 없다면 수평적으로 이동
- LEVEL
    - 직접 만들지 않아도 사용 가능한 수도컬럼
- CONNECT BY
    - 현재 레코드에서 어떤 레코드로 이어줄 것인지 설정
    - START WITH를 정해주는 게 중요함
        - 지정을 안 하면 첫 컬럼으로 임의의 컬럼을 선택하기에 원하는 결과보다 더 많이 돌아가게 됨
- PRIOR
    - PRIOR 찍힌 쪽에서 반대쪽으로 흐르게 됨

```sql
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
ORDER   SIBLINGS BY employee_id ASC;
```

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/41a3f379-8125-4ce4-9494-733c56001e5f)

- CONNECT_BY_ROOT
    - ROOT 노드 보여줌
- CONNECT_BY_ISLEAF
    - 마지막 노드인지 여부를 확인
- SYS_CONNECT_BY_PATH
    - 각 데이터의 ROOT 값과 LEVEL 값을 출력
- PRIOR last_name
    - 나 자신을 연결해준 이전 이름을 찾음
- SIBLINGS BY
    - 계층형 구조에서는 ORDER BY를 직접 지정하면 안 됨
    - 같은 계층 내에서 순서를 지정해주고 싶다면 SIBLINGS BY 이용
    - 연결된 컬럼으로만 SIBLINGS BY 옵션을 줄 수 있음

### GROUPING SETS

- GROUP BY 절과 UNION ALL이 결합된 형태
- UNION ALL 을 이용 시 각 컬럼의 데이터 타입을 맞추기 위해 NULL 이용
- 그 대신 GROUPING SETS 절을 이용할 수 있음

```sql
SELECT  deptno, job, mgr, avg(sal)
FROM    emp
GROUP   BY GROUPING SETS ((deptno, job), (job,mgr));
```

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/3f05eb26-2675-481b-b801-0ff11b503cb2)

### WITH절

- 동일 블록에 대해 반복적으로 SQL문을 사용하는 경우 그 블록에 이름을 부여하여 재사용
- 목적
    - 동일 테이블 접근을 최소화
    - 임시 테이블을 만들어 필요한 데이터를 메모리로 접근하기에 디스크IO보다 성능 개선
- 주의사항
    - 메인 쿼리에 정의될 서브 쿼리에 대한 인라인 뷰는 먼저 선언해야 함
    - 인라인 뷰의 이름을 직관적으로 정의
    - 여러 개의 서브 쿼리가 사용된다면 순서대로 선언
    - 서브 쿼리에서 서브 쿼리를 참조하는 경우 참조되는 쿼리를 먼저 선언

```
WITH    A AS (  SELECT  deptno, SUM(sal) as sum_sal, count(*) AS cnt
                FROM    emp
                GROUP   BY deptno )
SELECT  'sum', SUM(sum_sal)
FROM    A
UNION   ALL
SELECT  'avg', sum_sal/cnt
FROM    A;
```

### 트랜잭션

- DML 완료 전 DDL 날리면 기존 트랜젝션이 종료됨 (커밋됨)

### Multiple Column 서브쿼리

- fruits 테이블에서 판매된 과일만을 조회하는 쿼리 예시
- Non-pairwise 쿼리 예시

  ```sql
  SELECT  *
  FROM    fruits
  WHERE   name IN (SELECT name FROM purchases)
  AND     grade IN (SELECT grade FROM purchases);
  ```

- pairwise 쿼리 예시

  ```sql
  SELECT  *
  FROM    fruits
  WHERE   (name, grade) IN (SELECT name, grade FROM purchases);
  ```