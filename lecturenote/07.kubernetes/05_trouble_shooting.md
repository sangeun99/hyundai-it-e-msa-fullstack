## 05 _ 쿠버네티스 트러블슈팅의 기본 프로세스

- 쿠버네티스 작업 순서
    - AGDLGE (아기다람쥐이)
    - Apply
    - Get
    - Describe
    - Logs
    - Get Event

### 임의로 잘못된 이미지 버전을 사용해 NGINX 파드 배포

- 파드 배포 *Apply*
    - `k apply -f ./nginx-error-pod.yml`
        
        ```yaml
        apiVersion: v1
        kind: Pod
        metadata:
          name: nginx-19
        spec:
          containers:
          - image: nginx:1.19.19 # 존재하지 않는 이미지 버전
            name: nginx-pod
        ```
        
- 파드 확인 *Get*
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/e1ff0bce-3ed3-49d0-90a8-0874420c9304)
    
- 파드 상세 정보 확인 *Describe*
    - `k describe pod nginx-19`
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/e08c43b5-4bec-491f-8cd1-41b8486510e7)
        
- 이미지 버전 수정 후 다시 배포
    - `k delete pod nginx-19`
    - `k apply -f nginx-modify-pod.yml`
    - `kgp`
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/4730dbf1-b651-4f56-875e-9e2512ee3dde)
        
- 로그 확인 *Logs*
    - 애플리케이션 자체의 문제 해결
    - `k logs -f nginx-19`
        - `-f` 실시간 로그 확인
            
            ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/0006f27e-6927-40d3-bf9d-1eacb7e9ad05)
            
- 클러스터 이벤트 확인 *Get Event*
    - 전체 클러스터 레벨의 에러 확인
    - 해당 네임스페이스와 관계된 호스트 노드, 네트워크, 스토리지 등 클러스터 전반의 이벤트 출력

### 장애 처리 사례: 호스트 노드의 파일 시스템 용량 초과

- 파드 숫자를 10개로 하는 busybox 디플로이먼트를 생성
- 호스트 노드에 접속해 파일 시스템의 90% 이상을 차지하는 임의의 큰 파일 생성
- 실행 중인 busybox 파드 상태를 관찰하고 에러 상황이 발생했을 때 어떻게 에러메세지를 확인하는지 알아봄
- 쿠버네티스는 자원이 부족한 노드가 발생하면 자동으로 해당 노드의 파드를 다른 노드로 이전함
    - 최초 의도한 상태가 파드 수량 10개이므로 이를 계속 유지하려 함