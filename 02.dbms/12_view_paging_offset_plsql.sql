create table board (
no        number,      
title     varchar2(34) not null,
re        number(3) default 0,
regdate   date  default sysdate);

alter table board add constraint pk_board
primary key(no);

create sequence seq_board
start with 1 increment by 1 nocache;

begin
  for i in 1..1000000 loop
    insert into board
    values(seq_board.nextval,
       'With A Little Help From My Friends',
       trunc(dbms_random.value(0,100)),
       sysdate-((1000000-i)/24/6));
    end loop;
  end;
/

commit;

set autot on
set timing on
col content noprint

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

SELECT no, title, re,
       case to_char(regdate,'YYYY-MM-DD')
       when to_char(sysdate,'YYYY-MM-DD')
       then to_char(regdate,'HH24:MI:SS')
       else to_char(regdate,'YYYY-MM-DD')
       end as regdate
from   board
order  by no desc
OFFSET 100 ROWS FETCH FIRST 10 ROWS ONLY;