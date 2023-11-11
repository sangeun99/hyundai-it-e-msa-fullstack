## 16. 자바스크립트와 객체

### 객체

- 프로그램에서 인식할 수 있는 모든 대상
- 인스턴스
    - `new 객체명`
- 프로퍼티
    - 객체의 특징이나 속성
- 매서드
    - 객체에서 할 수 있는 동작

### 자바스크립트의 내장 객체 (1) Array 객체

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array
- concat()
- join()
- push()
    - 배열 맨 끝에 요소 추가
- unshift()
    - 배열 맨 앞에 요소 추가
- pop()
    - 배열 맨 뒤 요소 꺼내기
- shift()
    - 배열 맨 앞 요소 꺼내기
- splice()
    - 인수가 1개인 경우
        - 지정한 인덱스부터 맨 끝 요소까지 삭제
    - 인수가 2개인 경우
        - 첫 번째 인수는 인덱스값, 두 번째 인수는 삭제할 요소의 개수
    - 인수가 3개 이상인 경우
        - 첫 번째 인수는 삭제할 시작 인덱스, 두 번째 인수는 삭제할 개수, 세 번째 인수부터는 삭제한 위치에 새로 추가할 요소
- slice()
    - 기존 배열을 바꾸지 않으면서 요소를 꺼냄

### 자바스크립트의 내장 객체 (2) Date 객체

- 날짜, 시간 정보를 가져오는 메서드
- 사용자가 원하는 날짜, 시간으로 설정하는 메서드
- 날짜, 시간 형식을 바꿔주는 메서드

### 자바스크립트의 내장 객체 (3) Math 객체

- random()

### 브라우저와 관련된 객체

- window
    - 브라우저 창이 열릴 때마다 하니씩 만들어짐
    - 브라우저 창 안의 요소 중에서 최상위에 음
- document
    - 웹 문서마다 하나씩 있음
    - <body> 태그를 만나면 만들어짐
    - HTML 문서의 정보가 담김
- navigator
    - 현재 사용하는 브라우저의 정보가 들어있음
- history
    - 현재 창에서 사용자의 방문 기록을 저장함
- location
    - 현재 페이지의 URL 정보가 담겨 있음
- screen
    - 현재 사용하는 화면 정보를 다룸

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/d764c37a-2b77-4da1-a9e7-7e07a77b2265)


### window 객체

- 기본 객체이므로 생략 가능
- open()
    - 팝업 창을 열고 이름 지정, 위치 지정
- close()

### navigator 객체

- userAgent 프로퍼티
- console에 navigator를 입력하면 객체의 정보를 확인할 수 있음

### history 객체

- 프로퍼티
    - length
- 메서드
    - back()
    - forward()
    - go()

### location 객체

- 프로퍼티
    - href
    - host
    - protocol
- 메서드
    - reload()
    - replace()

### screen 객체

- 프로퍼티
    - availHeight
    - availWidth