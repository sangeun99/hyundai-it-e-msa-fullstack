-- p.423-428

-- 1. 2

-- 2. 3

-- 3. 3

-- 4. 4

-- 5. 1

-- 6. 4

-- 7.

INSERT  INTO    emp06
SELECT  *   FROM    emp;

-- 8. 

SELECT  ename, sal
FROM    emp06
WHERE   sal > ( SELECT  min(sal)
                FROM    emp06
                WHERE   job='과장')
        AND job != '과장';
        
-- 9.

UPDATE  emp06
SET     sal = sal + 100
WHERE   deptno in ( SELECT  deptno
                    FROM    dept
                    WHERE   loc = '인천' );
SELECT  *   FROM    emp06;

-- 10.

DELETE  emp06
WHERE   deptno = (  SELECT  deptno
                    FROM    dept
                    WHERE   dname = '경리부' );
                    
-- 11.

SELECT  ename, deptno
FROM    emp
WHERE   deptno = (  SELECT  deptno
                    FROM    emp
                    WHERE   ename = '이문세' )
        AND     ename != '이문세';
        
-- 12.

SELECT  ename, deptno
FROM    emp
WHERE   job = ( SELECT  job
                FROM    emp
                WHERE   ename = '이문세' )
        AND     ename != '이문세';

-- 13.

SELECT  ename, sal
FROM    emp
WHERE   sal >= (    SELECT  sal
                    FROM    emp
                    WHERE   ename = '이문세' )
        AND     ename != '이문세';

-- 14.

SELECT  ename, deptno
FROM    emp
WHERE   deptno IN ( SELECT  deptno
                    FROM    dept
                    WHERE   loc = '인천' );

-- 15.

SELECT  ename, sal, mgr
FROM    emp
WHERE   mgr IN ( SELECT  empno
                FROM    emp
                WHERE   ename = '감우성' );

-- 16.

SELECT  empno, ename, sal, deptno
FROM    emp e
WHERE   sal = ( SELECT  max(sal)
                FROM    emp e2
                WHERE   e.deptno = e2.deptno
                GROUP   BY deptno );
-- 16(2)

SELECT  empno, ename, sal, deptno
FROM    emp
WHERE   (deptno, sal) IN (  SELECT  deptno, max(sal)
                            FROM    emp
                            GROUP   BY deptno );
-- 17.

SELECT  deptno, dname, loc
FROM    dept d
WHERE   deptno IN ( SELECT  deptno
                    FROM    emp
                    WHERE   job = '과장') ;

-- 18. 

SELECT  ename, sal, job
FROM    emp
WHERE   sal > ALL ( SELECT  sal
                    FROM    emp
                    WHERE   job = '과장' );
