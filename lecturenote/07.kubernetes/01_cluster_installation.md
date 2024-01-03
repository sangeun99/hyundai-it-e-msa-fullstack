# 1부 쿠버네티스의 개념과 설치, 기본 관리 방법

## 01 _ 쿠버네티스 개요와 클러스터 설치

### 쿠버네티스

- 대규모 클러스터 환경에서 컨테이너화된 애플리케이션을 자동으로 배포하고 확장, 관리하는 데 필요한 여러가지 요소들을 자동화하는 오프소스 플랫폼
- 사용자 부하에 따라 자동으로 애플리케이션과 서버의 규모를 확장
- 네트워크, 스토리지, 모니터링 등 시스템 운영에 필수적인 여러 컴포넌트를 편리하게 구축, 관리

### 쿠버네티스의 특징

- 소스코드 기반으로 클러스터 운영
    - 모든 이해관계가자 사전에 검토 가능
    - 사전 검증 작업으로 장애 예방, 배포 속도 향상
    - 효율적인 의사소통
- 의도된 상태로 클러스터를 관리
    - 현재 실행중인 상태를 쿠버네티스 컨트롤러가 자동으로 끊임없이 확인

### 쿠버네티스의 자동 복구 기능

- 예상치 않게 종료되면 자동으로 새로운 파드 생성
- 이후 자동으로 실행 상태로 변경
- 실행 → 종료 → 생성 → 실행

### 쿠버네티스 도입이 어려운 이유

- 가상 머신 환경이 아닌 컨테이너 기반이기에 애플리케이션 자체를 재설계해야 함
- 기존 가상 머신 환경과 기본 철학이 다름
    - 가상 머신 환경
        - 각 가상 머신마다 이름을 부여한 후 문제가 생기면 서버에 접속, 설정을 변경해 문제 해결
    - 파드
        - 임의의 이름을 지정하고 문제 발생 시 즉각 새로운 파드로 교체

### Kubespray를 이용해 3개의 노드로 구성된 클러스터 구축

- Kubespray와 K3s를 이용해 쿠버네티스를 설치하고 여러 원격 클러스터를 관리
- Kubespray
    - 다양한 설치 옵션 및 운영체제를 지원하는 앤서블 기반의 쿠버네티스 설치 자동화 도구
    - 동일한 실행 결과를 보장할 수 있음

### 쿠버네티스 설치하기

- 1번 노드로 이동 후 git clone kubespray
    - `git clone https://github.com/kubernetes-sigs/kubespray.git`
- 패키지 업데이트
    - `sudo apt update && sudo apt upgrade -y`
- python3.9 설치 및 pip3 설치
    - `sudo apt install -y python3.9`
    - `curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py`
    - `python3.9 get-pip.py`
- ~/.local/bin 경로를 PATH 환경 변수에 추가
    - `source ~/.profile`
    - `echo $PATH`
- Kubespray 다운로드
    - `cd`
    - `git clone https://github.com/kubernetes-sigs/kubespray.git`
- 모듈 다운로드
    - `cd kubespray`
    - `python3.9 -m pip install -r requirements.txt`
- 쿠버네티스가 설치될 경로 준비
    - `cp -rfp inventory/sample/ inventory/mycluster`
- 설치될 노드에 대한 정보가 담긴 yaml 파일 생성
    - `vi ./inventory/mycluster/hosts.yml`
        
        ```yaml
        all:
          hosts:
            hd08-01:
              ansible_host: hd08-01
            hd08-02:
              ansible_host: hd08-02
            hd08-03:
              ansible_host: hd08-03
          children:
            kube_control_plane:
              hosts:
                hd08-01:
                hd08-02:
                hd08-03:
            kube_node:
              hosts:
                hd08-01:
                hd08-02:
                hd08-03:
            etcd:
              hosts:
                hd08-01:
                hd08-02:
                hd08-03:
            k8s_cluster:
              children:
                kube_control_plane:
                kube_node:
                calico_rr:
            calico_rr:
              hosts: {}
        ```
        
- 쿠버네티스 설치 관련 옵션 수정
    - `vi ./inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml`
        
        ```yaml
        …
        kube_proxy_strict_arp: true
        …
        container_manager: containerd 
        …
        kubernetes_audit: true
        …
        ```
        
- 스크립트로 쿠버네티스 설치
    - `ansible-playbook -i ./inventory/mycluster/hosts.yml --become -become-user=root -v cluster.yml`
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/862bda02-a503-475d-9b9a-bebdecc137b3)
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/193e6486-6c69-45b6-bd43-f226ed842d6e)
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/8fcc6846-6118-4224-97e6-cc6b44649fe5)
        
- 클러스터 리셋
    - `ansible-playbook -i ./inventory/mycluster/hosts.yml --become -become-user=root -v reset.yml`
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/9a269569-1604-4fe5-8079-aaa0d143b054)
        
- kubectl 확인하기
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/d161a220-4c6d-40e7-8efc-97610a7ea10b)
    

### 로컬호스트에 kubectl 설치

- https://kubernetes.io/ko/docs/tasks/tools/install-kubectl-linux/
- 최신 릴리스를 다운로드
    - `curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"`
- 바이너리를 검증 (선택 사항)
    - `curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"`
    - `echo "**$(**cat kubectl.sha256**)**  kubectl" | sha256sum --check`
        - 성공 시 출력 → kubectl: OK
- kubectl 설치
    - `sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`
- 버전 확인
    - `kubectl version --client`
- 원격 쿠버네티스를 연결하여 설정하기
    - 원격 쿠버네티스 정보 확인하기
        - `sudo bash`
        - `cat /root/.kube/config`
            
            ```yaml
            apiVersion: v1
            clusters:
            - cluster:
                certificate-authority-data: ...
                server: https://127.0.0.1:6443
              name: cluster.local
            contexts:
            - context:
                cluster: cluster.local
                user: kubernetes-admin
              name: kubernetes-admin@cluster.local
            current-context: kubernetes-admin@cluster.local
            kind: Config
            preferences: {}
            users:
            - name: kubernetes-admin
              user:
                client-certificate-data: ...
                client-key-data: ...
            ```
            
    - 로컬호스트에 정보 복사하기
        - kubeconfig 파일을 1번 노드의 일반 계정으로 복사
            - `cp /root/.kube/config /home/sangeun99/`
        - 소유권을 일반유저로 바꾸어주기
            - `chown sangeun99:sangeun99 /home/sangeun99/config`
                
                ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/9bdb515d-a502-4146-bb87-a3cdb2ad51ec)
                
        - 로컬호스트에서 해당 파일 복사받기
            - `scp sangeun99@192.168.56.101:config .`
        - kubeconfig 용 디렉토리를 로컬 호스트에 만들고 kubeconfig 파일을 복사
            - `mkdir ~/.kube`
            - `cp ~/config ~/.kube/`
        - kubeconfig 파일 수정
            - `vi ~/.kube/config`
            - server:127.0.0.1:6443 → server:k8s-01:6443
                
                ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/2349f53f-9f10-4989-9fc5-bc7737617162)
                
                - 이전에 로컬호스트의 /etc/hosts 파일에 아래 내용을 추가
                    
                    ```
                    192.168.56.101	k8s-01
                    192.168.56.102	k8s-02
                    192.168.56.103	k8s-03
                    ```
                    
        - /.kube.config 파일의 정보를 조회
            - `kubectl config view`