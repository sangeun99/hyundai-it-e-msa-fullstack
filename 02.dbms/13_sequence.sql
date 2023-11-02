-- Chapter 13 시퀀스

-- 시퀀스 생성하기

CREATE  SEQUENCE dept_deptno_seq
        START WITH 10
        INCREMENT BY 10;

-- 시퀀스 정보 살피기

DESC    user_sequences;

SELECT  sequence_name, min_value, max_value, increment_by, cycle_flag
FROM    user_sequences;

-- CURRVAL, NEXTVAL 사용하기

SELECT  dept_deptno_seq.NEXTVAL
FROM    dual;

SELECT  dept_deptno_seq.CURRVAL
FROM    dual;

SELECT  dept_deptno_seq.NEXTVAL
FROM    dual;

-- NEXTVAL을 생성하지 않고 CURRVAL 이용하기

CREATE  SEQUENCE sample_seq;

SELECT  sample_seq.CURRVAL
FROM    dual; -- 에러

SELECT  sample_seq.NEXTVAL
FROM    dual;

-- 시퀀스를 이용해 기본키 자동생성하기

CREATE  SEQUENCE emp_seq
        START WITH 1
        INCREMENT BY 1
        MAXVALUE 10000;

DROP    TABLE emp01;        
CREATE  TABLE emp01 (
        empno NUMBER(4) PRIMARY KEY,
        ename VARCHAR(10),
        hiredate DATE);

SELECT  constraint_name, constraint_type, table_name
FROM    user_constraints
WHERE   table_name IN ('EMP01');

SELECT  constraint_name, column_name, table_name
FROM    user_cons_columns
WHERE   table_name IN ('EMP01');

INSERT  INTO emp01
VALUES  (emp_seq.NEXTVAL, '홍길동', sysdate);

INSERT  INTO emp01
VALUES  (emp_seq.NEXTVAL, '강감찬', sysdate);

SELECT  *
FROM    emp01;

-- 시퀀스 제거하기

SELECT  sequence_name, min_value, max_value,
        increment_by, cycle_flag
FROM    user_sequences;

DROP    SEQUENCE dept_deptno_seq;

-- 시퀀스 수정하기

CREATE  SEQUENCE dept_deptno_seq
        START WITH 10
        INCREMENT BY 10
        MAXVALUE 30;
        
SELECT  dept_deptno_seq.NEXTVAL
FROM    dual; -- 여러번 생성 시 MAXVALUE를 넘어 오류 (NOCYCLE이 기본 설정)

ALTER   SEQUENCE dept_deptno_seq
MAXVALUE 1000;

