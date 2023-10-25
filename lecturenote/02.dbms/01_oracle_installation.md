## Chapter 01 데이터베이스 개념과 오라클 설치

### Oracle 설치하기

- 버전: Oracle Database 21c Express Edition
    - https://www.oracle.com/kr/database/technologies/xe-downloads.html
- SQL Developer 23.1
    - https://www.oracle.com/database/sqldeveloper/technologies/download/
- SQL Developer Data Modeler 23.1
    - https://www.oracle.com/database/sqldeveloper/technologies/sql-data-modeler/download/

### 제대로 설치되었는지 확인

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

```sql
SQL> col name for a30
SQL> col pdb for a30
SQL> select name, pdb
  2  from v$services
  3  order by name;
```

![2](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/f1d90d54-f3b3-4f87-beb0-f5f3b571c82a)

- 컨테이너 이름 확인 → CDB$ROOT

  ```sql
  SQL> show con_name
  ```

- pdb를 사용하기 위한 세션 변경 (CDB$ROOT → XEPDB1)

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

- Oracle에 만든 사용자 이용해 접속하기
  ```bash
  C:\Users\um_se>sqlplus ACE/ACE@localhost:1521/xepdb1
  ```