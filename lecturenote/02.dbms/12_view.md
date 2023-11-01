## Chapter 12 가상 테이블 뷰

- 쿼리를 저장하고 있는 오브젝트

### 뷰 만들기

```sql
CREATE  VIEW    testview
AS
SELECT  ename, sal
FROM    emp;
```

### 뷰를 사용하는 이유

- 복잡하고 긴 쿼리문을 뷰로 정의하면 접근을 단순화
- 보안에 유리

### 구체화 뷰 (Materialized View)

- 미리 계산된 테이블

### 뷰 삭제하기

- DROP VIEW [뷰 이름]

### 뷰 변경하기

- CREATE OR REPLACE VIEW
- 주로 배치 작업으로 둘 때 용이한 명령어
- 옵션
    - FORCE
        - 기본 테이블이 없어도 뷰를 생성
    - NOFORCE
        - 기본 테이블이 있어야만 뷰가 생성
    - WITH CHECK OPTION
        - 조건 컬럼 값은 변경하지 못 하게 함
    - WITH READ ONLY
        - 뷰를 통해 기본 테이블의 변경을 막음

### 인라인 뷰로 TOP-N

```sql
select B.*
from   (select rownum as rnum, A.*
       from   (select no, title, re,
                       case to_char(regdate,'YYYY-MM-DD')
                       when to_char(sysdate,'YYYY-MM-DD')
                       then to_char(regdate,'HH24:MI:SS')
                       else to_char(regdate,'YYYY-MM-DD')
                       end as regdate
               from   board
               order  by no desc) A) B
where   rnum between (&thisPage-1)*&pageSize+1
and     &thisPage*&pageSize;
```

```sql
SELECT no, title, re,
       case to_char(regdate,'YYYY-MM-DD')
       when to_char(sysdate,'YYYY-MM-DD')
       then to_char(regdate,'HH24:MI:SS')
       else to_char(regdate,'YYYY-MM-DD')
       end as regdate
from   board
order  by no desc
OFFSET 100 ROWS FETCH FIRST 10 ROWS ONLY;
```

### 계획 설명에서 인덱스 사용여부 확인하기

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/ad92ec68-23d7-451f-8c01-a88632471e17)
