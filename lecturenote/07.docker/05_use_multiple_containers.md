# 5장: 여러 개의 컨테이너를 연동해 실행해보자

## 01 워드프레스 구축

### 도커 네트워크 관련 커맨드

- `docker network ls`
    - 도커에 생성된 네트워크 리스트
- `docker network create [option] (네트워크이름)`
    - 네트워크 생성
- `docker network inspect (네트워크이름)`
    - 해당 네트워크 정보
- `docker network rm (네트워크이름)`
    - 해당 네트워크 삭제

## 02 워드프레스 및 MySQL 컨테이너 생성과 연동

- 네트워크 생성
    - `docker network create (네트워크 이름)`
    - `docker network create wpnet01`
- MySQL 컨테이너 생성 및 실행
    - `docker run --name mysqlwp -d --net=wpnet1 -e MYSQL_ROOT_PASSWORD=myrootpass -e MYSQL_DATABASE=wordpress2023 -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wkunpass mysql --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci --default-authentication-plugin=mysql_native_password`
- WordPress 컨테이너 생성 및 실행
    - `docker run --name wordpress -d --net=wpnet1 -p 8085:80 -e WORDPRESS_DB_HOST=mysqlwp -e WORDPRESS_DB_NAME=wordpress2023 -e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=wkunpass wordpress`
- [localhost:8085](http://localhost:8085) 에서 워드프레스 설정 후 사용
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/b02088a1-2da1-4bbe-aca5-cbc2cc499eb7)
    

## 03 명령어를 직접 작성하자

- LAMP 스택
    - 리눅스 + 아파치 + MySQL + PHP

## 04 레드마인 및 MariaDB 컨테이너를 대상으로 연습하자

### 레드마인

- 티켓을 관리하는 소프트웨어

### 실습

- 네트워크 생성
    - `docker network create redmine000net2`
- MariaDB 컨테이너 생성 및 실행
    - `docker run --name mysql000ex13 -d --net=redmine000net2 -e MYSQL_ROOT_PASSWORD=myrootpass -e MYSQL_DATABASE=redmine000db -e MYSQL_USER=redmine000kun -e MYSQL_PASSWORD=rkunpass mariadb --collation-server=utf8mb4_unicode_ci --default-authentication-plugin=mysql_native_password`
- 레드마인 컨테이너 생성 및 실행
    - `docker run -d --name redmine000ex14 --network redmine000net2 -p 8086:3000 -e REDMINE_DB_MYSQL=mysql000ex13 -e REDMINE_DB_DATABASE=redmine000db -e REDMINE_DB_USERNAME=redmine000kun -e REDMINE_DB_PASSWORD=rkunpass redmine`