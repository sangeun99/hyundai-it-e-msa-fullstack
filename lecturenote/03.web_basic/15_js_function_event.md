## 15. 함수와 이벤트

### 함수

- 함수 선언
    - `function 함수명 () { 명령 }`
- 함수 호출
    - `함수명()`

### var, let, const

- var
    - 재선언 가능
    - 재할당 가능
    - var 예약어로 변수 선언 시 함수 내에서만 사용할 수 있는 지역변수
    - var 예약어 없이 변수 선언 시 함수 밖에서도 사용 가능한 전역변수
    - 호이스팅
        - 상황에 따라 변수의 선언과 할당을 분리해서 선언 부분을 스코프의 가장 위쪽으로 끌어올리는 것
            
            ```jsx
            var x = 10;
            
            function displayNumber() {
              console.log("x is " + x);
              console.log("y is " + y);      
              var y = 20;
            }
            displayNumber();
            ```
            
        - y는 undefined라고 나타남. (선언은 되었지만 할당되지 않은 상태)
        - y의 선언은 console.log 보다 늦었지만 변수 호이스팅으로 인해 자바스크립트 해석기가 var을 이용한 변수를 먼저 파악한 것
- let
    - 재선언 불가
    - 재할당 가능
    - 블록 레벨의 스코프
    - 호이스팅이 없음
- const
    - 재선언 불가
    - 재할당 불가
    - 블록 레벨의 스코프
    - 호이스팅이 없음

### 자바스크립트 변수 가이드

- 변수 오류를 줄이려면 let과 const를 사용하는 것이 좋음
- 전역 변수를 최소한으로 사용
- var 변수는 함수의 시작 부분에서 사용
- for문 카운터 변수로 var 대신 let을 이용

### 함수 표현식

- 익명 함수
    
    ```jsx
    var sum = function (a, b) {
    	return a + b;
    }
    document.write(sum(10, 20));
    ```
    
- 즉시 실행 함수
    
    ```jsx
    (function() {
      var userName = prompt("이름을 입력하세요.");
      document.write("안녕하세요? <span class='accent'>" + userName + "</span>님!");
    }());
    ```
    
- 화살표 함수
    
    ```jsx
    const hi = () => { alert("안녕하세요")};
    hi();
    ```
    

### 이벤트

- 마우스 이벤트
    - click, dblclick, mousedown, mousemove, mouseover, mouseout, mouseup
- 키보드 이벤트
    - keydown, keypress, keyup
- 문서 로딩 이벤트
    - abort, error, load, resize, scroll, unload
- 폼 이벤트
    - blur, change, focus, reset, submit
- 이 외의 이벤트
    - https://developer.mozilla.org/en-US/docs/Web/Events
- HTML 태그 안에 이벤트 처리하기
    
    ```html
    <a href="#" onclick="alert('버튼을 클릭했습니다.')">Green</a>
    ```
    
- DOM을 이용한 이벤트 처리기
    
    ```jsx
    // 방법 1: 웹 요소를 변수로 지정 & 미리 만든 함수 사용
    var changeBttn = document.querySelector("#change");
    changeBttn.onclick = changeColor;
    
    function changeColor() {
      document.querySelector("p").style.color = "#f00";
    }
    ```
    
    ```jsx
    // 방법 2: 웹 요소를 따로 변수로 만들지 않고 사용
    document.querySelector("#change").onclick = changeColor;
    
    function changeColor() {
    	document.querySelector("p").style.color = "#f00";
    }
    ```
    
    ```jsx
    // 방법 3: 직접 함수를 선언
    document.querySelector("#change").onclick = function() {
    	document.querySelector("p").style.color = "#f00";
    };
    ```