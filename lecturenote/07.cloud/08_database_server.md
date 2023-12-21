## Chapter 8. 데이터베이스 서버 준비하기

### RDS

- EC2로 생성한 서버에 제품 설치할 때의 문제점 해결
    - 데이터베이스 제품을 설치할 필요 없음
    - EC2의 OS 자체를 관리할 필요 없음
    - 예측하지 못한 장애 발생에 대응할 필요 없음
- 매니지드 서비스 제공
    - 서버나 OS를 의식하지 않고 필요한 서비스를 구축할 수 있도록 함

### RDS 시스템 요소

- 데이터베이스 엔진
    - 데이터베이스 본체
    - 내부적으로 여러 인스턴스로 구성
- 파라미터 그룹
    - 데이터베이스 엔진 고유의 설정 수행
    - 사용하는 언어나 데이터베이스 튜닝을 설정
- 옵션 그룹
    - RDS 고유의 설정 수행
    - AWS를 이용한 데이터베이스 모니터링에 관한 설정 수행
- 서브넷 그룹
    - 데이터베이스 서버를 여러 개의 가용 영역에 분산 배치할 때 이용되는 설정
    - 신뢰성이나 성능을 높임

### 파라미터 그룹 생성

- 데이터베이스 성능 개선, 사용 현황 파악, 기능 추가
- **sample-db-pg**
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/5211c72a-ec54-46a1-be09-d34b59e674dd)
    

### 옵션 그룹 생성

- **sample-db-og**
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/f573aa90-27de-4932-9757-1ff112299ce4)
    

### 서브넷 그룹 생성

- 서브넷을 2개 이상 포함한 그룹
- **sample-db-subnet**
    - 프라이빗 서브넷 두 개 추가
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/9f5748a9-3f83-423f-b16c-0d5e476beb78)
        

### 데이터베이스 생성

- **sample-db**
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/3dcc7307-f121-4a89-bb02-29212fbd35ca)
    
- 마스터 사용자 이름 및 암호 설정
- 인스턴스 구성
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/febe63fc-a219-40db-833f-18be0a6bba3d)
    
- VPC, DB 서브넷 그룹 생성한 것으로 설정
- 보안그룹 설정
    - default
- 추가 구성
    - DB 파라미터 그룹: sample-db-pg
    - 옵션 그룹: sample-db-og

### 작동 확인하기

- web01에 접속해 MySQL 설치하기
    - `ssh web01`
    - `sudo yum -y install mysql`
- 데이터베이스 서버로 연결
    - `mysqladmin ping -u admin -p -h (데이터베이스 엔드포인트)`
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/710c8fc2-53ab-46c2-ac6e-1b39f7b12cea)
