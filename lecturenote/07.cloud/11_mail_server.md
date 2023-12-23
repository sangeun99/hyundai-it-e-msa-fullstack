## Chapter 11. 메일 서버 준비하기

### 메일 프로토콜

- alice@jpub.co.kr이 bob@gmail.com에게 메일을 보내는 흐름
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/d73ec086-0404-48e4-9be1-f72043b3e8e8)
    
- SMTP가 1, 2, 3을 담당, POP3과 IMAP4가 4를 담당
    
    
    | 사양 | 프로토콜 |
    | --- | --- |
    | 메일 송신 | SMTP |
    | 메일 수신 | POP3
    IMAP4 |
- POP3과 IMAP4의 차이
    - POP3
        - 메일 소프트웨어에 따라 메일 함 안의 메일을 로컬 컴퓨터에 다운로드
        - 한 번 내려받으면 네트워크 없이도 메일을 읽을 수 있음
        - 다른 컴퓨터에서는 읽을 수 없음
    - IMAP4
        - 브라우저를 통해 직접 메일함의 메일을 읽음
        - 인터넷에 연결되어 있기만 하면 어디서든 메일을 읽을 수 있음

### Amazon SES

- 메일 송신
    - 애플리케이션으로부터 메일을 송신할 때에는 특별한 계정이 됨
        - ex) no-reply@example.com
    - 이들을 IAM 사용자로 등록해 이를 통해 메일 송신
    - IAM 사용자를 이용한 SES 연결 시의 인증 방법
        - Amazon SES API
            - Amazon SES가 제공하는 API를 경유해 직접 Amazon SES와 데이터를 주고 받음
            - SDK와 AWS CLI를 이용해 메일 송신
        - Amazon SES SMTP 인터페이스
            - SMTP를 사용해 메일 송신
- 메일 수신
    - 일반적인 메일 서버
        - 도착한 메일을 각 사용자의 메일함에 저장함
        - 수신자는 POP3나 IMAP4와 같은 프로토콜을 이용해 메일을 수신
    - Amazon SES
        - POP3나 IMAP4 같은 프로토콜을 제공하지 않음
        - 액션이라고 불리는 커리를 실행
        - 이를 통해 애플리케이션에서 제공하는 커스텀 API 실행 가능
            - 도착한 메일을 S3에 저장하거나 Amazon SNS 토픽에 공개하거나 Lambda 함수를 실행

### 메일 송수신을 위한 NAT 인스턴스 보안 규칙 편집

- 인바운드 규칙 편집
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/e764417a-d386-423b-a039-19fb6c3b3733)
    
- 아웃바운드 규칙 편집
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/b9fa02a5-cbb8-4bc6-9b22-7d9a3eb787d7)
    

### 메일 송수신 기능 생성하기

- 서울 리전에서 메일 수신 지원을 안 하기에, 버지니아 북부 리전 선택
- 자격 증명 생성
    - 보안 인증 유형과 도메인 선택
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/8d67b1c8-5c24-46e9-b485-996a36979c88)
        
    - 고급 DKIM 설정
        - 위조가 아님을 보증
            
            ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/4d7d0b3e-e289-4ce7-9558-fe8614d6e905)
            
- 현재 SES가 샌드박스 안에 있기에 검증 완료된 메일 주소를 이용해야만 메일 송수신 가능
    - 메일 주소 추가
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/ec431b3d-1273-455c-9f5b-37c0e5be649c)
        
- 관리 콘솔에서 테스트 메일 송신
    - 도메인 선택 후 테스트 메일 송신
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/618dbaa5-f63c-471b-9310-99e181ac7128)
        
    - 이메일 확인
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/83b8f6cd-f427-471d-a0f9-c192d969b9bc)
        

### SMTP를 이용한 메일 송신

- IAM 사용자 생성
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/09cda9c1-f6ee-4511-94ab-fdb096f6d5fd)
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/98702b22-629f-44fe-b7c3-3353f1655311)
    
    - 생성 후 .csv 인증 정보 다운로드
- SMTP 메일 송신하는 파이썬 파일 작성
    
    ```python
    # -*- coding: utf8 -*-
    from email import header
    import smtplib
    from email.mime.text import MIMEText
    from email.header import Header
    from email import charset
    
    # 각종 정보
    account = 'IAM 계정'
    password = 'IAM 비밀번호'
    server = 'email-smtp.us-east-1.amazonaws.com'
    from_addr = 'no-reply@sangeun.site'
    to_addr = 'sangeun.e.9@gmail.com'
    
    # SMTP 서버에 연결
    con = smtplib.SMTP_SSL(server, 465)
    con.login(account, password)
    
    # 송신할 메일 메시지 생성
    cset = 'utf-8'
    message = MIMEText(u'SMTP 테스트', 'plain', cset)
    message['Subject'] = Header(u'SMTP을 경유한 전자메일 송신 테스트', cset)
    message['From'] = from_addr
    message['To'] = to_addr
    
    # 메일 송신
    con.sendmail(from_addr, [to_addr], message.as_string())
    
    # SMTP 연결 끊기
    con.close()
    ```
    
- `vi sendmailtest.py`
- `python sendmailtest.py`
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/247b1093-d6e8-47e3-ae6a-16137e17f4ac)
    

### 메일 수신

- 수신한 메일을 S3에 저장하도록 함
- **aws-intro-sample-mailbox-tori**라는 S3 버킷 생성
    - 관련 문서: https://docs.aws.amazon.com/ko_kr/ses/latest/dg/receiving-email-permissions.html#receiving-email-permissions-s3
        
        ```json
        {
          "Version":"2012-10-17",
          "Statement":[
            {
              "Sid":"AllowSESPuts",
              "Effect":"Allow",
              "Principal":{
                "Service":"ses.amazonaws.com"
              },
              "Action":"s3:PutObject",
              "Resource":"arn:aws:s3:::(버킷 이름)/*",
              "Condition":{
                "StringEquals":{
                  "AWS:SourceAccount":"(AWS 계정ID)",
                  "AWS:SourceArn": "arn:aws:ses:(수신규칙이 포함된 리전):(AWS 계정ID):receipt-rule-set/(규칙 세트 이름):receipt-rule/(규칙 이름)"
                }
              }
            }
          ]
        }
        ```
        
- 규칙 세트 생성
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/34e2a3a8-2c74-4b0f-8fb3-8faa61fe8b91)
    
- 규칙 생성
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/2425d143-c7f3-4e7b-a819-a0877be22a4f)
    
    - 수신 가능 메일 주소 설정
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/4f1fb4a4-3166-4dee-bf45-1ea3941e2717)
        
    - 메일 수신 시 액션 설정
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/f358fe17-3863-449f-870b-aa390591d5c1)
        
- 가비아에서 DNS 설정
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/8be4903e-c86b-4ba3-b985-b5b98f415c8a)
    