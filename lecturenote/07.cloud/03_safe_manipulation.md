## Chapter 3. 안전한 조작 준비하기

### AAA

- Authentication
    - 인증
    - 망, 시스템 접근을 허용하기 전에 사용자의 신원을 검증
- Authorization
    - 권한검증
    - 검증된 사용자에게 어떤 수준의 권한과 서비스를 허용
- Accounting
    - 계정관리
    - 사용자의 자원에 대한 사용 정보를 모아서 과금, 감사, 용량증설, 리포팅 등

### IAM

- AWS의 리소스 접근을 안전하게 관리하는 시스템
- Authentication
    - 아이디와 패스워드를 이용해 AWS에 로그인
- Authorization
    - AWS 사용자가 어떤 기능을 사용할 수 있는가를 관리하고 허가
- Accounting
    - IAM 사용자에게 일반 개발 작업에 필요한 권한을 부여
    - 그룹을 생성하고 그룹에 권한을 부여, 그 그룹에 사용자를 넣어줄 수 있음

### IAM 대시보드를 이용해 안전성 확인하기

- AWS 계정 루트 사용자의 액세스 키 잠금
    - 루트 사용자의 액세스 키는 없는 상태로 둬야 함
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/5db9c082-4626-4edf-8361-f8a6991b27ad)
        
    - [보안 자격 증명] → [액세스 키] 삭제
- MFA 활성화
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/e405249e-0113-491c-b055-03d535193aec)

    - AWS에서는 비밀번호(아는 요소) + 인증 디바이스(가진 요소)로 MFA 수행
    - [보안 자격 증명] → [MFA 활성화]
- 개별 IAM 사용자 생성
    - IAM 대시보드에서 사용자 추가 실행
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/50bdc82e-d790-46c4-b4c7-a9d32ea2e6f2)
        
- 사용자 그룹을 이용한 접근 권한 할당
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/ea13ca87-c2d8-4880-999d-7e11b0506ddf)
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/c7e50295-00bd-4f5e-8357-2f16199e4d17)
    
- 사용자에 대한 강력한 암호 정책 구성

    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/d95db774-e0e3-4e38-8cd8-a1671fb34fa2)
