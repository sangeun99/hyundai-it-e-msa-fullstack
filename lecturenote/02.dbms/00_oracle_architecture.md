## Oracle Architecture

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/6a574f12-bead-48a3-834a-09f9ce59fbac)

### 오라클이란?

- 오라클 인스턴스와 오라클 데이터베이스의 합

### 오라클 startup 절차

- `shutdown immediate` 시 데이터베이스 닫힘
- `startup`
    - 1) NOMOUNT
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/80eaa328-fc44-4112-a790-7740a1625b42)
        
        - 파라미터 파일을 읽음
            - 파라미터 파일
                - Shared Global Area 구성하기 위한 설정 정보값이 들어있음
        - 이 내용으로 SGA 구성, BACKGROUND PROCESS 생성
            - SGA
                - 리두 로그 버퍼
                    - 실행한 명령어의 로그
            - 프로세스
    - 2) MOUNT
        - CONTROL FILE을 읽음
            - DATAFILE과 REDO LOG FILE의 위치를 알고 있음
            - DATAFILE
                - DATA DICTIONARY와 USER 정보 등
            - REDO LOG FILE
                - 했던 일을 로그로 남김
                - 계속 덮어쓰면서 작동
                - 다 쓰면 아카이브 파일로 남기도록 설정할 수도 있음 (DBA의 일)
            - UNDO
                - UPDATE시 기존의 영역을 UNDO에 복사
        - DATAFILE와 REDO LOG를 확인해 실행했는데 반영되지 않은 내용이 있는지 확인
            - OPEN을 먼저 한 후 남은 명령어들을 실행하도록 함
    - 3) OPEN
        - DATAFILE OPEN
        - DATABASE READ, WRITE 가능

### 메모리 구조

- SGA
    - 시스템 글로벌 영역
    - 인스턴스가 시작될 때 할당
    - 오라클 인스턴스의 기본적인 구성 요소
    - 메모리 구조
        - 공유풀
        - 데이터베이스 버퍼 캐시
        - 리두 로그 버퍼
        - 기타 구조
        - (+) 대용량 풀
        - (+) Java 풀
    - 동적
        - SGA_MAX_SIZE 매개변수로 크기를 조정함
- PGA
    - 프로그램 글로벌 영역
    - 사용자마다 가지고있는 개별적인 영역
    - 서버 프로세스가 시작될 때 할당

### Oracle 인스턴스에 연결

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/ff68c771-b336-422c-89e0-52268686e141)

### SELECT 문 수행 순서

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/24e3d2e2-c204-46f0-88f5-1d6d320ccc84)

- 1) PARSE
    - 동일한 문장이 존재하는지 체크
        - 존재하면 기존 공간을 사용
        - 존재하지 않으면 새롭게 공간을 확보
        - → 동일한 문장이 존재하는지 체크하기에 자주 사용되는 쿼리문은 변수처리해서 빠르게 실행되도록 하는 것이 중함
    - 문법 검사, 스키마 검사, 권한 검사
    - 실행 계획 생성 (OPTIMIZER)
- 2) BIND
    - bind variable을 사용하는 경우
- 3) EXECUTE
    - 데이터베이스 버퍼 캐쉬에 존재하는지 확인
        - 존재하면 그냥 사용
        - 존재하지 않으면 데이터파일로부터 메모리로 로드함
    - 서버 프로세스에 의한 데이터 처리
    - 사용자 프로세스로 가져옴
- 4) FETCH

### DML문(UPDATE문) 수행 순서

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/ea343d46-9446-4de7-9841-f58416f284f5)

- 1) PARSE
    - SELECT문과 동일
- 2) BIND
    - bind variable을 사용하는 경우
- 3) EXECUTE
    - 데이터 로드는 SELECT문과 동일
    - 기존 데이터를 데이터파일에서 찾음
    - 기존 데이터를 데이터베이스 버퍼 캐쉬에 UNDO(ROLLBACK) SEGMENT BLOCK을 점유
    - 해당 ROW에 LOCK을 걸면서 데이터 변경
    - REDO LOG BUFFER에 REDO ENTRY(이전, 이후 이미지, ROW의 위치)를 기록
    - REDO LOG에 로그도 쌓임

### **COMMIT 처리 순서**

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/2469e0d7-2c42-4fb2-bbde-e4635fbd1307)

- REDO LOG BUFFER에 있는 REDO ENTRY들이 LGWR에 의해서 REDO LOG FILE에 쓰여짐
- LOCK 해제
- 데이터 파일도 DBWR가 리두 로그 버퍼에서 받아서 변경하도록 함