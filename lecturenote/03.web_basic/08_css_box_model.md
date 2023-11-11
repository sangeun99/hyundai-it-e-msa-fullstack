## 08. 레이아웃을 구성하는 CSS 박스 모델

### 블록 라벨 요소와 인라인 레벨 요소

- 블록 라벨 요소
    - 혼자 한 줄을 차지하는 요소
    - &lt;h1>, &lt;div>, &lt;p> 등
- 인라인 레벨 요소
    - 한 줄을 차지하지 않고 콘텐츠만큼만 영역을 차지하는 요소
    - &lt;span>, &lt;img>, &lt;strong> 등

### 박스 모델

- 블록 레벨 요소는 모두 박스 형태
- 콘텐츠 영역, 패딩, 테두리, 마진으로 구성
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/3dd4b828-8d7b-4efe-9b5e-efef5014ec1a)

    
- top → right → bottom → left
- width, height
- box-sizing
    - **border-box** | content-box
- box-shadow

### 테두리 스타일을 지정하는 속성

- border
    - border-style
    - border-color
    - border-width
        - &lt;크기> | thin | medium | thick
- border-radius
    - &lt;크기> | &lt;백분율>
    - 너비와 높이를 같게 만든 후 border-radius의 반지름값을 50%으로 지정하면 원이 됨

### 여백을 조절하는 속성

- margin
    - 요소 주변의 여백을 설정
    - margin을 이용하여 가운데 정렬하기
        - `margin: 0 auto;`
        - 좌우 마진을 자동으로 계산해 가운데 정렬하기
    - margin 중첩
        - 요소를 세로로 배치할 때 마진과 마진이 만나면 마진값이 큰 쪽으로 겹쳐짐
        - 오른쪽 마진과 왼쪽 마진이 만날 경우 중첩 안 됨
- padding
    - 콘텐츠와 테두리 사이의 여백 설정

### 웹 문서의 레이아웃 만들기

- display 속성
    - block
    - inline
    - inline-block
    - none
- float 속성
    - 웹 요소를 문서 위에 떠 있게 만듭니다
    - left
    - right
    - none
    - clear 속성 해게
        - float 속성 해제

### 웹 요소의 위치 지정하기

- position 속성
    - 배치 방법을 지정
    - static
        - 기본값
    - relative
        - 위칫값을 지정할 수 있음
    - absolute
        - relative 값을 사용한 상위 요소를 기준으로 배치
    - fixed
        - 브라우저 창을 기준으로 배치