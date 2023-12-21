## Chapter 5. 점프 서버 준비하기

### 점프 서버(배스천 호스트)

- 네트워크를 안전하게 보호하면서 리소스를 생성할 수 있도록 함
- 해당 서버를 경유해야만 각 리소스에 접속할 수 있도록 함
- EC2를 이용해 구축하기로 함

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/52d1db1c-ad58-47ca-90f0-342cb62b8b8a)

### 점프 서버 준비하기

- 이용할 키 페어 생성
    - [EC2] → [네트워크 및 보안] → [키 페어]
    - (키 이름).pem
- 점프 서버 생성하기
    - **sample-ec2-bastion**
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/41aab9e9-abe2-4bcd-8ad4-813baa84eb87)
        
- EC2 인스턴스 설정 항목
    - AMI
    - 인스턴스 유형
    - 네트워크
    - 서브넷
    - 퍼블릭 IP 자동 할당
    - 태그
    - 보안그룹

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/67b3db05-98dc-41aa-90d0-7661c505335c)

### 명령어

- `sudo yum update`
    - 패키지 업데이트
- `drwx------`
    - 첫 자리에 s라면 symbolic link
- `more`, `less`

### 커널과 쉘

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/020f2686-e680-4ad8-a564-5cdba9e784df)

- 커널
    - 커널을 통해서 하드웨어를 제어
    - 시스템의 자원을 관리하는 운영체제
    - 사용자가 쉘을 통해 입력한 명령어를 해석하여 기계가 이해할 표현으로 바꾸어 전달
- 쉘
    - 응용프로그램의 명령어와 커널이 대화를 할 수 있도록 함