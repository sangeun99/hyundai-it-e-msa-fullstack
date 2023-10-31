## Chapter 09 데이터 무결성을 위한 제약조건

- 사용자가 CRUD를 진행할 때, 3-Tier 구조에서 각각의 단계에서 데이터를 체크하는 과정이 필요함
- 그 중 DB쪽 체크 과정 → 데이터 무결성 제약조건
    - 테이블에 부적절한 자료가 들어오는 것을 방지하기 위해 컬럼에 정의하는 여러가지 규칙

### 무결성 제약조건의 종류

- NOT NULL
- UNIQUE
    - NULL값은 확인 불가능하기에 NULL값은 중복되어 넣을 수 있음
- PRIMARY KEY
    - NOT NULL + UNIQUE
- FOREIGN KEY
- CHECK
    - 저장 가능한 데이터의 값의 범위나 조건 지정

### 제약조건 확인 방법

```sql
DESC    user_constraints;
```

```sql
SELECT  *
FROM    user_constraints;
```

### 제약조건 만들기

- 컬럼 레벨 정의 방법
    - 컬럼명 데이터타입 제약조건유형
        
        ```sql
        CREATE  TABLE test01 (
        name    VARCHAR2(10) NOT NULL);
        ```
        
- 테이블 레벨 정의 방법
    - CONSTRAINT 제약조건명 제약조건유형(컬럼명)
        
        ```sql
        CREATE  TABLE test03 (
        name    VARCHAR2(10),
        CONSTRAINT  CHK_MYCHECK CHECK(NAME IS NOT NULL));
        ```
        
    - 제약조건의 이름을 걸어두는 게 좋음 → 식별에 용이
    - 제약조건명
        - `[테이블명]_[컬럼명]_[제약조건유형]`
        - `EMP04_EMPNO_UK`

### DEFAULT 제약조건

- 아무런 값을 입력하지 않았을 때 디폴트 값으로 입력

```sql
CREATE  TABLE dept01 (
    deptno  NUMBER(2) PRIMARY KEY,
    dname   VARCHAR2(14),
    loc VARCHAR2(13) DEFAULT '서울'
    );
```