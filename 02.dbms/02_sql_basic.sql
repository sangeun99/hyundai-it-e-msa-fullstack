-- employees���� �̸�(last_name), �޿�(salary), ����(salary*12+salary*commision+pct) ���

SELECT last_name AS �̸�, salary AS �޿�, salary*12+salary*nvl(commission_pct,0) AS ����
FROM employees;

--conn tester1/1234@localhost:1521/xepdb1

-- SELECT�� �����ϱ�

SELECT  *
FROM    dept;

SELECT  empno
        ,ename
FROM    emp;

-- ��Ī ����ϱ�

SELECT  ename, sal*12+sal*nvl(comm,0) AS annsal FROM emp;
SELECT  ename, sal*12+sal*nvl(comm,0) AS "annsal" FROM emp;
SELECT  ename, sal*12+sal*nvl(comm,0) annsal FROM emp;
SELECT  ename, sal*12+sal*nvl(comm,0) "annsal" FROM emp;

-- concatenation ������

SELECT ename || '�� ������ ' || JOB || '�Դϴ�. ' AS ����
FROM emp;

-- distinct

SELECT DISTINCT deptno
FROM emp;

-- Ư�� ������ �����͸� ��ȸ

SELECT *
FROM emp
WHERE hiredate < TO_DATE('2005/01/01', 'YYYY/MM/DD');

-- ���� �ð�

SELECT sysdate
FROM dual;

-- AND OR NOT

SELECT ename, deptno, JOB
FROM emp
WHERE deptno=10 AND JOB='����';

SELECT ename, deptno, JOB
FROM emp
WHERE deptno=10 OR JOB='����';

SELECT *
FROM emp
WHERE deptno <> 10;

-- CONN ACE

SELECT *
FROM employees
WHERE department_id IS NULL;

-- CONN TESTER1
-- BETWEEN

SELECT *
FROM emp
WHERE 400 <= sal AND sal <= 500;

SELECT *
FROM emp
WHERE sal BETWEEN 400 AND 500;

SELECT *
FROM emp
WHERE sal < 400 OR sal > 500;

SELECT *
FROM emp
WHERE NOT sal BETWEEN 400 AND 500;


-- �ʵ忡 ������ �Ŵ� ������ �����ؾ� �� -> ���� ����

SELECT  *
FROM    emp
WHERE   hiredate    BETWEEN TO_DATE('2003/01/01', 'YYYY/MM/DD')
                    AND     TO_DATE('2003/12/31', 'YYYY/MM/DD');
                    
SELECT  *
FROM    emp
WHERE   to_char(hiredate, 'YYYY')=2003;

-- IN

SELECT  *
FROM    emp
WHERE   comm IN(80, 100, 200);

SELECT  *
FROM    emp
WHERE   comm NOT IN(80, 100, 200);