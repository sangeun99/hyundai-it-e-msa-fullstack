# 6장: 실전에 활용 가능한 컨테이너 사용법을 익히자

## 02 컨테이너와 호스트 간에 파일 복사하기

- 파일 복사
    - 컨테이너 ↔ 호스트 양방향 가능
- 호스트 → 컨테이너
    - `docker cp 호스트경로 컨테이너이름:컨테이너경로`
- 컨테이너 → 호스트
    - `docker cp 컨테이너이름:컨테이너경로 호스트경로`
- 실행중인 컨테이너에 터미널로 붙기
    - `docker exec -i -t apache /bin/bash`

### 호스트의 파일을 컨테이너 속으로 복사

- 아파치 컨테이너 생성
    - `docker run --name apa000ex19 -d -p 8089:80 httpd`
- 파일 복사
    - `docker cp index.html apa000ex19:/usr/local/apache2/htdocs/`
- 실행 확인
    
    ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/e2378fbd-8d13-4709-aeab-bb61d98eb447)
    

### 호스트의 파일을 컨테이너 속으로 복사

- `docker cp apa000ex19:/usr/local/apache2/htdocs/ Documents`
    
    !![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/41b35609-4fa2-4616-b93a-f9942172b58a)
    

## 03 볼륨 마운트

### 볼륨과 마운트

- 볼륨
    - 스토리지의 한 영역을 분할한 것
- 마운트
    - 대상을 연결해 운영체제 또는 소프트웨어의 관리하에 두는 일
- 컨테이너의 특성 상 쓰고 버려야 하기에 언젠가는 삭제된다
- 이 때 데이터를 소멸시키지 않기 위해 데이터를 옮기는 작업이 필요

### 스토리지 마운트의 종류

- 볼륨 마운트
    - 도커 엔진이 관리하는 영역 내에 만들어진 볼륨을 컨테이너에 디스크 형태로 마운트
    - 임시 목적의 사용이나 자주 쓰지는 않지만 지우면 안되는 파일
- 바인드 마운트
    - 도커 엔진에서 관리하지 않는 영역의 기존 디렉터리를 컨테이너에 마운트
    - 폴더 속에 파일을 직접 두거나 열어볼 수 있기에 자주 사용하는 파일을 둠

| 항목 | 볼륨 마운트 | 바인드 마운트 |
| --- | --- | --- |
| 스토리지 영역 | 볼륨 | 디렉토리 또는 파일 |
| 물리적 위치 | 도커 엔진의 관리 영역 | 어디든지 가능 |
| 마운트 절차 | 볼륨을 생성한 후 마운트 | 기존 파일 또는 폴더를 마운트 |
| 내용 편집 | 도커 컨테이너를 통해서 | 일반적인 파일과 같이 |
| 백업 | 절차가 복잡함 | 일반적인 파일과 같이 |

### 스토리지 영역을 마운트하는 과정

- run 커맨드 옵션 형태로 지정
    - 링크를 다는 느낌으로 마운트하는 것
- 스토리지 영역을 먼저 생성하고 컨테이너를 생성(및 마운트)
- 볼륨 생성 및 삭제
    - `docker volume create 볼륨_이름`
    - `docker volume rm 볼륨_이름`
- 스토리지를 마운트하는 커맨드
    - `docker run ( … ) -v 스토리지_실제_경로:컨테이너_마운트_경로 (…)`
    - `docker run ( … ) -v 볼륨_이름:컨테이너_마운트_경로 (…)`

### 바인드 마운트 실습

- 폴더 생성 → 아파치 컨테이너 생성 → 초기 화면 확인 → index.html 파일을 배치 → 확인
- `docker run --name apa000ex20 -d -p 8090:80 -v /Users/tori/Documents/apa_folder:/usr/local/apache2/htdocs httpd`
- localhost:8090 접속
    
    !![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/e9e0b885-98bf-4336-a98c-b0dbfdb240e4)
    
