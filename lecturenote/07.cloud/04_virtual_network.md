## Chapter 4. 가상 네트워크 만들기

### 네트워크

- 인트라스트럭처 관리자가 주체가 되어 관리하는 장소
- 192.168.100.56
    - 192.168.100.56/24
        - 2개의 IP는 사용 불가능
            - 192.168.100.0 → 네트워크 주소
            - 192.168.100.255 → 브로드캐스트 주소
                - 모든 호스트에게 정보가 감
    - 192.168.100.56/16
        - 2개의 IP는 사용 불가능
            - 192.168.0.0 → 네트워크 주소
            - 192.168.255.255 → 브로드캐스트 주소

### VPC

- Amazon Virtual Private Cloud
- AWS를 이용해 네트워크를 구축할 때 이용

### VPC 생성

- VPC 설정 항목
    - 이름 태그
        - VPC를 식별하기 위한 이름
        - **sample-vpc**
    - IPv4 CIDR 블록
        - VPC에서 사용하는 프라이빗 네트워크용 IPv4 주소의 범위
            - 24비트 블록
                - 10.0.0.0~10.255.255.255
            - 20비트 블록
                - 172.16.0.0~172.31.255.255
            - 16비트 블록
                - 192.168.0.0~192.168.255.255
    - IPv6 CIDR 블록
        - VPC에서 사용하는 프라이빗 네트워크용 IPv6 주소의 범위
        - 특별한 의도가 없는 한 ‘없음’ 선택
    - 테넌시
        - VPC상의 리소스를 전용 하드웨어에서 실행할지 지정

### 서브넷과 가용영역

- 서브넷
    - VPC의 IP 주소 범위를 나누는 단위
- IP 주소 범위를 나누는 이유
    - 역할 분리
        - 외부에 공개하는 리소스 여부를 구별
        - DB 서버의 경우 VPC 내부 서버의 사용. 외부에서 공개되면 안 됨
        - 이 규칙을 리소스마다 개별적으로 할당하지 않고 그룹 전체에 할당하면 설정이 쉬움
    - 기기 분리
        - AWS 안에서의 물리적인 이중화를 수행
        - 가용 영역별로 서브넷 제공 시 여러 서브넷을 동시에 이용하지 못하는 가능성을 낮춤

### IPv4 CIDR 설계 방법

- 설계 시 고려할 항목
    - 생성할 서브넷 수
    - 서브넷 안에 생성할 리소스 수

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/972273b6-1fd1-4e80-b075-83cfc5a5aacd)


- VPC 16비트와 서브넷 4비트를 합쳐서 총 20비트를 서브넷의 CIDR 블록 서브넷 마스크로 설정
    - 이 경우 최대 16개의 서브넷 생성 가능
    - 이 중 4개를 이용하기로 한다
        - public01
            - **sample-subnet-public01**
            - 10.0.0.0/20
                
                ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/084190b1-bcbe-40a2-9ac3-18ab05200069)
                
        - public02
            - **sample-subnet-public02**
            - 10.0.16.0/20
                
                ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/fa495804-d0e1-4f18-bf86-f90f21e56a77)
                
        - private01
            - **sample-subnet-private01**
            - 10.0.64.0/20
                
                ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/b07f2fde-af54-477f-9253-d83910220c9f)
                
        - private02
            - **sample-subnet-private02**
            - 10.0.80.0/20
                
                ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/0f231b1d-9913-47d3-8c3c-4749c6a9d706)
                

### 인터넷 게이트웨이

- VPC에서 생성된 네트워크와 인터넷 사이의 통신을 가능하게 함
- 인터넷 게이트웨이가 없으면 인터넷과 VPC 안의 리소스는 서로 통신할 수 없음

### 인터넷 게이트웨이 생성

- **sample-igw**
- 생성 후 VPC에 연결
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/a141088f-118c-41c8-a8c2-29e7ad1b3af0)
    
    - 인터넷 케이트웨이의 상태가 Attached로 변경됨

### NAT 게이트웨이

- 인터넷 게이트웨이
    - VPC에서 생성된 네트워크와 인터넷 사이의 통신을 수행
    - 이때 VPC에서 생성된 네트워크 안에 만들어진 리소스는 외부 네트워크와 직접 통신하므로 공개 IP가 필요
    - 하지만 공개 IP를 가지면 인터넷에 직접 공개된다는 의미
