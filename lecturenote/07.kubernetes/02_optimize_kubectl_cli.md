## 02 _ 효율적인 쿠버네티스 클러스터 관리를 위한 kubectl CLI 환경 최적화

### ****kubectl 자동 완성 활성화****

- ubuntu는 bash completion이 기본으로 설치되어 있음
- kubectl 자동 완성 활성화 진행
    - https://kubernetes.io/ko/docs/tasks/tools/install-kubectl-linux/
- kubectl 자동 완성 활성화
    - `echo 'source <(kubectl completion bash)' >>~/.bashrc`
- kubectl alias 추가
    - `echo 'alias k=kubectl' >>~/.bashrc`
    - `echo 'complete -o default -F __start_kubectl k' >>~/.bashrc`
- shell 다시 로드
    - `exec bash`
- 이 외 자동완성 추가
    
    ```bash
    cat << EOF >> ~./bashrc
    
    alias ka='kubectl apply --recursive -f'
    alias kgp='kubectl get pods -o wide'
    alias kgd='kubectl get deploy -o wide'
    alias kgs='kubectl get service -o wide'
    alias kgn='kubectl get nodes -o wide'
    alias kge='kubectl get events -w --field-selector type=Warning'
    alias kgv='kubectl get pvc -o wide'
    alias kgpa='kubectl get pods -o wide -A'
    alias kgpw='kubectl get pods -o wide -w'
    alias kgpaw='kubectl get pods -o wide -A -w'
    
    alias krn='kubectl run nginx --image=nginx --restart=Never'
    alias kcn='kubectl create deployment nginx --image=nginx'
    alias krb='kubectl run busybox --image=busybox --restart=Never -- sleep 1d'
    ```
    
    - EOF로 끝내기

### krew를 이용한 플러그인 관리

- krew는 kubectl 플러그인 매니저
- https://krew.sigs.k8s.io/docs/user-guide/setup/install/
    - ubuntu 다운로드
        
        ```bash
        (
          set -x; cd "$(mktemp -d)" &&
          OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
          ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
          KREW="krew-${OS}_${ARCH}" &&
          curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
          tar zxvf "${KREW}.tar.gz" &&
          ./"${KREW}" install krew
        )
        ```
        
    - krew에 관련된 폴더를 PATH 환경변수에 추가
        - `echo 'export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"' >> ~/.bashrc`
    - 적용하기
        - `source ~/.bashrc`
- krew 명령어
    - view가 들어간 명령어 찾기
        - `kubectl krew search view`
    

### kube-ctx, kube-ns, kube-ps1 활용

- kube-ctx 설치
    - `kubectl krew install ctx`
    - 현재 컨텍스트 확인
        - `k ctx`
- kube-ns 설치
    - `k krew install ns`
    - 현재 클러스터의 전체 네임스페이스 확인
        - `k ns`
            
            ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/e2cd6407-749a-46fe-b763-205586ba44c5)
            
    - kube-system 네임스페이스 변경
        - `k ns kube-system`
    - kube-system 네임스페이스에서 파드 확인
        - `k get pod`
            
            ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/117ad1a7-d1ac-4966-a6b3-2e0f2820b42e)
            
- kube-ps1 설치
    - `git clone https://github.com/jonmosco/kube-ps1`
    - `vi ~/.bashrc`로 삽입
        
        ```bash
        source $HOME/kube-ps1/kube-ps1.sh
        PS1='[\u@\h \W $(kube_ps1)]\$ '
        KUBE_PS1_SYMBOL_ENABLE=false
        ```
        
    - bashrc 적용
        - `source ~/.bashrc`
        - 현재 클러스터, 네임스페이스가 함께 표시됨
            
            ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/40aaac80-addc-4e33-9489-129780f949b0)