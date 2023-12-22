## Chapter 12. 캐시 서버 준비하기

### 캐시 시스템

- 처리에 시간이 걸리는 결과 데이터를 저장하도 다음에 같은 처리를 수행할 때 결과를 빠르게 반환하는 시스템
- 캐시 사용 시 주의점
    - 시간이 걸리는 처리 결과 데이터가 캐시 데이터와 어긋날 가능성
        - 현재의 날씨 정보를 반환하는 경우
    - 서버에 캐시 데이터 저장 영역 필요
        - 지나치게 많은 데이터를 저장하면 처리가 지연될 가능성이 있음
        - 보통 유효 기간을 설정

### 레디스와 멤캐시드

- 오픈 소스로 제공되는 캐시 구현

### 일래스틱캐시

- 레디스와 멤캐시드가 미들웨어로 제공
- 임의의 키에 대해 캐시된 데이터를 반환하는 키/값 시스템
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/2452f667-433e-4814-a1c4-7a71138c3520)
    
- 일래스틱 캐시의 요소
    - 노드
        - 일래스틱캐시의 최소 단위
        - 캐시된 데이터가 실제로 저장되는 영역을 확보
        - 노드별로 캐시 엔진(레디스/멤케시드), 시스템, 용량 등을 설정
    - 샤드
        - 1~6개의 노드로 구성
            - 노드는 하나의 프라이머리 노드, 여러 복제 노드로 구성
                - 프라이머리 노드
                    - 데이터 갱신과 참조를 수행
                - 복제 노드
                    - 프라이머리 노드에 수행한 업데이트 내용이 복제되어 동일한 상태가 유지
                    - 데이터 참조
                        - 프라이머리 노드와 마찬가지로 수행
                        - 노드 숫자만큼 성능 향상
                    - 데이터 갱신
                        - 복제 노드에 복사되는 시간이 걸림
    - 클러스터
        - 여러 샤드로 구성
        - 멀티 AZ 기능을 이용하면 여러 가용 영역으로 분산 가능

### 일래스틱캐시 생성하기

- **sample-elasticache**
- 클러스터 정
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/21a06eba-b977-4b58-96bb-dfff81f3b205)
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/07d0dd8c-36bd-4093-abc0-c366ddc1a815)
    
- 서브넷 그룹 생성
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/5f502c50-4188-4d37-b18e-875c8bee2c9f)
    
- 생성 시 시간 소요

### 작동 확인하기

- `ssh web01` 로 접속
- `sudo yum -y install nc` nc 명령어 설치
    - netcat
- 클러스터 연결 테스트
    - nc 명령어를 이용해 일래스틱캐시로부터 반응이 돌아오는지 확인
    - `nc (도메인) (포트번호)`
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/d5d563f1-8cb3-4dc9-b6e9-db20636e6043)
