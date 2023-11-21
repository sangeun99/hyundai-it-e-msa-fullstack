## HTML, CSS, JS 리뷰

### HTML 리뷰

- HTML
    - 문서 요소를 브라우저의 메모리에 올리기 위한 언어
- a 태그
    - 제어를 유지하면서 이동하고 싶을 때 #를 이용

### CSS 리뷰

- 선택자
    - 기본 선택자
        
        ```css
        .class { background-color: silver; }
        #fruit { background-color: transparent; }
        ```
        
    - 복합 선택자
        
        ```css
        ul li { color: blue; } /* 자손 */
        ul > li { background-color: pink; } /* 자식 */
        li#기준 ~ li { color: plum; } /* 바로 뒤의 형제들 */
        li#기준 + li { color: green; } /* 바로 뒤의 형제 */
        ```
        
    - 속성 선택자
        
        ```css
        /* 속성 선택자 */
        li[title] { color: orange; } /* 속성 존재 여부 */
        li[title="할인"] { color: red; } /* 속성 값이 같다면 */
        li[title~="무료배송"]::after { content: " [무료배송]";} /* 공백 기준으로 포함된다면 */
        li[title$="품절"] { color: grey; } /* 속성 값이 끝난다면 */
        li[title^="hot"] { color: red; font-weight: bold;} /* 시작된다면 */
        li[title*="무료"] { text-decoration: underline; } /* 포함된다면 */
        
        li[title~="할인"]li[title~="무료배송"] { color: black; } /* and */
        li[title~="할인"], li[title~="무료배송"] { color: black; } /* or */
        ```
        
    - 가상 선택자
        
        ```css
        #fruit > ol > li:nth-child(2n) { background-color: lime; }
        ```
        

### jQuery

- cdn으로 스크립트 가져오기
    - https://releases.jquery.com/
- 요소 선택하기
    
    ```jsx
    $('li[title$="품절"]').on('click', function() {
      alert("품절입니다");
    });
    ```
    
    - JavaScript 표준 문법
        
        ```jsx
        document.querySelector('li[title$="품절"]').addEventListener('click', function() {      
          alert("품절입니다");
        });
        ```
        

### 호이스팅

- 코드를 실행하기 전 변수나 함수 선언이 해당 스코프의 최상단으로 끌어올려진 것 같은 현상
- 코드를 실행했을 때
    - 변수와 함수는 global context에 등록됨
        - 선언만 되는 것일 뿐, 초기화되는 것은 아님
        - var 변수 선언의 경우 undefined로 초기화됨
        - 같은 이름의 함수가 있다면 오버라이딩됨
            - 이 때문에 이름 있는 함수는 위험함
    - 등록된 변수와 함수는 어디있는지 알고 있기에 접속이 가능함
        - 자바스크립트 엔진이 함수를 마주치면 함수를 찾아서 그것을 실행함
    - 그 위에 실행 context가 올라가는 것

### 함수지향형 언어

- 함수를 이용하여 모든 것을 설계
- 함수 데이터 타입이 있음
    
    ```jsx
    typeof(add5) // function
    ```
    

### this 키워드

- window
    - global 콘텍스트의 담당자
    - 생략 가능함
- var 변수
    - var name 선언 시 name은 변수가 아니라 window 객체의 프로퍼티로 선언
    - this 키워드를 사용하고 싶다면 var을 사용
- let 변수
    - 그냥 변수로 선언되어 this 키워드를 사용할 수 없음
    - scope를 정해주고 싶다면 let을 사용

### var 변수와 함수 실행 과정

```jsx
var cnt = 0;
function count() {
  return ++cnt;
}

console.log(count());
console.log(count());
console.log(count());
```

- global context에 cnt가 올라감
- 함수 실행 시 함수 실행 context가 생김
- 실행 완료 시 cnt 값을 바꾸고 pop이 됨

```jsx
let obj = {
  name: '다',
  test: function() {
    console.log(name); // 전역객체
    console.log(this.name); // this는 obj를 의미함
    console.log(window.name); // 전역객체
  }.bind(this) // this가 window를 가르키게 하고 싶다면?
}
obj.test();
```

- function() 자체가 object이기에 바로 메소드를 쓸 수 있는 것
    - bind(this): this가 window를 가리키게 하고 싶다면 씀

### 클로저(Closure) D.P.

