## Chapter 11. 서브 쿼리

- 하나의 SELECT 문장에서 그 문장 안에 포함된 또 하나의 SELECT 문장

### 다중 행 서브 쿼리

- 서브 쿼리에서 반환되는 결과가 하나 이상의 행일 때 사용하는 서브 쿼리
- 다중 행 연산자
    - IN
        - 서브 쿼리의 결과 중에서 하나라도 일치하면 참
    - ANY, SOME
        - 서브 쿼리의 검색결과와 하나 이상이 일치하면 참
    - ALL
        - 서브 쿼리의 검색 결과와 모든 값이 일치하면 참
    - EXIST
        - 서브 쿼리의 결과 중에서 만족하는 값이 하나라도 존재하면 참
        - correlated query (상호 연관 서브쿼리)
            - 메인 테이블에서 나온 결과를 하나씩 가져와서 서브쿼리를 실행함
            
            ```sql
            SELECT  *
            FROM    dept
            WHERE   EXISTS (    SELECT  *
                                FROM    emp
                                WHERE   emp.deptno = dept.deptno );
            ```
            
            - 왔다갔다하면서 쿼리를 수행하기에 성능 떨어뜨림

### 서브쿼리를 이용해 테이블 생성 (CTAS)

- 테이블 구조와 데이터만 그대로 복제됨
    - 제약조건 등은 만들어지지 않음
- TEST할 때 주로 하는 작업
- 테이블 구조만 같도록 생성하고 싶을 때
    - WHERE 1=0 이나 WHERE 1 <> 1으로 결과물이 하나도 안 나오도록 설정 후 테이블 생성
        ```CREATE  TABLE   emp05
            AS
            SELECT  *
            FROM    emp
            WHERE   1=0;```