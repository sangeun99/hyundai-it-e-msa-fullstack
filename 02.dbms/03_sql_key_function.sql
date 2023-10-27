-- Chapter 03

-- CONN tester1

SELECT  24 * 60
FROM    dual;

-- 숫자 함수

SELECT  -10, ABS(-10)
FROM    dual;

SELECT  14.5678, FLOOR(14.56778)
FROM    dual;

SELECT  3.1415, ROUND(3.1415, 2)
FROM    dual;

SELECT  35.1415, ROUND(35.1415, -1)
FROM    dual;

SELECT  3.1415, TRUNC(3.1415, 2)
FROM    dual;

SELECT  MOD(27, 2), MOD(27, 5), MOD(27, 7)
FROM    dual;

-- 문자 처리 함수

SELECT  'Welcome to Oracle',
        UPPER('Welcome to Oracle'),
        LOWER('Welcome to Oracle'),
        INITCAP('Welcome to Oracle')
FROM    dual;

SELECT  LENGTH('Oracle'), LENGTH('오라클')
FROM    dual;

SELECT  LENGTHB('Oracle'), LENGTHB('오라클')
FROM    dual;

SELECT  SUBSTR('Welcome to Oracle', 4, 3)
FROM    dual;

SELECT  SUBSTRB('웰컴투오라클', 4, 3)
FROM    dual;

SELECT  INSTR('Welcome to Oracle', 'o')
FROM    dual;

SELECT  INSTRB('웰컴투오라클', '오', 3, 1)
FROM    dual;

SELECT  INSTRB('데이터베이스', '이', 14, 1)
FROM    dual;

SELECT  LPAD('Oracle', 20, '#')
FROM    dual;

SELECT  RPAD('Oracle', 20, '#')
FROM    dual;

-- 형변환 함수

SELECT  SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM    dual;

SELECT  SYSDATE, TO_CHAR(SYSDATE, 'YYYY/MM/DD DAY')
FROM    dual;

SELECT  TO_CHAR(SYSDATE, 'YYYY/MM/DD, AM HH:MI:SS')
FROM    dual;

SELECT  TO_CHAR(1230000, 'L999,999,999')
FROM    dual;

-- 날짜 함수

SELECT  ename, TO_CHAR(hiredate, 'YYYY/MM/DD') 입사일,
        TO_CHAR(ADD_MONTHS(hiredate, 6), 'YYYY/MM/DD') "6개월 후"
FROM    emp;

SELECT  TO_CHAR(SYSDATE, 'YYYY/MM/DD') 오늘,
        TO_CHAR(NEXT_DAY(SYSDATE, '수요일'), 'YYYY/MM/DD') 수요일
FROM    emp;        

-- NVL 함수

SELECT  ename, sal, comm,
        NVL2(comm, sal*12+comm, sal*12)
FROM    emp
ORDER BY deptno;

SELECT  NULLIF('A', 'A'), NULLIF('A', 'B')
FROM    dual;

SELECT  ename, sal, comm,
        COALESCE(comm, sal, 0)
FROM    emp
ORDER BY deptno;

-- DECODE

SELECT  ename, deptno, DECODE(deptno, 10, '경리부',
                                    20, '인사과',
                                    30, '영업부',
                                    40, '전산부') AS DNAME
FROM    emp;

-- 체육대회를 합니다. 사번으로 홀수는 청군 짝수는 백군으로 출력

SELECT  ename, empno, DECODE (MOD(empno, 2), 1, '청군',
                                            0, '백군') AS team
FROM    emp;

-- 부서에 따른 연봉의 차등 인상
-- 10번 부서 20% 인상
-- 20번 부서 10% 인상
-- 나머지 부서 동결

SELECT  ename, sal*12+NVL(comm, 0)*sal AS 올해연봉, DECODE (deptno, 10, 1.2,
                            20, 1.1,
                            1) * (sal*12+NVL(comm, 0)*sal) AS 내년연봉
FROM    emp;


-- 연봉 등급 구분

SELECT  ename, sal, DECODE (CEIL((sal) / 300) -1, 0, 'LOW',
                                                1, 'MID',
                                                2, 'HIGH',
                                                'TOP')
FROM    emp;

-- CASE문
-- searched case
SELECT  ename, empno, CASE MOD(empno, 2) WHEN 1 THEN '청군'
                                        WHEN 0 THEN '백군'
                                        END AS team
FROM    emp;

-- simpled case
SELECT  ename, empno, CASE WHEN MOD(empno, 2) = 1 THEN '청군'
                           WHEN MOD(empno, 2) = 0 THEN '백군'
                                        END AS team
FROM    emp;

SELECT  ename, sal, CASE CEIL((sal) / 300) -1 WHEN 0 THEN 'LOW'
                                            WHEN 1 THEN 'MID'
                                            WHEN 2 THEN 'HIGH'
                                            ELSE 'TOP'
                                            END AS 등급
FROM    emp;

SELECT  ename, sal, CASE WHEN sal <= 300 THEN 'LOW'
                        WHEN sal <= 600 THEN 'MID'
                        WHEN sal <= 900 THEN 'HIGH'
                        ELSE 'TOP'
                        END AS 등급
FROM    emp;
