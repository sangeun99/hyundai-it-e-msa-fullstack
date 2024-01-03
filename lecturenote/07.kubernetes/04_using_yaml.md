## 04 _ YAML 파일을 이용한 쿠버네티스 오브젝트 관리

- 복잡한 설정을 구현하는 방법
    - service
        - 파드를 연결하는 방식
    - ConfigMap
        - 개별 애플리케이션의 환경변수 설정을 정의
    - limits/requests
        - 자원을 많이 사용해서 동일한 노드를 사용하는 다른 파드에 영향을 끼치지 않게 함

### YAML 파일 익스포트 플러그인 kube-neat 설치

- 모든 쿠버네티스 오브젝트는 YAML 파일로 실행하고, 실행 중인 모든 오브젝트는 YAML 파일로 익스포트 가능
- busybox 파드 실행
    - `k run busybox --image=busybox`
    - `kgp`
        - 다른 파드와 다르게 완료된 상태로 나옴
        - busybox 이미지는 계속 실행되는 프로세스가 없음
            - command 옵션으로 계속 실행되는 프로세스를 추가해야 함
            - `k get pod busybox -o yaml`
- kube-neat 설치
    - 불필요한 정보를 제거
    - `k krew install neat`
- kube-neat 이용
    - `k get pod busybox -o yaml|k neat`
    

### YAML 파일을 이용한 파드 배포

- YAML 파일 저장
    - `k get pod busybox -o yaml|k neat > busybox-pod.yml`
- 파일 확인
    - `vi busybox-pod.yml`
- 파일을 이용해 새로운 리소스 생성
    - `k apply -f busybox-pod.yml`
    - `k get pod -o wide`

### 쿠버네티스 YAML 템플릿 파일 검색 및 네이밍 규칙을 적용해 파일 저장하기

- 쿠버네티스 공식 홈페이지 참조하여 템플릿파일 이용
    - https://kubernetes.io/docs/concepts/services-networking/service/
- 거의 모든 쿠버네티스 오브젝트 YAML 파일은 AKMS 필드 포함
    - AKMS
        - apiVersion
        - kind
        - metadata
        - spec
- 네이밍 규칙
    - {앱이름}-{옵션}-{오브젝트이름}.yml