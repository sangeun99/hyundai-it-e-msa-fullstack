-- Inline View와 Decode를 이용해 부서별, 업무별 급여의 합을 보여주는 레코드도 함께 출력하기

-- CONN tester1

SELECT * FROM emp;

CREATE  TABLE myno (
    no  NUMBER
);

BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO myno VALUES(I);
    END LOOP;
END;
/

COMMIT;

SELECT  DECODE(no, 1, deptno, 2, deptno)
        , DECODE(no, 1, job)
        , sum(sum_sal)
FROM    (SELECT  deptno, job, SUM(sal) as sum_sal
        FROM    emp
        GROUP   BY deptno, job
        ORDER   BY 1, 2)
        CROSS JOIN (SELECT no FROM myno WHERE no <= 3 ORDER BY no)
GROUP   BY   DECODE(no, 1, deptno, 2, deptno)
        , DECODE(no, 1, job)
ORDER   BY 1, 2;

-- CONN ace

CREATE  TABLE myno (
    no  NUMBER
);

INSERT  INTO myno VALUES (1);
INSERT  INTO myno VALUES (2);
INSERT  INTO myno VALUES (3);
COMMIT;

SELECT  DECODE(no, 1, department_id, 2, department_id)
        , DECODE(no, 1, job_id)
        , SUM(sum_sal)
FROM    (SELECT  department_id, job_id, SUM(salary) as sum_sal
        FROM    employees
        GROUP   BY department_id, job_id)
        CROSS JOIN (SELECT no FROM myno)
GROUP   BY DECODE(no, 1, department_id, 2, department_id)
        , DECODE(no, 1, job_id)
ORDER   BY 1, 2;