- 상황
    
    ```jsx
    var cnt = 0;
    function count() {
      return ++cnt;
    }
    
    // cnt = 100; // side effect
    console.log(count());
    console.log(count());
    console.log(count());
    ```
    
    - side effect가 발생: 만약 누군가 var로 정의된 변수의 값을 바꿔버린다면?
        - 순수함수: side effect가 발생하지 않는 함수
    - 하지만 cnt를 전역변수로 선언해야먄 cnt 값을 정상적으로 받아올 수 있음
        - 지역변수는 context에 올라갔다가 없어지기에 상태가 유지되지 않음
        - scope는 지역변수이며 상태 유지는 함수에서만 돌아가는 변수가 필요 → 불가능
        - 클로저 등장 배경
- 자바스크립트에서는 모든 것을 함수로 만들고 그것을 호출하도록 함
    
    ```jsx
    // 클로저 (closure) d.p
    function count2() {
      var count = 0;
      return function() {
        return ++count;
      }
    }
    
    let cl = count2();
    console.log(cl());
    console.log(cl());
    console.log(cl());
    console.log(cl());
    ```
    
    - count2를 실행 컨텍스트에 올려두고 cl을 호출
        - 많이 실행하면 메모리 문제가 생길 수도 있음
        - HTML 기반일 경우 다음 페이지로 넘어가면 리셋되기에 고민하지 않아도 되지만 SPA의 경우 다음 페이지로 넘어가지 않기에 고민해야 함
    - cl이 호출될 때 count가 없음 → count를 호출한 상위로 찾아 올라감

### 커링 (Currying) D.P.

- 클로저를 이용한 디자인 패턴
- 반환 값을 함수로 주어 add(2)(3) 과 같은 형태로 이용할 수 있도록 함
- add 함수 구현하기
    
    ```jsx
    function add2(x) {
      return function(y) {
        return x + y;
      }
    }
    
    console.log(add2(1)(2));
    ```
    
- 배열 원소의 제곱을 가진 원소 배열을 반환하는 함수 구현하기
    
    ```jsx
    function curry(fn) {
      return function(x) {
        return x.map(fn);
      }
    }
    console.log(curry((x) => x * x)([1, 2, 3, 4, 5]));
    ```
    

### 메모이제이션 (Memoization) D.P.

- 재귀함수처럼 반복적으로 실행되는 부분을 저장하여 사용할 수 있도록 함
- 기존 함수
    
    ```jsx
    let cnt1 = 0;
    function fib(n) {
      cnt1++;
      if (n < 2) return n;
      return fib(n - 2) + fib(n - 1);
    }
    let r = fib(5);
    console.log(cnt1, r); // 15, 5
    ```
    
- 메모이제이션을 이용한 함수
    
    ```jsx
    let result = [];
    cnt1 = 0;
    function fib2(n) {
      cnt1++;
      if (n < 2) return result[n] = n;
      if (result[n] == undefined) {
        result[n] = fib2(n-1) + fib2(n-2);
      }
      return result[n];
    }
    r = fib2(5);
    console.log(cnt1, r, result); // 9, 5
    ```
    
- 함수 실행 횟수가 줄어들음

### Ajax

- 동기식
    - 작업 a, b, c가 존재할 때, a가 끝나야 b 실행, b가 끝나야 c 실행되는 구조
        - 마우스가 움직이는 동안 다른 작업이 진행되지 않음
- JavaScript는 비동기식
    - JavaScript는 싱글쓰레드이기에 동시에 작업을 실행할 수 없다
    - Single Thread임에도 (마우스가 움직일 때도 다른 작업이 진행되도록) 하고 싶음 → 비동기 도입
        
        ```jsx
        let result = "";
        $.get('msg.json', function(data) {
          result = data;
          console.log(result); // (2) 출력 됨
        })
        console.log(result); // (1) 출력 안 됨
        ```
        
        - 밑의 `console.log(result);` 가 먼저 실행되어 result가 출력되지 않는 모습
        - JavaScript는 함수 실행 순서를 보장하지 않음
            - 실행 순서를 보장하기 위해 promise 패턴 등장
- promise 패턴
    - 비동기식 코드를 동기식으로 바꿀 수 있다
        
        ```jsx
        result = "";
        $.get('msg.json', {})
        .done(function(data) {
          result = data;
          console.log(result);
        })
        .done(function(data) {
          result = data;
          console.log(result);
        })
        .fail(function(data) {
          console.log("오류" + data);
        })
        ```