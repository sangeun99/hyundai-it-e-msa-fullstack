## Chapter 01 데이터베이스 개념과 오라클 설치

### Oracle 설치하기

- 버전: Oracle Database 21c Express Edition
    - https://www.oracle.com/kr/database/technologies/xe-downloads.html
- SQL Developer 23.1
    - https://www.oracle.com/database/sqldeveloper/technologies/download/
- SQL Developer Data Modeler 23.1
    - https://www.oracle.com/database/sqldeveloper/technologies/sql-data-modeler/download/

### 제대로 설치되었는지 확인
- sys가 모든 권한을 가짐. 그 아래에 system 있음
- system은 서비스만의 관리

  ```bash
  C:\Users\um_se>sqlplus sys/oracle as sysdba
  ```

![1](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/acd4f3a7-df50-4f52-9960-b2795eab8ce2)

- OracleServiceXE: 서버 역할
- OracleOraDB21Home1TNSListener: 요청했는지를 듣고있다가 서버로 연결

  - 이 둘이 실행상태여야 오라클을 사용할 수 있음
  - 그치만 이 둘이 켜져있으면 메모리를 상당히 차지하기에 평소에는 꺼두는 게 좋음
  - 배치파일로 설정
    
    ```bash
    net start OracleOraDB21Home1TNSListener
    net start OracleServiceXE
    ```
    
    ```bash
    net stop OracleServiceXE
    net stop OracleOraDB21Home1TNSListener
    ```
    

### 환경설정하기
- `col name for a30 name` 컬럼 값을 포맷팅 (allocation 30)
- v$services → 시스템에 저장된 관리용 뷰
```sql
SQL> col name for a30
SQL> col pdb for a30
SQL> select name, pdb
  2  from v$services
  3  order by name;
```


![2](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/f1d90d54-f3b3-4f87-beb0-f5f3b571c82a)
- CDB$ROOT → Container Database
- XEPDB1 → Pluggable Database, 우리가 사용할 DB

- 현재 컨테이너 이름 확인 → CDB$ROOT

  ```sql
  SQL> SHOW CON_NAME
  ```

- PDB 사용하기 위한 세션 변경 (CDB$ROOT → XEPDB1)

  ```sql
  SQL> alter session set container = xepdb1;
  ```

- 아이디 ACE, 비밀번호 ACE인 사용자 생성

  ```sql
  SQL> CREATE USER ACE
    2  IDENTIFIED BY ACE
    3  DEFAULT TABLESPACE USERS
    4  TEMPORARY TABLESPACE TEMP;
  ```

- 사용자에게 권한 부여하기

  ```sql
  SQL> GRANT CONNECT,
    2     RESOURCE,
    3     CREATE SESSION,
    4     CREATE TABLE,
    5     CREATE PROCEDURE,
    6     CREATE TRIGGER,
    7     CREATE VIEW,
    8     CREATE SEQUENCE
    9  TO ACE;
  ```

- 유저 테이블에 무제한 권한을 부여
  ```
  SQL> lalter user ACE
  2     quota unlimited on users;
  ```

- Oracle에 만든 사용자 이용해 접속하기
  ```bash
  C:\Users\um_se>sqlplus ACE/ACE@localhost:1521/xepdb1
  ```
  ```bash
  PS C:\Users\um_se> sqlplus /nolog
  SQL> conn ACE/ACE as sysdba
  ```
  → 먼저 클라이언트 툴에 접근하고 아이디, 비밀번호를 입력하는 편이 더욱 안전

- *.sql 파일 실행하기
  ```bash
  @C:\dev\sw\creobjects.sql
  ```

### Oracle SQL Developer 시작하기

- Oracle SQL Developer에서 접속하기
  ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/2fe87677-83ac-4fa8-9f41-3e49629d8ad4)
- 사용자 계정의 워크시트 열어 쿼리 날리기
  ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/c17891fe-450a-4522-a1e2-f352a91732f8)

  ### DATABASE 개요

- SELECT: 원하는 데이터집합을 데이터베이스에게 요청하고 묘사하는 작업
    - * 사용하기보다 특정 컬럼을
    - 대소문자 형식을 맞춰서 쿼리를 날려야 성능이 좋음
        - 쿼리 동작 과정
            - 1) 문법이 맞는지 syntax check
            - 2) 각 테이블이 있는지 권한도 가지고 있는지 semantic check
            - 3) 기존에 사용한 명령어가 들어있는 library cache를 hashing 기법으로 탐색함
- VIEW: 쿼리를 저장하는 오브젝트
    - MATERALIZED VIEW: 물리적인 뷰
- SEQUENCE: 은행 번호표 같은 느낌
- INDEX
    - 전체의 3~4% 만을 사용할 때 성능이 좋아진다고 알려져 있음

### Oracle

- Oracle 12c
    - c는 Cloud, Consolidation
    - 클라우드용 설계
    - 다수의 데이터베이스를 하나로 관리
        - 플러거블DB(PDB): 컨테이너DB 안에 존재하는 DB
- Oracle에서 유저 = 스키마

### SQL 명령어의 유형

- DML
- DDL
- DCL
- TCL (트랜젝션 처리어)
    - COMMIT
    - ROLLBACK
    - SAVEPOINT
        - 트랜젝션 내에 임시 저장점 설정

### SQL 매뉴얼

- [https://docs.oracle.com/en/database/oracle/oracle-database/21/sqlrf/index.html#Oracle®-Database](https://docs.oracle.com/en/database/oracle/oracle-database/21/sqlrf/index.html#Oracle%C2%AE-Database)

### 실습을 위한 셋팅

- 유저 만들기

```sql
create user tester1
identified by 1234
account unlock;
```

- 유저 아이디 바꾸기

```sql
alter user tester1
identified by tester1;
```

- 유저 찾기

```sql
select username
from dba_users
where username like '%TESTER%';
```

- 유저 권한 부여

```sql
grant connect,
    resource,
    create session,
    create table,
    create procedure,
    create trigger,
    create view,
    create sequence
to tester1;
```

```sql
alter user tester1
default tablespace users
temporary tablespace temp
quota unlimited on users;
```

- 테이블 쿼리문 실행하기

```sql
@"파일명"
```

### ERD 다이어그램 그리기

- [보기] → [Data Modeler] → [브라우저]
- 관계형 모델 만들기

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/27073683-c320-4cc6-b713-8d920d0ae16e)

### 데이터 타입

- HWM
    - 데이터 변경을 대비하여 60% 정도만 채움
- CLOB
    - 대용량의 텍스트 데이터를 저장하기 위한 데이터타입
    - 게시판의 본문 같은 걸로 많이 이용
- DATE
    - YYYY/MM/DD를 쓰는 게 좋음

### 데이터 무결성과 제약조건

- NOT NULL 제약조건
    - NULL: 할당받지 않은 값, 알 수 없음
- 기본 키 제약조건
    - NOT NULL + UNIQUE
- 외래 키 제약조건