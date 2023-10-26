## Chapter 02 SQL의 기본

### NULL의 연산

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
- NULL은 연산할 수 없음
    - NULL에게 값을 주는 함수: NVL

### 대표적인 절

- SELECT
- FROM
- WHERE
- GROUP BY
- HAVING
- ORDER BY
---
- 내가 가진 테이블 정보를 볼 수 있음

```sql
DESCRIBE TAB;
SELECT * FROM TAB;
```

- concatenate을 이용하여 쿼리문을 만드는 select문
```sql
SELECT 'SELECT * FROM ' || TNAME || ';';
```