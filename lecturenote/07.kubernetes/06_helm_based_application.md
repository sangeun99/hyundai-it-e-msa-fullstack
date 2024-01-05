## 06 _ 헬름 기반으로 애플리케이이션 설치하기

- 헬름
    - 다양한 리소스를 하나의 패키지로 관리하는 도구
    - 많은 업체들이 헬름 파일을 제공해, 사용자는 별도의 YAML 파일을 만들지 않고 만들어진 헬름 파일을 이용
- 헬름의 주요 개념
    - 헬름 차트
    - 헬름 리포지토리
    - 헬름 템플릿

### 헬름의 주요 구성 요소

- 헬름 차트
    - 애플리케이션 설치에 사용되는 네트워크, 스토리지, 보안과 관련된 여러 쿠버네티스 리소스를 묶어놓은 패키지
    - 헬름 차트를 통해 애플리케이션을 설치 시 개별 리소스마다 하나씩 별도로 설치하지 않고 헬름 차트 하나로 일괄 설치
    - 헬름 차트 디렉토리 구조
        
        ```
        wordpress/
          Chart.yaml          # 차트에 대한 정보를 가진 YAML 파일
          LICENSE             # 옵션: 차트의 라이센스 정보를 가진 텍스트 파일
          README.md           # 옵션: README 파일
          values.yaml         # 차트에 대한 기본 환경설정 값들
          values.schema.json  # 옵션: values.yaml 파일의 구조를 제약하는 JSON 파일
          charts/             # 이 차트에 종속된 차트들을 포함하는 디렉터리
          crds/               # 커스텀 자원에 대한 정의
          templates/          # values와 결합될 때, 유효한 쿠버네티스 manifest 파일들이 생성될 템플릿들의 디렉터리
          templates/NOTES.txt # 옵션: 간단한 사용법을 포함하는 텍스트 파일
        ```
        
- 헬름 리포지토리
    - 다양한 헬름 차트를 저장하고 공유하는 저장소
    - ArtifactHub
        - 단일 헬름 장소에서 다양한 헬름 차트를 사용할 수 있도록 헬름 차트 허브를 제공
    - 로컬에 원격 리포지토리 주소를 등록해서 사용 가능
    - 각 리포지토리별로 지원하는 애플리케이션 목록 조회
        - `helm search`
    - 리포지토리 목록 조회
        - `helm repo list`
    - 리포지토리 내 설치 가능한 애플리케이션 조회
        - `helm search repo bitnami`
- 헬름 템플릿
    - 설치와 관련된 파일 관리
    - `values.yaml` 파일로 공통으로 사용하는 변수 관리

### 헬름 차트를 이용한 NGINX 웹서버 설치

### 헬름을 이용한 애플리케이션 라이프사이클 관리

- helm 유틸리티 설치
    - `curl -fsSL -o get_helm.sh https://github.com/helm/helm/blob/main/scripts/get-helm-3`
    - `chmod 700 get_helm.sh`
    - `./get_helm.sh`
- 버전 확인
    - `helm version`
- 헬름을 이용해 NGINX 설치
    - NGINX 헬름 차트를 포함하는 bitnami 헬름 리포지토리를 로컬호스트에 추가
        - `helm repo add bitnami https://charts.bitnami.com/bitnami`
    - NGINX 헬름 차트 확인
        - `helm search repo nginx`
- 헬름 차트를 로컬호스트에 내려받아 직접 관리하기
    - 헬름 차트 다운로드
        - `helm pull bitnami/nginx`
    - 압축을 풀고 디렉터리 이름 변경하기
        - `tar xvfz nginx-15.5.2.tgz`
        - `rm -rf nginx-15.5.2.tgz`
        - `mv nginx nginx-15.5.2`
        - `cd nginx-15.5.2/`
- 새로운 변수 파일 만들기
    - `cp values.yaml my-values.yaml`
    - replicaCount만 1 → 2로 변경
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/0a5e4096-5773-4809-80e8-bc2e9879a697)
        
- 변경된 파일로 NGINX 애플리케이션 설치
    - 네임스페이스를 생성하고 생성한 네임스페이스로 변경
        - `k create ns nginx`
        - `k ns nginx`
    - NGINX 헬름 차트 설치
        - `helm install nginx -f my-values.yaml .`
    - 생성한 헬름 차트 확인
        - `helm ls`
    - 설치 후 관련 파드 확인
        - `kgp`
- 임의로 생성한 NGINX 파드와의 차이
    - 헬름 차트에는 기본으로 다양한 쿠버네티스 리소스를 포함
        - 디플로이먼트, 컨피그맵, 서비스 등
        - `k get deploy,svc,configmap`
            
            ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/6e81aeb3-a9dc-48ac-8ea7-32846be5ebe8)
            
    - 조금 더 안정적으로 동작
    - 헬름 차트를 사용하지 않으면 해당 설정을 일일이 추가해야 함
- 헬름 차트로 설치된 전체 리소스 목록 확인
    - `helm get manifest nginx`
        - livenessProbe/readinessProbe 포함

### 리소스 Requests/Limits 이해

- 파드가 사용 가능한 자원을 제한
- Requests
    - 처음 노드에 파드를 할당할 때 해당 요청량 이상의 여유 자원이 있는 노드에 파드를 할당
    - 파드가 배치된 이후 각 파드 간 자원 사용량이 증가해서 노드에서 할당 가능한 자원 이상을 사용해 자원 경합이 발생하면 파드는 Request에서 할당한 자원만큼 사용이 가능하도록 보장받음
- Limits
    - 사용 가능한 자원을 제한
    - 예) limits.cpu: 1000m, limits.memory: 512Mi

### limits를 초과한 파드 실행

- stress
    - 부하 실행 도구
- limits
    - 메모리 제한 사용량
- mem-limits01-pod.yml
    
    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: memory-demo-1
    spec:
      containers:
      - name: memory-demo-1
        image: polinux/stress
        resources:
          requests:
            memory: "3Gi"
          limits:
            memory: "6Gi"
        command: ["stress"]
        args: ["--vm", "1", "--vm-bytes", "6500M", "--vm-hang", "1"]
    ```
    
    - 컨테이너의 메모리 사용량을 6Gi로 제한
    - stress 도구를 사용해 6500M의 메모리를 사용하도록 리소스 부하를 발생시킴
        
        ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/e9e2ce04-3c8c-4e77-a34f-f06eec9d1660/9925ddec-2999-4195-9883-21b8ca9cd13a/Untitled.png)
        

### requests 이용하기

- mem-requests01-pod.yml
    
    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: memory-demo-1
    spec:
      containers:
      - name: memory-demo-1
        image: polinux/stress
        resources:
          requests:
            memory: "3Gi"
          limits:
            memory: "6Gi"
        command: ["stress"]
        args: ["--vm", "1", "--vm-bytes", "100M", "--vm-hang", "1"]
      nodeSelector:
        kubernetes.io/hostname: minikube-m02
    ```
    
    - memory-demo-1
    - 메모리 Requests를 3Gi로 설정
    - 100M의 메모리 부하로 파드 실행
- mem-requests02-pod.yml
    - memory-demo-2
    - 메모리 Limits를 6Gi로 설정
    - 5500M의 메모리 부하롤 파드 실행
- 두 파드 모두 정상 실행
- memory-demo-1의 메모리 사용량을 2900M로 올리면 메모리 부하 발생
    - memory-demo-1는 Requests 설정인 3Gi 이내이므로 이상 없음
    - memory-demo-2는 Requests 설정인 3Gi을 초과하여 5500M을 사용
        - 파드 종료되고 다시 시작되는 상황을 반복