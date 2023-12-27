# 3장: 도커를 사용해보자

## 01 도커를 사용하려면

- 리눅스 컴퓨터에서 도커 사용하기
- 가상 머신이나 렌탈 환경에 도커를 설치하고 윈도우나 macOS를 통해 사용하기
- 윈도우용/macOS용 도커 사용하기

## 02 도커 설치

### 도커 데스크탑 설치

- 3번 방법
- 윈도우에서는 Hyper-V를 활성 상태로 함
- [Windows 기능 켜기/끄기]
    - [Linux용 Windows 하위 시스템] 켜기
    - [가상 머신 플랫폼] 켜기
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/15b1a93f-3d8e-4541-a538-42229313a41e)
        
- WSL2 설치
    - [WSL 설치](https://learn.microsoft.com/ko-kr/windows/wsl/install)
    - [WSL 개발 환경 설정](https://learn.microsoft.com/ko-kr/windows/wsl/setup/environment)
    - `wsl --install`
        - WSL 설치
    - `wsl --list --online`
        - 설치할 수 있는 유효한 배포 목록
    - `wsl --install -d Ubuntu-22.04`
        - 우분투 설치
    - username과 password 설정
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/2693b5c5-fcb2-4116-abd5-da214d2b1393)
        
    - Windows Terminal에서 Ubuntu 환경 열기
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/36dea86a-5d09-490e-a201-1d3e5bf5f53e)
        
    - root 계정으로 들어가기
        - `wsl -u root`
- 윈도우용 도커 데스크톱 받기
    - https://www.docker.com/products/docker-desktop/
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/403b6e8e-1646-43c5-a606-0c3af1a9103f)
        

## 03 도커의 조작 방법과 명령 프롬프트 및 터미널 실행

- 도커는 명령 프롬프트이나 터미널로 실행 가능
- `docker run penguin`
- `docker stop penguin`