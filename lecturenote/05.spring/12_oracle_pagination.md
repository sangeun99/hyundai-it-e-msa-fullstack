## Chapter 12. 오라클 데이터베이스 페이징 처리

### order by의 문제점

- 많은 리소스 소모
- 대신 인덱스 사용
    - 힌트를 이용해 어떤 방식으로 실행할지를 명시할 수 있음

### 힌트

- 문법
    
    ```sql
    SELECT
    	/* + Hint name ( param...) */ column name, ...
    FROM
    	table name
    ```
    
- FULL 힌트
    - 테이블 전체를 스캔할 것으로 명시
        - 느린 실행
- INDEX_ASC, INDEX_DESC 힌트
    - 순서대로 이용할 것인지 역순으로 이용할 것인지를 지정

### ROWNUM

- 데이터를 가져올 때 적용
- 이후에 정렬되는 과정에서는 ROWNUM이 변경되지 않음