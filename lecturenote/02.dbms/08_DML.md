## Chapter 08 테이블의 내용을 추가, 수정, 삭제하는 DML과 트랜잭션

### 데이터 내용 추가 INSERT

- 컬럼명을 명시적으로 써주는 게 좋음
- ‘’이 들어가도 NULL로 바꾸는 쿼리 내부 처리가 있을 수 있음

```sql
INSERT  INTO emp02
VALUES (1001, '김사랑', '사원', '2015/03/01', 20);
```

### 데이터 내용 수정 UPDATE

```sql
UPDATE  dept01
SET     dname = '생산부'
WHERE   deptno = 10;
```

### 데이터 내용 삭제 DELETE

```sql
DELETE  dept01
WHERE   deptno=20;
```

### 트랜잭션 관리

- COMMIT
    - 트랜잭션을 완료하는 명령어
    - 작업을 성공적으로 처리
- ROLLBACK
    - 특정 세이브포인트로 ROLLBACK할 수도 있음
    - 과거로 이동만 가능함
    - 만약 세이브포인트가 여러 개일 때 특정 세이브포인트로 롤백했다면, 그 세이브포인트 이후에 저장된 세이브포인트로는 이동할 수 없음

### 데드락(Deadlock)

- 데드락 발생 시 먼저 웨이팅에 들어갔던 쪽을 3초 후에 풀어줌
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/06fef189-f25a-4084-bfef-378b01533b42)
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/33c51e02-fb8b-477e-bd87-b32f447e597b)
    
- 이 때 종료된 세션에서 트랜잭션 완료시켜주면 다른 세션에서도 업데이트가 가능