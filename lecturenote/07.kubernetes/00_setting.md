## 00 _ 실습 환경 구축

- VirtualBox 다운로드
- Ubuntu 20.04 이미지 다운로드

### VirtualBox 가상머신 만들기

- 이름과 운영체제 설정
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/6ffe9d8b-55e5-45d9-b4e2-7fad1edce719)
    
- 하드웨어 설정
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/37968952-af31-4abd-b3a8-fa533b07209b)
    
- 가상 하드 디스크 10GB
- 추가 설정
    - 하드 디스크 새로 만들고 선택
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/cadd7221-adfc-4336-99d8-4b495e40281b)
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/1d0b064d-d36e-40da-bbb8-b84c1005f86f)
        
    - NAT 네트워크 새로 만들고 어댑터 1로 연결
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/768532e4-599c-441f-872d-5fc3a3794201)
        
    - 어댑터 2
        - <네트워크 어댑터 활성화> 체크
        - 다음에 연결됨: <호스트 전용 어댑터>
        - 이름: <VirtualBox Host-Only Ethernet Adapter>

### 우분투 설치

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/db49fdf3-3846-449f-9d92-7ee910f36639)

- IP 주소 설정
    - [NAT 네트워크 IP 설정]
        - Subnet: 10.0.2.0/24
        - Gateway: 10.0.2.1
        - Name Servers: 8.8.8.8, 8.8.4.4
        - Address
            - HD08-01: 10.0.2.101
            - HD08-02: 10.0.2.102
            - HD08-03: 10.0.2.103
    - [호스트 전용 IP 설정]
    - Subnet: 192.168.56.0/24
- 계정 설정
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/5c7830c9-b14b-48cf-978d-e20a605b6d7a)
    
- OpenSSH 설치
- 이 외에는 기본값 선택

### 우분투 설치 후 작업

- 로컬호스트에서 ssh 접속
    - `ssh sangeun99@192.168.56.101`
- (네트워크 설정 변경)
    - `sudo nano /etc/netplan/00-installer-config.yaml`
        
        ```yaml
        network:
          ethernets:
            enp0s3:
              addresses:
              - 10.0.2.101/24
              gateway4: 10.0.2.1
              nameservers:
                addresses:
                - 8.8.8.8
                - 8.8.4.4
                search: []
            enp0s8:
              addresses:
              - 192.168.56.101/24
          version: 2
        ```
        
    - `sudo netplan apply`
    - netplan get
- 우분투 서버를 최신 상태로 업데이트
    - `sudo apt update && sudo apt upgrade`
- VirtualBox의 Guest Additions 설치
    - 가상 머신의 윈도우에서 [장치] → [게스트 확장 CD 이미지 삽입]
    - cdrom 마운트시키기
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/2a478c3d-adf2-448f-843a-2d33bbad9a28)

        - `sudo mkdir /media/cdrom`
        - `sudo mount /dev/cdrom /media/cdrom`
        - `ll /media/cdrom`
    - 설치를 위한 런타임, 라이브러리 등을 설치
        - `sudo apt install dkms build-essential linux-headers-generic linux-headers-$(uname -r)`
    - `sudo su`
    - `./VBoxLinuxAdditions.run`
    - Guest Additions 설치 확인
        - `lsmod | grep -io vboxguest`
    - 정보 확인
        - `modinfo vboxguest`
            
            ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/a96c7844-02a4-44f7-99df-a07ab2412dde)
            
- 방화벽 해제
    - `sudo ufw disable`
    - `sudo ufw status`
- 암호 입력 없이 sudo 실행할 수 있도록 설정
    - `sudo su -`
    - `visudo`
    - `<본인계정> ALL=(ALL) NOPASSWD:ALL`
- 가상 머신들의 IP 주소와 hostname 설정
    - `sudo vi -f /etc/hosts`
        
        ```
        10.0.2.101      hd08-01
        10.0.2.102      hd08-02
        10.0.2.103      hd08-03
        ```
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/da332628-24bd-452f-8787-f93e341d83d3)
        

### 가상머신 복제해서 두 대 더 만들기

- 복제
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/bd86ddba-0a4e-4f72-a9d1-2a3867b5f0d6)
    
    - 설정 기본값 + 완전한 복제
- 호스트 컴퓨터에 저장된 원격 컴퓨터(1번 가상머신)의 정보를 삭제
    - `rm .ssh\known_hosts`
    - `rm .ssh\known_hosts.old`
    - `ssh sangeun99@192.168.56.101`
- 새 가상머신의 hostname 변경
    - `sudo hostnamectl set-hostname hd08-02 --static`
    - `bash`
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/38a287f5-ab42-47dc-a4c6-121003fd5df5)
        
- 새 가상머신의 IP 주소 변경
    - `sudo vi /etc/netplan/00-installer-config.yaml`
    - IP 주소 101 → 102로 변경
    - `sudo netplan apply`
    - `ssh sangeun99@192.168.56.102`
        - 새로 접속
    - 확인
        - `hostname -I`
        - `ip a`
        - `curl http://www.naver.com`
- `/etc/hosts` 파일 수정
    - `sudo vi /etc/hosts`
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/26438116-aee6-4c4c-87a5-782108e24d87)
        
- 1번과 2번 통신 확인
    - 각각 ssh 접속
    - hd08-02에서 확인
        - `ping hd08-01 -c 5`
        - `ping 10.0.2.101 -c 5`
    - hd08-01에서 확인
        - `ping hd08-02 -c 5`
        - `ping 10.0.2.102 -c 5`

### 패스워드 없이 ssh 접속하기

- 키 생성
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/a6cc185f-23e0-488f-b8a5-e14f1bf5ec7a)
    
- 세 개의 머신에 키 보내기
    - `ssh-copy-id hd08-01`
    - `ssh-copy-id hd08-02`
    - `ssh-copy-id hd08-03`
- 세 머신에서 모두 같은 작업을 해준다
- 이후에는 인증 없이 접속 가능