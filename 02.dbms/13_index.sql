-- Chapter 13. 인덱스

-- 인덱스 조회하기

SELECT  index_name, table_name, column_name
FROM    user_ind_columns
WHERE   table_name IN ('EMP', 'DEPT');

-- 조회 속도 비교하기

CREATE  TABLE   emp01
AS
SELECT  * FROM emp;

-- emp01에는 인덱스가 존재하지 않음을 확인

SELECT  index_name, table_name, column_name
FROM    user_ind_columns
WHERE   table_name IN ('EMP', 'EMP01');

INSERT  INTO emp01
SELECT  * FROM emp01;

INSERT  INTO emp01 (empno, ename)
VALUES  (1111, 'dsdf');

SET TIMING ON;

-- 인덱스 x 2.162초 / 인덱스 o 0.868초

SELECT  DISTINCT empno, ename
FROM    emp01
WHERE   ename='dsdf';

CREATE  INDEX idx_emp01_ename
ON      emp01(ename);

SELECT  table_name, index_name, column_name
FROM    user_ind_columns
WHERE   table_name  IN ('EMP01');

DROP    INDEX idx_emp01_ename;

-- 고유 인덱스

DROP    TABLE dept01;

CREATE  TABLE dept01
AS
SELECT  *
FROM    dept
WHERE   1=0;

CREATE  UNIQUE INDEX dept01
ON      emp01(ename);

INSERT  INTO dept01
VALUES(10, '인사과', '대전');
INSERT  INTO dept01
VALUES(20, '총무과', '서울');
INSERT  INTO dept01
VALUES(30, '교육팀', '대전');

SELECT  *
FROM    dept01;

CREATE  UNIQUE INDEX idx_dept01_deptno
ON      DEPT01(deptno);

-- 에러: 이미 중복된 값을 가지고 있음
CREATE  UNIQUE INDEX idx_dept01_loc
ON      DEPT01(loc);

-- 비고유 인덱스

CREATE  INDEX idx_dept01_loc
ON      DEPT01(loc);

-- 결합 인덱스

CREATE  INDEX idx_dept01_com
ON      DEPT01(deptno, dname);

SELECT  index_name, column_name
FROM    user_ind_columns
WHERE   table_name  IN ('DEPT01');

-- 함수 기반 인덱스

CREATE  INDEX idx_dept01_annsal
ON      emp01(sal*12);

SELECT  index_name, column_name
FROM    user_ind_columns
WHERE   table_name  IN ('EMP01');