- 로컬 파일 수정 후 재접속
    - `/Users/tori/Documents/apa_folder`에 index.html 생성
        
        ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/7889a355-368f-420e-9ebb-20408d4aa8b2)
        

### 볼륨 마운트 실습

- 직접적인 확인이 까다롭기에 `volume inspect` 명령으로 간접적으로 확인
- 볼륨 생성 → 아파치 컨테이너 생성 → 확인
- 볼륨 생성
    - `docker volume create apa000vol1`
- 아파치 컨테이너 생성
    - `docker run --name apa000ex21 -d -p 8091:80 -v apa000vol1:/usr/local/apache2/htdocs httpd`
- volume inspect 커맨드로 볼륨의 상세 정보 확인
    - `docker volume inspect apa000vol1`
        
        !![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/fdbddce6-81b5-4283-8651-ece9c7032674)
        
    - `docker container inspect apa000ex21`
        
        ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/fc394707-86fd-4285-90ac-2a4d6f7dafdb)
        

## 04 컨테이너로 이미지 만들기

### commit 커맨드로 컨테이너를 이미지로 변환

- 컨테이너를 이미지로 변환
- 기존 컨테이너를 복제하거나 이동할 때 편리
- `docker commit 컨테이너_이름 새로운_이미지_이름`

### 실습

- `docker run --name apa000ex22 -d -p 8092:80 httpd`
- `docker commit apa000ex22 ex22_original1`
- `docker image ls`
    
    ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/5a7cfcd2-b4df-4183-bf6b-799bd9cb56cd)
    

### Dockerfile 스크립트로 이미지 만들기

- 스크립트를 빌드해 이미지를 만드는 방법
- 실제 컨테이너를 만들 필요 없음
- `docker build -t 생성할_이미지_이름 재료_폴더_경로`
- Dockerfile 스크립트의 예
    
    ```
    FROM 이미지_이름
    COPY 원본_경로 대상_경로
    RUN 리눅스_명령어
    ...
    ```
    

### 실습

- Dockerfile 생성
    
    ```
    FROM httpd
    COPY index.html /usr/local/apache2/htdocs
    ```
    
- `docker build -t ex22_original2 /Users/tori/Documents/apa_folder`
    
    ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/031aaf69-83c6-4337-ad43-1f24003b6c3b)
    
- `docker image ls` 로 확인
    
    ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/94c18b3f-3343-42be-9b98-1c7fd043027e)
    

## 05 컨테이너 개조

### 컨테이너를 개조하는 두 가지 방법

- 파일 복사와 마운트 이용
- 컨테이너에서 리눅스 명령어를 실행
    - 소프트웨어를 설치하거나 설정을 변경
    - bash를 실행하는 인자 : /bin/bash
        - `docker exec —it apa000ex23 /bin/bash`

### 도커 엔진을 통해야 하는 명령과 컨테이너 안에서 실행해야 하는 명령

- 도커 엔진을 통해야 하는 명령
    - 컨테이너 전체에 대한 관리 작업
        - 도커 엔진 자체의 시작 또는 종료, 네트워크, 디스크 설정, 실행 중인 컨테이너 목록 확인
- 컨테이너 내부에서 실행하는 명령
    - 컨테이너 속 새로운 소프트웨어를 추가
    - 컨테이너 속 소프트웨어의 실행 및 종료 등

## 06 도커 허브 등록 및 로그인

### 도커 허브와 도커 레지스트리

- 도커 허브
    - 도커 제작사에서 운연하는 공식 도커 레지스트리
    - 우리가 내려받는 이미지는 여기서 제공됨
- 도커 레지스트리
    - 이미지를 배포하는 장소
- 리포지토리
    - 레지스트리를 구성하는 단위

### 태그와 이미지 업로드

- 태그를 부여해 복제하는 명령어
    - `docker tag 원래_이미지_이름 레지스트리_주소/리포지토리_이름:버전`
- 이미지를 업로드하는 커맨드
    - `docker push 레지스트리_주소/리포지토리_이름:버전`