## Chapter 7. 로드 밸런서 준비하기

### 스케일 아웃

- 성능을 향상하는 방식
- 1대의 웹 서버로는 요청을 처리할 수 없을 때 웹 서버 여러 대를 준비하여 성능을 높일 수 있음
- 로드 밸런서가 이 방법 중 하나

### 로드 밸런서의 역할

- 요청 분산
    - 인터넷으로부터 전송된 요청을 여러 웹 서버에 균등하게 분산
- SSL 처리
    - 송수신하는 데이터를 암호화
    - HTTPS 프로토콜
    - 빠른 속도로 암호 관련 처리 수행
- 부정 요청 대응
    - 부정한 접근을 처리해 방지

### AWS에서 제공하는 로드 밸런서

- ELB
    - Application Load Balancer
    - Network Load Balancer
    - Classic Load Balancer
- https://docs.aws.amazon.com/ko_kr/elasticloadbalancing/

### 로드 밸런서를 이용한 요청 라우팅

- 요청 라우팅
    - 공개한 프로토콜과 포트 번호의 조합을 내부의 웹서버가 받는 프로토콜과 포트 번호로 변환하는 기능 제공

### 로드 밸런서 생성하기
![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/9d37e3e9-1ca6-4f18-8fbd-bb4b3c622efd)
- ALB 설정 항목
    - 로드 밸런서
        - 인터넷에서 로드 밸런서로 접근할 때와 관련한 설정
    - 대상 그룹
        - 어떤 웹 서버에 요청을 분산할 것인가에 대한 설정
- **sample-elb**
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/d539f099-6743-4911-86f7-b1df6521e433)
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/7f176aab-4eb4-476e-9048-2654dc96c58e)
    
- 대상 그룹 설정
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/66af91fe-6b1f-4dd1-b7ae-4104dd4db5db)
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/51dd0007-5158-4353-9b59-cca33ba7c6ff)
    
- 생성한 타겟 그룹 선택
    
    ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/e9e2ce04-3c8c-4e77-a34f-f06eec9d1660/64e20f67-27c1-4972-91ab-53412897107d/Untitled.png)
    

### 작동 확인하기

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/fa183555-e082-47fa-a002-e61ff05bd5f9)

- web01 접속
- vi를 이용해 index.html 수정하기
    - `vi index.html`
- python을 이용해 HTTP 서버 가동
    - `python -m SimpleHTTPServer 3000`
- 대상 그룹에서 요청 라우팅 확인
    - healthy로 바뀌면 대상 웹 서버로 요청이 라우팅됨
    - (시간이 걸리는 작업)
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/67eff255-b0de-42db-8fa4-6a82e2536a07)
        
- 브라우저에서 접근
    - [로드밸런서] → [DNS 이름] 을 통해 웹 브라우저 접속
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/9e9389e2-acff-46a3-85e2-c304672e56fa)
