# Part 1. 스프링 개발 환경 구축

## 01. 개발을 위한 준비

### 환경설정

- STS 설치
    - https://github.com/spring-attic/toolsuite-distribution/wiki/Spring-Tool-Suite-3#latest-sts3-downloads
    - ADOPTIUM에서 JDK 11 LTS JDK 다운로드
        - 환경변수 설정 바꿔주기
    - Server 설정
        - VMWare 지우고 [Apache] → [Tomcat v9.0] 으로 변경
- UTF-8 설정
    - [Window] → [Preferences]
        - [General] → [Workspace]
        - [Web] → [HTML], [CSS], [JSP]
        - [General] → [Editors] → [Spelling]
- lombok 설치
    - `C:\dev\sts-bundle\sts-3.9.18.RELEASE>java -jar lombok.jar`
    - STS 경로 설정 후 종료

### 새 프로젝트 만들고 실행

- [New] → [Spring Legacy Project]
- `net.developia.spring01`
- 실행 시 [Run as] → [Run on Server]
- pom.xml
    - project object moel

### 스프링 버전 변경하기

- 스프링 버전이 3.x 이고 JDK 환경이 1.6 기준으로 되어있어 변경 필요
- 11 line java-version `11`로 변경
- 12 line `5.0.7.RELEASE`로 변경
- 141, 142 line source와 target `11`로 변경

### 라이브러리 오류 시 해결 방법

- `C:\Users\um_se\.m2` 내의 모든 내용 삭제
- 프로젝트 선택한 수 우클릭 → [Maven] → [Update Project]