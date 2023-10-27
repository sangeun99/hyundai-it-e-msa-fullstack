## Chapter 02 SQL의 기본

- 내가 가진 테이블 정보를 볼 수 있음

```sql
DESCRIBE TAB;
SELECT * FROM TAB;
```

### 대표적인 절

- SELECT
- FROM
- WHERE
- GROUP BY
- HAVING
- ORDER BY

### SELECT 절

- 산술연산자
    - +, -, *, /
- NULL
    - NULL의 연산
        
        
        | or | TRUE | FALSE | NULL |
        | --- | --- | --- | --- |
        | TRUE | TRUE | TRUE | TRUE |
        | FALSE | TRUE | FALSE | NULL |
        | NULL | TRUE | NULL | NULL |
        
        | and | TRUE | FALSE | NULL |
        | --- | --- | --- | --- |
        | TRUE | TRUE | FALSE | NULL |
        | FALSE | FALSE | FALSE | FALSE |
        | NULL | NULL | FALSE | NULL |
    - NVL 함수: NULL에게 값을 주는 함수
- AS로 별칭 지정
- Concatenation을 이용하여 쿼리문을 만드는 select문

```sql
SELECT 'SELECT * FROM ' || TNAME || ';';
```

- DISTINCT 키워드

### WHERE 절

- 비교연산자
    - =, >, <, ≥, ≤, <>, ≠, ^=
- 논리연산자
    - AND, OR, NOT
- BETWEEN AND 연산자
- IN 연산자
    
    ```sql
    SELECT  *
    FROM    emp
    WHERE   comm IN(80, 100, 200);
    ```
    
- LIKE 연산자와 와일드카드
    - %: 어떤 문자가 몇 개 오든지 상관 없음
    - _: 단 하나의 문자
    - CONCAT을 이용해 LIKE 연산하기
        - 나중에 ‘성’ 부분을 변수처리하여 함수화할 수 있음
            
            ```sql
            SELECT  ename
            FROM    emp
            WHERE   ename LIKE '%' || '성' || '%';
            ```
            
- IS NULL

### ORDER BY 절

- 정렬 방식
    - ASC (생략 가능)
        - NULL은 가장 마지막에 나옴
    - DESC
- 여러 조건 제시 가능

### 집합 연산자

- 집합 연산자 특징
    - `<쿼리1> 집합연산자1 <쿼리2> 집합연산자2 <쿼리N>`
    - 집합연산자가 동작하려면 타입이 일치해야함
    - ALL 키워드 사용 시 중복 제거 안 됨
- UNION (ALL)
- MINUS (ALL)
- INTERSECT (ALL)