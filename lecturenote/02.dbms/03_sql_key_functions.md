## Chapter 03 오라클 주요 함수

### DUAL 테이블

- 산술 연산 결과를 한 줄로 얻기 위해 오라클이 제공하는 테이블

### 숫자 함수

- ABS
- FLOOR
    - 소수점 아래를 버림
- ROUND
    - 특정 자릿수에서 반올림
    - ROUND(대상, 자릿수)
- TRUNC
    - 특정 자릿수에서 잘라냄
- MOD
    - 나머지 구함

### 문자 처리 함수

- 대소문자 변환 함수
    - UPPER, LOWER, INITCAP
- 문자 길이를 구하는 함수
    - LENGTH
        - 문자 길이 반환
    - LENGTHB
        - 바이트수 반환
        - 한글 3Byte
- 문자 조작 함수
    - CONCAT
    - SUBSTR
    - SUBSTRB
    - INSTR
        - 특정 문자의 위치값을 반환
        - INSTR(대상, 찾을 글자)
        - INSTR(대상, 찾을 글자, 시작 위치, 몇 번째 발견)
    - INSTRB
    - LPAD
        - left padding
    - RPAD
        - right padding

### 형변환 함수

- TO_CHAR
    - 날짜형을 문자형으로
    - 숫자형을 문자형으로
        - `0` 자릿수를 나타내며 자릿수가 맞지 않을 경우 0으로 채운다.
        - `9` 자릿수를 나타내며 자릿수가 맞지 않아도 채우지 않는다.
        - `L` 각 지역별 통화 기호를 앞에 표시한다
        - `.` 소수점
        - `,` 천 단위 자리 구분
- TO_DATE
- TO_NUMBER

### 날짜 함수

- SYSDATE
- MONTHS_BETWEEN
- ADD_MONTHS
- NEXT_DAY
    - 해당 요일에 최초로 도래하 날짜를 반환
- LAST_DAY
- ROUND
- TRUNC

### NVL 함수

- NVL
    - NULL을 실제값으로 변환
- NVL2
    - `NVL2(exp1, exp2, exp3)`
    - NULL이 아니면 exp2, NULL이면 exp3
- NULLIF
    - `NULLIF(exp1, exp2)`
    - exp1과 exp2 동일하면 NULL을 반환, 동일하지 않으면 exp2 반환
- COALESCE
    - `COALESCE(exp1, exp2, …, expn)`
    - NULL이 아닌 첫 번째 인수

### DECODE 함수

```sql
SELECT  ename, deptno, DECODE(deptno, 10, '경리부',
                                    20, '인사과',
                                    30, '영업부',
                                    40, '전산부') AS DNAME
FROM    emp;
```

```sql
-- 체육대회를 합니다. 사번으로 홀수는 청군 짝수는 백군으로 출력

SELECT  ename, empno, DECODE (MOD(empno, 2), 1, '청군',
                                            0, '백군') AS team
FROM    emp;
```

### CASE 함수

- searched case

```sql
SELECT  ename, sal, CASE CEIL((sal) / 300) -1 WHEN 0 THEN 'LOW'
                                            WHEN 1 THEN 'MID'
                                            WHEN 2 THEN 'HIGH'
                                            ELSE 'TOP'
                                            END AS 등급
FROM    emp;
```

- simpled case

```sql
SELECT  ename, sal, CASE WHEN sal <= 300 THEN 'LOW'
                        WHEN sal <= 600 THEN 'MID'
                        WHEN sal <= 900 THEN 'HIGH'
                        ELSE 'TOP'
                        END AS 등급
FROM    emp;
```