- NAT 게이트웨이
    - NAT
        - network address translation
        - 네트워크 주소 변환 시스템
    - 프라이빗 서브넷에 생성된 리소스는 인터넷으로 내보낼 수는 있어야 하지만 인터넷에서 접근할 수는 없어야 함
    - 퍼블릭 서브넷에 대해 생성

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/a141088f-118c-41c8-a8c2-29e7ad1b3af0)

- NAT 게이트웨이는 무료가 아님
    - 대안으로 NAT 인스턴스가 있음

### 탄력적 IP

- AWS에서는 리소스에 공개 IP를 작접 할당할 수 없음
- AWS에서 공개 IP 를 관리하는 탄력적 IP 기능 제공

### NAT 시스템

- 아파트 호실과 같은 개념
    - 아파트 - NAT 게이트웨이
    - 아파트 주소 - NAT 게이트웨이의 퍼블릭 IP (공개 IP)
    - 호실 번호 - 프라이빗 IP (사설 IP)
- 내부에서 외부로 통신 시 프라이빗 IP만 포함한 정보를 퍼블릭 IP도 포함한 정보로 변환
    - 56.12.34.78 (10.0.0.1)

### NAT 게이트웨이 생성

- 퍼블릭 서브넷 두 개에 대해 생성
    - **sample-ngw-01**
    - **sample-ngw-02**
- 탄력적 IP 할당
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/7cff9736-a287-477e-83a5-c86596bb9a97)
    
- 시간이 지난 후 상태 Available 됨

### 라우팅 테이블

- VPC상에 서브넷을 생성하고 리소스를 생성할 장소를 준비한 상태
- 인터넷 게이트웨이와 NAT 게이트웨이를 생성해 리소스가 인터넷과 통신할 수있는 상태
- 하지만 서브넷과 서브넷, 서브넷과 각 게이트웨이가 통신할 수 있는 경로가 없음
- 서버 접속 시 경유할 곳에 대한 규칙을 작성
    - 송신 대상지
        - 접속 대상 위치에 관한 정보
        - IP 주소
    - 타깃
        - 경유지에 관한 정보

### 라우팅 테이블에서 대표적인 타깃과 용도

- 로컬
    - 동일 VPC 안의 리솟에 접근
- 인터넷 게이트웨이
    - 퍼블릭 서브넷에 생성된 리소스가 인터넷 서버와 통신
- NAT 게이트웨이
    - 프라이빗 서브넷에 새엉된 리소스가 인터넷 서버와 통신
- VPN 게이트웨이
    - VPN을 통해 접속된 독자 네트워크상의 서버와 통신
- VPN 피어링
    - 접속을 허가한 다른 VPC상의 리소스와 통신

### 라우팅 테이블 생성

- 모든 서브넷에 라우팅 테이블을 작성해야 함
    - **sample-rt-public**
    - **sample-rt-private01**
    - **sample-rt-private02**
- 라우팅 테이블 생성
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/601bf4fe-5175-435c-9c3f-d78ec41894a7)
    
- 라우팅 편집
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/84eae7f9-6fa8-4f03-9529-5b490bc14a89)
    
- 서브넷 연결
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/d6a49d5c-0250-49db-adc3-2ae6fc9d7e72)
    

### 보안 그룹

- 외부로부터의 접근에 제한을 걸음
- 포트번호와 IP 주소로 접근 제한
    - 포트번호
        - 제공하는 서비스의 종류 지정
    - IP 주소
        - 접속원 지정

### 보안 그룹 생성

- 점프 서버용 보안 그룹
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/869c3db4-0890-4d15-b874-3c820aa3e30d)

    - 인바운드 규칙
        - SSH 접속(22번 포트)
        - 0.0.0.0/0에 허용
- 로드 밸런서용 보안 그룹
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/31c12def-07d7-4eba-b4eb-65488ca46dc9)
    
    - 인바운드 규칙
        - HTTP, HTTPS 접속(80번, 443번 포트)

### 네트워크 ACL과 보안 그룹

- 보안 그룹
    - 리소스(EC2, 로드 밸런서, RDS 등)에 대해 설정 가능
- 네트워크 ACL
    - 네트워크에 대한 설정. 해당 서브넷에 포함되는 리소스 모두에 적용