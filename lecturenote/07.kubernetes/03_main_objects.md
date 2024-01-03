## 03 _ kubectl 명령어로 익히는 쿠버네티스의 주요 오브젝트

### kubectl 명령어로 익히는 쿠버네티스의 주요 오브젝트

- kubectl 명령어
    - run, create
        - 파드와 디플로이먼트 생성
    - get, exec
        - 생성된 파드 현황 조회 및 파드 내 bash 스크립트 실행 (파드 접속)
    - scale, delete
        - 파드의 수량 증가/감소 및 오브젝트 삭제
    - create namespace
        - 네임스페이스 생성
- 쿠버네티스의 모든 오브젝트는 API 서버로 생성
    - 사용자가 쿠버네티스 명령어를 실행하면 쿠버네티스는 해당 명령어의 API를 호출하여 오브젝트를 실행

### nginx 파드 실행과 배시 실행

- nginx 파드 만들기
    - `k run nginx --image nginx`
- 파드 조회
    - `kgp`
- `watch` 를 이용해 변화하는 내용 확인
- 파드 접속
    - `k exec -it nginx -- bash`
    - procps 패키지 설치
        - `apt -y update && apt -y install procps`
        - WSL 위에 minikube를 올렸더니 에러 발생
            - 네트워크 통신 오류
            - root에서 */etc/resolv.conf* 확인
                - `cat /etc/resolv.conf`
                    
                    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/7d450751-d911-43bb-a3f1-081617057403)
                    
            - 네임서버 셋팅
                - `echo nameserver 8.8.8.8 > /etc/resolv.conf`
            - 이후 정상작동
                
                ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/82000daf-511d-46f9-9c91-f9d2515d2a0e)
                
    - 전체 프로세스 목록 확인
        - `ps aux`
            
            ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/c86b082f-3552-4e20-a326-0252ec2a9a7f)
            

### 디플로이먼트의 파드 개수 변경과 삭제

- 디플로이먼트
    - 파드가 배포되는 방법을 정의하는 오브젝트
    - 파드의 개수, 이미지 종류, 배포 방법을 정의
- 디플로이먼트 생성
    - `k create deployment httpd --image=httpd`
    - `kgp`
- 파드 개수 변경
    - `k scale deployment httpd --replicas 10`
    - `k get pod -w`
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/a1512da5-5236-435d-b3eb-4097abc8e350)
        
- 파드 수량 0으로 변경
    - `k scale deployment httpd --replicas=0`
    - `kgp`
- 파드 수량 다시 1로 변경
    - `k scale deployment httpd --replicas=1`
    - `kgp`
- 파드 삭제
    - `k delete pod httpd-5c98f79dfc-x7xhg`
    - `kgp`
        - 기존 파드가 삭제되고 새로운 파드가 자동으로 생성됨
        - 파드가 삭제되면 쿠버네티스가 해당 파드를 감시하고 있다가 자동으로 파드 수량 1을 유지하기 위해 자동으로 파드 생성
            - 내부적으로 replication-controller 파드가 기동
- 현재 지정한 파드 수량과 실행 중인 파드 수량 확인
    - `k get deployments.apps`

### 네임스페이스 생성

- create 명령어로 디플로이먼트, 시크릿, 네임스페이스 등 생성 가능
- 네임스페이스 생성
    - `k create ns default01`
- 네임스페이스
    - 클러스터를 구분하는 가상 클러스터 단위
    - 같은 네임스페이스 내에서는 같은 이름의 오브젝트 생성 불가능
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/69c18b50-9705-4a70-8788-614aa61c8508)
        
    - 다른 네임스페이스에서는 같은 이름의 오브젝트 생성 가능
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/b0557b51-eb8c-4a03-bca9-52772bebe12a)
        
    - 현업에서는 주로 애플리케이션을 구분하는 단위로 사용
        - nginx, Tomcat, MySQL 등이 각각의 네임스페이스를 가지는 구조
        - 각 개발자별로 역할을 분리해 네임스페이스의 권한을 제한할 수도 있음
    - 네임스페이스간 네트워크 연결 가능
        - 파드의 IP 주소 확인
            - `kgp -n default`
            - `kgp -n default01`
        - 파드 접속
            - `k exec -it nginx -- bash`
        - ping 실행을 위한 패키지 설치
            - `apt-get update -y`
            - `apt-get install iputils-ping -y`
        - ping 접속
            - `ping 10.244.1.8 -c 5`