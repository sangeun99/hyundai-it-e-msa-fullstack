## 12. 반응형 웹과 미디어 쿼리

### 반응형 웹

- 다양한 화면 크기에 맞춰 웹을 표시
- 뷰포트
    - 스마트폰 화면에서 실제 내용이 표시되는 영역
    - `<meta name="viewport" content="width=device-width, initial-scale=1">`
    - 단위
        - vw
            - 1vw는 뷰포트 너비의 1%
        - vh
            - 1vh는 뷰포트 높이의 1%
        - vmin
            - 뷰포트의 너비와 높이 중에서 작은 값의 1%
        - vmax
            - 뷰포트의 너비와 높이 중에서 큰 값의 1%

### 미디어 쿼리

- 어떤 미디어를 사용하는가에 따라 사이트의 형태가 바뀌도록 CSS를 작성하는 방법
- `@media [only | not] 미디어 유형 [and 조건] * [and 조건]`
    - only
        - 미디어 쿼리를 지원하지 않는 브라우저에서는 미디어 쿼리 무시
    - not
        - 지정하는 미디어 유형을 제외
    - and
        - 조건 추가
    - 미디어 유형
        - all
        - print
        - screen
        - tv
        - …
- `@media screen and (min-width: 768px) and (max-width: 1439px) { … }`

### 미디어 쿼리 속성

- 웹 문서의 가로 너비와 세로 높이 속성
    - width, height, min-width, min-height, max-width, max-height
- 단말기의 가로 너비와 세로 높이 속성
    - device-width, device-height, min-device-width, min-device-height, max-device-width, max-device-height
- 화면 회전 속성
    - orientation: portrait, orientation: landscape

### 모바일 퍼스트 기법

- 모바일부터 CSS 설계
- 스마트폰
    - 방향까지 고려한다면 min-width 세로: portrait 320px, min-width 가로: landscape 480px
- 태블릿
    - 세로 768px 이상, 가로 1024px 이상
- 데스크탑
    - 화면 크기 1024px 이상

### 미디어 쿼리 적용 방법

- 외부 CSS 파일 연결
    - link 태그
        - `<link rel=”stylesheet” media=”미디어 쿼리 조건” href=”css 파일 경로”>`
    - @import 문
        - `@import url(css 파일 경로) 미디어 쿼리 조건`
- 웹 문서에 직접 정의
    - `<style media=”<조건>” { <스타일 규칙> } </style>`
    - `<style> @media <조건> { <스타일 규칙> } </style>`

### 그리드 레이아웃

- 웹사이트를 여러 개의 칼럼으로 나누고 웹 요소를 화면에 맞게 배치
- 방법
    - 플릭스 박스 레이아웃
    - CSS 그리드 레이아웃

### 플렉스 박스 레이아웃

- display
    - flex
    - inline-flex
- flex-flow
    - flex-direction
        - row | row-reverse | column | column-reverse
    - flex-wrap
        - nowrap | wrap | wrap-reverse
- justify-content
    - 주축 정렬 방법 지정
- align-items
    - 교차축 정렬 방법 지정
- align-self
    - 특정 항목만 정렬 방법을 지정
- align-content
    - 여러 줄일 때 교차축 정렬 방법을 지정
- 항상 중앙에 표시하는 방법
    
    ```css
    body {
      background: url('images/bg5.jpg') no-repeat left top fixed;
      background-size: cover;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }
    ```
    

### CSS 그리드 레이아웃

- display
    - grid
    - inline-grid
- grid-template-columns
    - 칼럼의 개수 지정
    - `grid-template-column: 200px 200px 200px;`
- grid-template-rows
    - 줄의 개수 지정
- grid-column-gap, grid-row-gap, grid-gap

### 그리드 라인을 이용해 그리드 항목 배치

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/14ba51ec-1605-43a6-829b-e7a6d2668af9)


- grid-column-start, grid-column-end를 이용해 칼럼 시작과 마지막의 라인 번호를 지정할 수 있음
- grid-column을 이용해 칼럼 시작 번호와 끝 번호를 지정할 수 있음
    - `grid-column: 1/4;`
- grid-row-start, grid-row-end를 이용해 줄 시작과 마지막의 라인 번호를 지정할 수 있음
- grid-row을 이용해 줄 시작 번호와 끝 번호를 지정할 수 있음

### 템플릿 영역을 만들어 배치하기

- 템플릿 영역의 이름을 지정
    - `grid-area: box1;`
- 템플릿 컨테이너에서 템플릿 그리드 만들기
    
    ```css
    #wrapper {
      width: 700px;
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      grid-template-rows: repeat(3, 100px);
      grid-template-areas: 
        "box1 box1 box1"
        "box2 box3 box3"
        "box2 . box4";
    }
    ```
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/2e3ffae5-0d9d-4edd-8919-40d1ffedacdf)


### 함수 및 단위

- fr단위
    - 상대적인 크기 지정 가능
- repeat() 함수
    - 1fr 1fr 1fr → repeat(3, 1fr);
- minmax() 함수
    - 최솟값과 최댓값 지정
    - `minmax(100px, auto);`
- auto-fill
    - 칼럼의 최소 너비만 표시하고 남은 공간을 그대로 둠
- auto-fit
    - 화면이 넓을 때에는 꽉 채움