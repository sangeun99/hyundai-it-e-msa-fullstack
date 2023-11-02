## Chapter 13 시퀀스와 인덱스

- 시퀀스
    - 테이블 내의 유일한 숫자를 자동으로 생성하는 자동 번호 발생기
- 인덱스
    - 처리 속도를 향상시키기 위해 컬럼에 대해 생성하는 오라클 객체
    - 하지만 항상 빨라지는 것은 아님

### 시퀀스 생성

- `CREATE SEQUENCE sequence_name`
- 옵션
    - START WITH
        - 시퀀스 번호의 시작 값 지정
    - INCREMENT BY
        - 시퀀스 증가치 지정
    - MAXVALUE n | NOMAXVALUE
    - MINVALUE n | NOMINVALUE
    - CYCLE
        - 최대값까지 증가가 완료하면 다시 시작값에서 시작
    - NOCYCLE
        - 증가가 완료하면 에러
    - CACHE n
        - 메모리상의 시퀀스 값 관리
        - CACHE를 이용할 경우
            - 2까지 부여 후 재부팅 시 시퀀스가 2 → 10으로 뛸 수 있음
            - 이 때 사이에 빈 번호를 채우는 행위는 의미 없음
    - NOCACHE

```sql
CREATE  SEQUENCE dept_deptno_seq
        START WITH 10
        INCREMENT BY 10;
```

### 시퀀스 사용하기

- CURRVAL
- NEXTVAL

---

- CURRVAL에 새로운 값이 할당되기 위해서는 NEXTVAL로 새로운 값을 생성해야 함
- 새로운 시퀀스에서 NEXTVAL로 새로운 값을 생성하지 않고 CURRVAL 조회 시 에러

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/ae51a8a2-51cd-4810-a00f-17a849df609a)

### 시퀀스 정보 살피기

```sql
DESC    user_sequences;

SELECT  sequence_name, min_value, max_value, increment_by, cycle_flag
FROM    user_sequences;
```

### 시퀀스 제거하기

```sql
DROP    SEQUENCE dept_deptno_seq;
```

### 시퀀스 수정하기

```sql
ALTER   SEQUENCE dept_deptno_seq
MAXVALUE 1000;
```

### 인덱스

- B 트리 형식 혹은 비트맵 인덱스로 구성
    - B: Balanced
- 장점
    - 검색 속도 빨라짐
    - 전체 성능 향상
- 단점
    - 인덱스를 위한 추가적인 공간 필요
    - 인덱스를 생성하는 데 시간 필요
    - DML 작업이 자주 일어날 경우 성능 저하

### 인덱스 정보 조회

```sql
SELECT  index_name, table_name, column_name
FROM    user_ind_columns
WHERE   table_name IN ('EMP', 'DEPT');
```

### 인덱스를 사용해야 하는 경우

- 테이블의 행의 수가 많을 때
- WHERE 문에 해당 컬럼이 많이 사용될 때
- 검색 결과가 전체 데이터의 2~4%일 때
- JOIN에 자주 사용되는 컬럼이나 NULL을 포함하는 컬럼이 많은 경우

### 인덱스를 사용하지 말아야 하는 경우

- 테이블에 행의 수가 적을 때
- WHERE 문에 해당 컬럼이 자주 사용되지 않을 때
- 검색 결과가 전체 데이터의 10~15% 이상일 때
- 테이블에 DML 작업이 많은 경우

### 인덱스 재생성

```sql
ALTER INDEX idx_emp01_deptno REBUILD;
```

### 인덱스 동작 방식

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/2fd49f92-cf11-44a9-82cf-1ad958ba4ae0)

### 인덱스의 종류

- 고유 인덱스
    - 특정 칼럼 값이 유니크
- 비고유 인덱스
- 단일 인덱스
- 결합 인덱스
    - 두 개 이상의 칼럼으로 인덱스 설정
- 함수 기반 인덱스
    - 산술 표현을 인덱스로 지정