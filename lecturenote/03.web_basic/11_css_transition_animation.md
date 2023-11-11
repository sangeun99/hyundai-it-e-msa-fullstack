## 11. 트랜지션과 애니메이션

### 변형

- `transform: 함수`
- 2차원 변형, 3차원 변형
- translate()
    - 웹 요소를 이동
    - 이동할 거리를 지정하면 지정한 크기만큼 이동
    - `{ transform: translateX(50px); }`
- scale()
    - 확대, 축소
    - `{ transform: scaleX(2); }`
- rotate()
    - 회전
    - `{ transform: rotate(40deg); }`
        - 오른쪽으로 40도 회전
    - perspective 속성
        - 3차원 변경
        - 원래 있던 위치에서 사용자가 있는 쪽으로 얼마나 이동하는지 픽셀 크기로 표현
            
            ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/e9e2ce04-3c8c-4e77-a34f-f06eec9d1660/4b75c320-0754-467f-8c64-648fe9d5bc38/Untitled.png)
            
- skew()
    - 요소를 비틀어 왜곡
    - `{ transform: skew(-25deg, -15deg };`

### 트랜지션

- 스타일 속성이 시간에 따라 바뀌는 것
- transition
    - transition-property
        - all, none, <속성 이름>
        - 트랜지션 대상을 지정
        - `transition-property: widht, height;`
    - transition-duration
    - transition-timing-function
        - linear | ease | ease-in | ease-out | ease-in-out | cubic-bezier(n, n, n, n)
    - transition-delay
    - 시간값이 두 개 있다면 앞에 오는 시간값이 transition-duration, 뒤의 값이 transition-delay 속성

### 애니메이션

- animation
    - @keyframes
        - 키프레임: 애니메이션 중간에 스타일이 바뀌는 지점
    - animation-name
    - animation-duration
    - animation-direction
        - normal | reverse | alternate | alternate-reverse
    - animation-iteration-count
        - <숫자> | infinete
    - animation-timing-function

```css
#box1 {
	background-color: #4cff00;
	border: 1px solid transparent;
	animation-name: shape;  /* 애니메이션 지정 */ 
	animation-duration: 3s;  /* 애니메이션 실행 시간 */
  animation-iteration-count: 5;
}
#box2 {
	background-color: #8f06b0;
	border: 1px solid transparent;
	animation-name: rotate;  /* 애니메이션 지정 */
	animation-duration: 3s;  /* 애니메이션 실행 시간 */
  animation-iteration-count: 5;
}

@keyframes shape { /* shape 애니메이션 정의 */
	from {
		border: 1px solid transparent;  /* 1px짜리 투명한 테두리 */
	}
	to {
		border: 1px solid #000;  /* 검정색 테두리 */
		border-radius: 50%;  /* 테두리를 둥글게 */
	}
}

@keyframes rotate {  /* rotate 애니메이션 정의 */
	from {
		transform:rotate(0deg)  /* 시작은 0도에서 */
	}
	to {
		transform: rotate(45deg);  /* 45도까지 회전 */
	}
}
```