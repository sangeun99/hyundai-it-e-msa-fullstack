## Chapter 07 테이블 구조를 생성, 변경 및 제어하는 DDL

### 테이블 구조 생성 CREATE TABLE

```sql
CREATE  TABLE emp01 (
        empno NUMBER(4),
        ename VARCHAR2(14),
        sal NUMBER(7, 3));
```

### 테이블 구조 변경 ALTER TABLE

- ALTER TABLE [테이블명] ADD ( [컬럼명] [컬럼타입] );
- ALTER TABLE [테이블명] MODIFY ( [컬럼명] [컬럼타입] );
- ALTER TABLE [테이블명] DROP COLUMN ( [컬럼명] );
- ALTER TABLE [테이블명] SET UNUSED( [컬럼명] );
    - 컬럼이 없어지지만 실제 테이블에서 컬럼이 제거되지는 않음
    - 제거 시 ALTER TABLE [테이블명] DROP UNUSED COLUMNS; 이용

### 테이블명 변경 RENAME TABLE

- RENAME [이전테이블명] TO [새테이블명];

### 데이터 구조 제거 DROP TABLE

- 휴지통으로 가지 않고 바로 삭제하려면 PURGE 키워드

  ```sql
  DROP    TABLE emp03 PURGE;
  ```

- 삭제한 테이블 살리기
    - FLASHBACK TABLE [테이블명] TO BEFORE DROP;
- 휴지통 비우기
    - PURGE RECYCLEBIN;

### 모든 데이터 제거 TRUNCATE TABLE

- 테이블은 존재하면서 데이터 내용만을 모두 제거
- TRUNCATE TABLE [테이블명];

### 데이터 딕셔너리

- DBMS를 운용하기 위한 시스템 오브젝트의 집합
    - 오라클 대표적 오브젝트
        - 테이블
        - 시퀀스
            - 번호표 발생기
        - 인덱스
        - 뷰
        - 시너님
            - 객체에 별칭을 붙임
        - (+) 프로시저
- USER_
    - 자신의 계정이 소유한 객체 등에 관한 정보 조회
    - 계정이 소유한 테이블 정보 확인
        
        ```sql
        SELECT  * FROM tab; -- 많이 사용하지 않음
        SELECT  * FROM user_tables;
        SELECT  * FROM user_objects;
        ```
        
- ALL_
    - 자신 계정 소유 또는 권한을 부여 받은 객체 등에 관한 정보 조회
- DBA_
    - 데이터베이스 관리자만 접근 가능한 객체 등의 정보 조회