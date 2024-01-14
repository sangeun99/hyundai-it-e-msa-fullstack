# 7장: 도커 컴포즈를 익히자

## 01 도커 컴포즈란?

- 시스템 구축과 관련된 명령어를 하나의 텍스트 파일에 기재해 명령어 한번에 시스템 전체를 실행하고 종료와 폐기까지 한번에 하도록 도와주는 도구
- YAML 파일
- up 커맨드
    - 정의 파일에 기재된 내용대로 이미지를 내려받고 컨테이너를 생성 및 실행
- down 커맨드
    - 컨테이너와 네트워크를 정지 및 삭제
    - 컨테이너와 네트워크 삭제 없이 종료만 하고 싶다면 stop 커맨드 이용
- Dockerfile과의 차이점
    - Dockerfile은 이미지를 만들기 위한 것, 네트워크나 볼륨은 만들 수 없음

## 02 도커 컴포즈의 설치와 사용법

### 도커 컴포즈의 사용법

- `docker-compose.yml`
- 파일은 호스트 컴퓨터에 배치되지만 명령어는 도커 엔진에 전달됨
- 정의 파일은 한 폴더에 하나만 있을 수 있기에 여러 개의 정의 파일을 사용하려면 그만큼 폴더를 만들면 됨

## 03 도커 컴포즈 파일을 작성하는 법

- 순서
    - version
        - 도커 컴포즈 버전
    - services
        - 컨테이너 관련 정보
        - 각 컨테이너의 설정 내용
            - image
            - networks
            - ports
            - volumes
            - environment
            - …
    - networks
        - 네트워크 관련 정보
    - volumes
        - 볼륨 관련 정보

### YAML 형식 파일 작성 요령

- 들여쓰기는 같은 수의 배수만큼의 공백 사용
- 여러 항목을 기재하려면 줄 앞에 -를 붙임

### 실습

```yaml
version: "1"
services:
  mysql000ex11:
    image: mysql
    networks:
      - wordpress000net1
    volumes:
      - mysql000vol11:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: myrootpass
      MYSQL_DATABASE: wordpress000db
      MYSQL_USER: wordpress000kun
      MYSQL_PASSWORD: kunpass
  wordpress000ex12:
    depends_on:
      - mysql000ex11
    image: wordpress
    networks:
      - wordpress000net1
    volumes:
      - wordpress000vol12:/var/www/html
    ports:
      - 8087:80
    restart: always
    environment:
      WORDPRESS_DB_HOST: mysql000ex11
      WORDPRESS_DB_NAME: wordpress000db
      WORDPRESS_DB_USER: wordpress000kun
      WORDPRESS_DB_PASSWORD: kunpass
networks:
  wordpress000net1:
volumes:
  mysql000vol11:
  wordpress000vol12:
```

## 04 도커 컴포즈 실행

- `docker-compose -f 정의_파일_경로 up 옵션`
- `docker-compose -f 정의_파일_경로 down 옵션`
- `docker-compose -f 정의_파일_경로 stop 옵션`

### 도커 컴포즈 실행

- `docker-compose up -d`
- localhost:8087에서 확인
    
    ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/cd317533-c105-4c6a-9232-7a18c92688eb)
    
- `docker-compose down` 으로 닫기