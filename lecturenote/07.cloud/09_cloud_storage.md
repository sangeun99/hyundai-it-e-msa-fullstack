## Chpater 9. 이미지 저장 장소 준비하기

### 스토리지와 메모리

| 항목 | 스토리지 | 메모리 |
| --- | --- | --- |
| 속도 | 느림 | 빠름 |
| 용량 당 비용 | 낮음 | 높음 |
| 데이터 저장 기간 | 영구적 | 전원을 끄면 사라짐 |
| 사용 방법 | 우선 메모리에 로딩해서 사용 | 직접 사용 |
| 용도 | 텍스트나 이미지 등을 장기간 저장하는 장소 | 프로그램 작동에 필요한 정보를 일시적으로 보존하는 장소 |

### EBS (Amazon Elastic Block Store)

- EC2 인스턴스가 SSD나 하드 디스크에 해당하는 스토리지를 제공
- 문제점
    - EC2 인스턴스의 OS 자체도 관리해야 함
    - 장애 발생 시 대응 준비 필요
    - EC2 인스턴스를 사용하지 못할 가능성
- S3를 대신 사용함
    - 내결함성과 비용 측면에서 우수

### S3와 VPC의 관계

- S3는 VPC 밖에 생성
- S3에 접근하는 두 가지 방법
    - 인터넷으로부터 직접 접근
    - VPC로부터 접근
        - S3에 대한 접근 권한 필요
        - IAM의 역할을 이용해 적용

### S3 버킷 생성하기

- **aws-intro-sample-s3**
- 다른 설정은 수정하지 않음
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/370c207a-c119-427a-b2a3-b698a3d3bf05)
    

### 역할을 생성해 EC2에 적용하기

- **sample-role-web**
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/69fd04f3-811f-4ed4-9374-90c4254227b8)
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/80ce81a6-5a5c-4590-b02c-02ac3c1c3164)
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/a72eea7b-7a4d-4d85-8f09-0f1d5d37c4be)

- EC2에 역할 수정
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/d4185d5d-9896-4325-9db9-65ce657307ab)
    

### 작동 확인하기

- 웹서버에서 버킷에 파일 업로드하기
- `aws s3 cp test01.txt s3://aws-intro-sample-tori`
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/60a0dfb0-1ffa-4fee-8fea-aa0570b3894b)