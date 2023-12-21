## Chapter 6. 웹 서버 준비하기

### 점프 서버와 비교

- 웹 서버와 점프 서버는 모두 EC2 인스턴스로 생성
- 점프 서버
    - 시스템 관리자가 가끔 이용
    - 인터넷에서 직접 연결
    - 인스턴스 유형: 최소 성능
    - 서브넷: 퍼블릭 서브넷
    - 퍼블릭 IP 자동 할당: 필요
    - 보안 그룹: 기본 + SSH 접속
- 웹 서버
    - 웹 서비스 사용자가 항상 연결을 시도
    - 로드 밸런서를 통해 간접 연결
    - 인스턴스 유형: 이용자 수에 맞게 적절한 성능
    - 서브넷: 프라이빗 서브넷
    - 퍼블릭 IP 자동 할당: 불필요
    - 보안 그룹: 기본

### 웹 서버 생성하기

- **sample-ec2-web01**
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/f89fe049-2306-40da-b52b-02a713f9d474)
    
- **sample-ec2-web02**

### 접속하기

- EC2 인스턴스 생성 후 ssh 명령을 통해 연결 확인
- 웹 서버는 프라이빗 서브넷에 생성했기에 점프 서버를 경유하여 연결
- 점프 서버에 ssh로 연결 후 거기에서 ssh로 연결하는 방식의 단점
    - ssh 명령어를 두 번 임력해야 함
    - 비밀 키 파일을 점프 서버에 전송해야 함
- 다단계 연결
    - `.ssh/config`
        
        ```
        Host bastion
        	Hostname {점프 서버의 퍼블릭 IP}
        	User ec2-user
        	IdentityFile ~/.ssh/mykey.pem
        
        Host web01
        	Hostname {웹 서버01의 프라이빗 IP}
        	User ec2-user
        	IdentityFile ~/.ssh/mykey.pem
        	ProxyCommand ssh.exe bastion -W %h:%p
        
        Host web02
        	Hostname {웹 서버02의 프라이빗 IP}
        	User ec2-user
        	IdentityFile ~/.ssh/mykey.pem
        	ProxyCommand ssh.exe bastion -W %h:%p
        ```
        
    - 이후 `ssh web01`과 같은 명령어로 직접 웹 서버에 연결

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/1a9c7b47-fbe6-4ff5-ace2-9c69f3b57eb3)