## Chapter 10. 커스텀 도메인과 DNS 준비하기

### 도메인 이름

- 기억하기 어려운 IP주소 대신 사람이 이해하기 쉬운 표현으로 주소를 나타냄
- DNS 시스템
    - DNS 서버가 관리하는 도메인이면 존재하는 IP 주소를 반환한다
    - DNS 서버가 관리하는 도메인의 서브 도메인이면 서브 도메인을 관리하는 DNS 서버에 질의한다
    - 그 이외의 도메인이면 자신이 소속된 상위 DNS 서버에 질의한다

### SSL 서버 인증서

- 클라이언트와 서버 간의 통신을 인증기관이 보증함
- HTTP + SSL 프로토콜 → HTTPS (암호화된 상태)

### Route 53

- 기능
    - 도메인 이름 등록
        - 상위 도메인을 관리하는 조직에 자신의 도메인을 요청해서 등록
    - DNS 서버
        - 퍼블릭 DNS
            - 인터넷을 경유하는 외부로부터의 통신에 대해 퍼블릭하게 공개하는 서버의 도메인 이름을 결정
            - 퍼블릭 IP를 반환
        - 프라이빗 DNS
            - 시스템 내부에 생성한 리소스에 이름을 붙임
            - 프라이빗 IP를 반환

### Certificate Manager

- SSL 서버 인증서
    - 도메인 검증 완료(DV) 인증서
        - 도메인 이름이 올바름을 보증
        - AWS에서는 여기까지만 대응
    - 조직 검증 완료(OV) 증명서
        - 도메인 이름이 올바름 + 도메인을 관리하는 회사명을 보증
    - 확장 인증(EV) 인증서
        - 도메인을 관리하는 회사의 실제 존재 여부 + 신뢰성을 보증

### 도메인 이름 취득

- AWS 에서도 가능

### 퍼블릭 DNS에 리소스 정보 추가하기

- AWS에서 구매 시 필요 없음
- https://docs.aws.amazon.com/ko_kr/Route53/latest/DeveloperGuide/migrate-dns-domain-in-use.html
- 레코드 생성
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/87fd64c8-a49e-41b5-8fd7-50adf20d4810)
    
- 생성 후 네임서버 설정
    - 가비아에서 레코드 라우팅 대상 등록
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/814afcf8-c41f-493f-9022-0bcea9f36e2b)
        
- 점프 서버 정보 추가
    - 레코드 생성
    - 퍼블릭 IP 주소를 라우팅 대상으로 설정
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/484a4466-dbce-4166-a647-08e99f0de6ba)
    
        
- 로드 밸런서 정보 추가
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/d3cc95e3-50eb-416e-b891-555c1a469301)

### 작동 확인하기

- 점프 서버 작동 확인
    - `nslookup bastion.sangeun.site`
       
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/fd59b403-6162-45f5-9030-3db2293c1b5d)
        
        
    - 도메인 이름을 IP 주소로 변환한 것을 확인
- 로드 밸런서 작동 확인
    - 두 IP는 로드밸런서에서의 문이라고 생각하면 됨
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/65d73efd-c2e9-49ae-bf8f-702504a4ac49)
        
- 도메인 이름으로 접속할 수 있도록 `./ssh/config` 수정
    
    ```
    Host bastion
    	Hostname bastion.sangeun.site
    	User ec2-user
    	IdentityFile ~/.ssh/sample-key.pem
    ```
    

### 프라이빗 DNS 준비하기

| 항목 | 값 |
| --- | --- |
| 도메인 이름 | home |
| VPC 이름 | sample-vpc |
| 리소스 이름 | bastion |
|  | web01 |
|  | web02 |
|  | db |
- VPC 내부의 서버를 참조 시 프라이빗 IP 주소나 긴 도메인 이름이 아닌 알기 쉬운 이름으로 설정
- VPC 내부의 리소스는 프라이빗 DNS에 등록하도록 한다

### VPC에서 프라이빗 DNS를 이용할 수 있는지 확인

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/031d8f34-6b0d-4c1d-9215-5b3c857c7b87)

### Route53에서 호스팅 영역 생성

- 프라이빗 호스팅 영역
- VPC 설정
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/c8088e52-b19c-48ff-a576-3c1ebc007962)

### EC2 정보 추가

- bastion, web01, web02 정보 추가
- 값/트래픽 라우팅 대상으로 프라이빗 IP 등록
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/44b99282-2f48-4e23-81dc-f056b4fef589)
    

### RDS 정보 추가

- RDS 엔드포인트 확인
- Route53에서 레코드 생성
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/5116e2cd-43ad-4bd0-8f61-b9968b3b7b0e)
    

### 작동 확인하기

- ssh 접속 후 확인하기
- `nslookup`
    - `web02.home`
    - `db.home`
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/b32b2479-daa2-47fb-8107-a3964fed2bff)
        

### 도메인 이름으로 연결 변경하기

- `.ssh/config`

```
Host bastion
	Hostname bastion.sangeun.site
	User ec2-user
	IdentityFile ~/.ssh/sample-key.pem

Host web01
	Hostname web01.home
	User ec2-user
	IdentityFile ~/.ssh/sample-key.pem
	ProxyCommand ssh.exe bastion -W %h:%p

Host web02
	Hostname web02.home
	User ec2-user
	IdentityFile ~/.ssh/sample-key.pem
	ProxyCommand ssh.exe bastion -W %h:%p
```

### SSL 서버 인증서 발행하기

- 인증서 요청
      
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/499c1ccc-5546-4cc5-8e0b-167f0d6a269c)
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/3361e559-0cb3-4ec3-ac72-784f99caaee5)

- 요청 검증 대기 필요
- Route53에서 레코드 생성
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/6a3ff300-1c2c-49f8-a969-938bcb23b758)
    

### 로드 밸런서에 리스너 추가

- 발행한 서버 인증서를 이용해 HTTPS를 받는 리스너를 로드 밸런서에 추가
- 기존 리스너
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/3e8f2a92-bb6c-4e0c-9d86-7fb7ddc6f921)
    
    
- 리스너 추가
    
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/46186d02-59e0-465d-8cd4-afdabf02b7c9)

    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/19735965-f97e-4b52-bd59-f29fd3fe9e93)
    

### 작동 확인하기

- 웹 서버 두 개 실행
    - `ssh web01` , `ssh web02`
    - `python -m SimpleHTTPServer 3000`
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/10c20e95-2ad2-465c-ba13-0148133d3d46)
        
        
- 퍼블릭 DNS에 추가된 도메인으로 접속 확인
    - `https://www.sangeun.site`
        
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/6b912027-4390-459d-8bb4-ed90e1360c5d)
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/b6293b2b-e63e-4a10-a08c-9ebfd4a7ea6f)
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/bb0a9f2f-49e1-4c49-a92c-d4b1e6681973)