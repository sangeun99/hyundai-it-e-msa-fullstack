-- paging

CREATE  TABLE   board (
        no      NUMBER(5),
        title   VARCHAR2(34) NOT NULL,
        re      NUMBER(3) DEFAULT 0,
        regdate DATE DEFAULT sysdate);

-- NEXTVAL 이용을 위한 시퀀스 생성
        
CREATE  SEQUENCE    seq_board
START WITH 1 INCREMENT BY 1 NOCACHE;

-- 프로시저를 이용해 대량 데이터 생산

BEGIN
    FOR i IN 1..10002 LOOP
        INSERT  INTO board
        VALUES(seq_board.NEXTVAL,
            'With A Little Help From My Friends',
            TRUNC(dbms_random.value(0, 100)),
            sysdate-((10002-i)/24/6));
    END LOOP;
END;
/

SELECT  no, title, re, TO_CHAR(regdate, 'YYYY-MM-DD hh24:mi:ss') as regdate
FROM    board
WHERE   regdate > sysdate - 1/24
ORDER   BY no DESC;

SELECT  COUNT(*)
FROM    board;

define thisPage = 1
define pageSize = 5

SELECT  ROWNUM, no, title, re, TO_CHAR(regdate, 'YYYY-MM-DD hh24:mi:ss') as regdate
FROM    board
WHERE   ROWNUM BETWEEN (&thisPage-1)*&pageSize+1 AND &thisPage*&pageSize
ORDER   BY no DESC;

-- 2페이지는 제대로 안 나옴
define thisPage = 2

SELECT  ROWNUM, no, title, re, TO_CHAR(regdate, 'YYYY-MM-DD hh24:mi:ss') as regdate
FROM    board
WHERE   ROWNUM BETWEEN (&thisPage-1)*&pageSize+1 AND &thisPage*&pageSize
ORDER   BY no DESC;

define pageSize = 5
define thisPage = 2
SELECT  B.*
FROM    (SELECT ROWNUM AS rnum, A.*
        FROM    (SELECT no, title, re, TO_CHAR(regdate, 'YYYY-MM-DD hh24:mi:ss') as regdate
        FROM    board
        ORDER   BY no DESC) A)B
WHERE   rnum BETWEEN (&thisPage-1)*&pageSize+1 AND &thisPage*&pageSize;