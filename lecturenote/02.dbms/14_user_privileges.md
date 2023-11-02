## Chapter 14 사용자 권한

### 사용자 생성하기

```sql
CREATE  USER tester2
IDENTIFIED  BY 1234;
```

### 사용자 권한 부여하기

- DBA의 시스템 권한
    - CREATE USER
    - DROP USER
    - DROP ANY TABLE
    - QUERY REWRITE
    - BACKUP ANY TABLE
- 사용자를 위한 시스템 권한
    - CREATE SESSION
    - CREATE TABLE
    - CREATE VIEW
    - CREATE SEQUENCE
    - CREATE PROCEDURE
- 권한 부여 방법
    
    ```sql
    GRANT   CREATE TABLE
    TO      tester2;
    ```
    

### WITH ADMIN OPTION

- 데이터베이스 관리자가 아닌데도 불구하고 부여 받은 시스템 권한을 다른 사용자에게 부여할 수 있는 권한

```sql
GRANT   CREATE SESSION
TO      tester3
WITH    ADMIN OPTION;
```

### 객체 권한

- 특정 객체에 조작할 수 있는 권한
- 객체의 소유자는 객체에 대한 모든 권한을 가짐
- 다른 유저의 객체에 접근하기
    
    ```sql
    -- CONN tester1
    -- tester1의 테이블 객체 권한을 tester2에게 부여하기
    
    GRANT   SELECT ON dept TO tester2;
    
    -- CONN tester2
    
    SELECT  *
    FROM   tester1.dept;
    ```
    

### 스키마

- 객체를 소유한 사용자명

### 사용자에게 부여된 권한 조회

- 접속된 사용자가 다른 사용자에게 부여한 권한 정보 조회

```sql
SELECT  *
FROM    user_tab_privs_made;
```

- 접속된 사용자가 자신에게 부여한 사용자 권한 정보 조회

```sql
SELECT  *
FROM    user_tab_privs_recd;
```

### 사용자에게서 권한을 뺏는 REVOKE 명령어

```sql
REVOKE  SELECT  ON dept FROM tester2;
```

### WITH GRANT OPTION

- 그 객체를 접근할 권한을 부여받음
- 동시에 다른 사용자에게 그 권한을 부여할 수 있는 권한 부여받음

```sql
GRANT   SELECT ON tester1.dept TO tester3
WITH    GRANT OPTION;
```

### 롤을 사용한 권한 부여

- 사전 정의된 롤의 종류
    - CONNECT 롤
        - 데이터베이스에 접속 가능하도록 하기 위한 가장 기본적인 시스템 권한
    - RESOURCE 롤
        - 사용자가 객체를 생성할 수 있도록 하기 위한 시스템 권한
    - DBA 롤
- 롤 만들기
    - 롤을 생성한다. (DBA)
    - 롤에 권한을 부여한다. (DBA 혹은 객체를 소유한 특정 사용자)
    - 사용자에게 롤을 부여한다. (DBA)
    
    ```sql
    SELECT  *
    FROM    tester1.dept;
    
    SELECT  *
    FROM    role_tab_privs
    WHERE   table_name IN ('DEPT');
    ```
    
- 롤을 이용한 권한 부여가 제대로 안 된다면 재접속해서 확인해보기
- 롤 회수하기
    
    ```sql
    REVOKE  mrole2 FROM tester6;
    ```
    
- 롤 제거하기
    
    ```sql
    DROP    role mrole2;
    ```
    
- 롤의 장점
    - 간편한 권한 부여 작업

### 동의어 (시너님)

- 다른 사용자의 테이블 접근 시 [사용자명.테이블명] 으로 접근하는데 별칭을 사용할 수 있음
- DUAL 테이블도 공개 동의어로 지정되어 있음
- 동의어 생성하기
    - 비공개 동의어
        - 비공개 동의어는 권한을 부여받는 사용자가 정의해야 함
            
            ```sql
            CREATE  SYNONYM PRISYSTBL FOR sys.systbl;
            ```
            
    - 공개 동의어
        - DBA가 공개 동의어 생성 가능
            
            ```sql
            CREATE  PUBLIC SYNONYM pubDept FOR tester1.dept;
            ```
            
- 동의어 제거하기
    - 비공개 동의어
        - 비공개 동의어의 소유자가 접속해서 제거해야 함
            
            ```sql
            DROP    SYNONYM prisystbl;
            ```
            
    - 공개 동의어
        - DBA가 제거해야 함
            
            ```sql
            DROP    PUBLIC SYNONYM pubDept;
            ```