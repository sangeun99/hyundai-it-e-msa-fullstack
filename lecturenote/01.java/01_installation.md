## 1장. 자바 시작하기

### Java Install

- 이클립스가 java21 지원하지 않기에 쓰지 않을 것
- Oracle openJDK 이용
- https://adoptium.net/ 이클립스 지원하는 openJDK
- LTS : LongTerm Supported

### 환경 변수 설정

- JAVA_HOME을 환경변수로 선언하여 시스템 PATH를 선언
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/65d793a8-bea6-4045-a2fe-d478ade8c4d6)
    

### cmd를 이용한 java 생성

```jsx
C:\Users\um_se>copy con Hello.java
public class Hello {
        public static void main(String[] args) {
                System.out.println("Hello world");
        }
}
^Z
        1개 파일이 복사되었습니다.

C:\Users\um_se>javac Hello.java

C:\Users\um_se>java Hello
Hello world
```

- `copy con` 파일 생성
- `ctrl + z + enter` 파일 생성 완료

### Java 플랫폼 독립성

- make once, run anywhere
- 중간단계에 가상머신을 두고 소스코드를 가상머신이 알아들을 수 있도록 작성
- JVM은 운영체제별로 만들어주면 된다
- 한 번 컴파일하여 실행하면 어느 플랫폼에서도 사용할 수 있음
- 이렇게되니 하드웨어를 100% 사용하지 못 함
- 속도가 느리지만 enterprise 환경에서 주로 사용되어 단점이 모마됨

- 다른 파일과 합쳐져 가상머신 역할을 함
- 실제 컴파일러는 javac.exe

### Eclipse 설치

- 압축 해제 후 eclipse.exe 실행
- 디렉토리를 C:\dev\workspace 로 설정 후 launch

### Eclipse 접속 후 설정

- project 생성하기
- create a project
- java project 선택 후 next
- 프로젝트 이름 : xcijava01
- use an execution environment jre :
    - JavaSE-17 로 설정하면 이클립스 내부 걸로 설정됨
    - → jvm 역할을 함
- create module-info.java file 설정 해제

- src 파일이 xcijava01/bin 안에 설정됨
- open persipective

### JRE 변경

- 이 프로젝트에서 사용하는 JRE를 살펴보면 ECLIPSE의 플러그인 폴더로 잡혀있음
- 컴퓨터에 설치된 버전으로 바꾸고 싶다면 Window → Preferences로 이동
- Java 메뉴의 installed jres에 들어가서 디폴트값을 변경 가능
- 프로젝트 생성 시 use a project specific JRE를 통해 이용 가능

- 프로젝트 삭제 시 체크하면 워크스페이스까지 삭제됨 (완전히 지워짐)

### 첫 프로젝트 생성

- [src] → [new] → [Java Class]
- 이름 : hello
- finish

### 글꼴 변경

- [Preferences]  d2coding

### 단축키

- [Help] → [Show Active Keybinding] 에서 단축키 확인 가능
- `ma + ctrl + space` 메인 함수 선언 단축키
- `syso + ctrl + space` System.out.println();
- `ctrl + alt + 방향키` 라인 복제
- `ctrl + d` 라인 삭제
- ctrl 키 잡고 System 찍으면 해당 클래스 확인 가능
- `블럭 설정 후 ctrl + /` 라인 주석 처리
- `블럭 설정 후 ctrl + shift + /` 블럭 주석 처리
- `블럭 설정 후 ctrl + shift + \` 블럭 주석 해제
- `블럭 설정 후 ctrl + shift + f` 포맷팅

### 단축키 설정하기

- [Preferences] → [Java] → [Editor] → [Templates] → [New]
- Context: Java
- Description: 이해하기 쉽도록 작성
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/5a66d0e9-cfc5-478c-a4f6-aff311272adb)
    

### 패키지 이름 변경

- 패키지 이름 미설정시 프로젝트명으로 설정됨
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/ffbe7d22-1cd2-47e2-b746-66bf5f00f21d)
    
- F2번 단축키

- 저장버튼 누를 때마다 bin(바이너리폴더)의 class 파일은 갱신됨 (오류 없다면 자동 컴파일됨)
- [Window] → [Show View] → [Other] → [General]

### public static void main(String[] args) {}

- public: 공개되어야 함
- static: 진입 시점부터 만들어져 있어야 함
- void: OS에게 반환하는 값 없음
- public class는 하나만 생성 가능
    - public class 붙은 것이 A.java 와 같은 방식으로 파일명이 설정됨
    

### 문자열 연산

```jsx
System.out.println("내 키는 170에 10cm 구두를 신었으니 " + 170 + 10);
```

출력 결과: 내 키는 170에 10cm 구두를 신었으니 17010

- 괄호를 사용하면 원하는대로 출력 가능

```jsx
System.out.println("내 키는 170에 10cm 구두를 신었으니 " + (170 + 10));
```

출력 결과: 내 키는 170에 10cm 구두를 신었으니 180

- escape sequence: 역슬래시
    - \n: 새 행 출력
    - 역슬래시를 출력하고자하면 \\ 이용
    - \t: 탭 출력

- formatting을 위한 printf
    - 4.2f: 총 네자리인데 소수점 2자리까지 출력하라