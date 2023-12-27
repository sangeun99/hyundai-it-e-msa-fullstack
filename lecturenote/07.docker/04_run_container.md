# 4장: 컨테이너를 실행해 보자

## 01 도커 엔진 시작하기/종료하기

- 도커 데스스탑은 도커 엔진을 자동으로 실행하도록 설정돼있음
- 자동 실행 설정 관리 필요

## 02 컨테이너의 기본적인 사용 방법

- 도커 이미지 내려받기
    - `docker image pull penguin`
- 도커 컨테이너 시작하기
    - `docker container start penguin`

### 옵션

- `-d`
    - daemon
    - 백그라운드로 실행
- `-it`
    - interactive + tty
    - -i와 같이 사용해 키보드를 통해 조작하도록 함
- `--name`
    - 이름 부여

### 인자

- 이름 뒤에 값이 전달되는 것
- `--mode=1`
- `--style nankyoku`

### 대표적인 명령어

- `docker version`
- `docker --help`
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/47ac9630-2fdd-4c23-ae34-730709eaf30e)
    

## 03 컨테이너의 생성과 삭제, 실행, 정지

- 컨테이너 생성
    - `docker run`
        - `docker pull` + `docker create` + `docker start`
    - docker run 실행 시 이미지가 있는지 확인 후 이미지 pull → create → start
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/f1da43c9-c31b-4386-a17b-70e9cf54723c)
        
    - `-d` 옵션 없이 실행 시 커맨드라인 사용 불가
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/9a2fbd12-274d-49f0-8cd5-df2f5ccef018)
        
- 컨테이너 확인
    - `docker ps`
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/674351b8-ecd1-4e0c-81bb-4ddbc7e0b5bd)
        
    - 데스크탑에서도 확인 가능
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/71b9bd31-b8e6-48aa-889b-6702b15f3f72)
        
- 컨테이너 정지
    - 컨테이너는 정지 후 삭제해야 함
    - `docker stop kosa01`
- 컨테이너 삭제
    - `docker rm kosa01`

## 04 컨테이너의 통신

### 아파치

- 웹 서버 기능을 제공하는 소프트웨어
- 웹 브라우저를 통해 컨테이너에 접근이 가능하게 하려면 컨테이너를 실행할 때 설정 필요

### 컨테이너와 통신하려면

- 포트를 열어주어 포트를 통해 외부와 접속하도록 해야 함
- 아파치는 서버에서 정해둔 포트에서 웹 사이트에 대한 접근을 기다리다가 사용자가 포트를 통해 접근할 때 요청에 따라 웹사이트의 페이지를 제공
    - 컨테이너 속의 아파치는 외부와 직접 연결되지 않았기에 외부에서 접근 불가능

### 통신이 가능한 컨테이너 생성

- `docker run --name webserver02 -p 8080:80 -d httpd`
- localhost:8080으로 접속
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/6e185961-5030-4cdd-825f-f21d9f754660)
    

## 05 컨테이너 생성에 익숙해지기

### 아파치와 nginx 서버 띄우기

- `docker run --name apache -p 8081:80 -d httpd`
- `docker run --name nginx -p 8082:80 -d nginx`

### MySQL 컨테이너 실행하기

- `docker run --name mysqlserver -d -i -t -e MYSQL_ROOT_PASSWORD=myrootpass mysql`

## 06 이미지 삭제

- 컨테이너가 남아있으면 이미지 삭제 불가능
- `docker image rm (이미지이름)`
- `docker image ls`
    - 이미지 확인