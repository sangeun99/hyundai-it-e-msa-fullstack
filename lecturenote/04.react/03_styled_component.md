## 03. 스타일드 컴포넌트

### 스타일드 컴포넌트

- 리액트 컴포넌트에 CSS를 적용한 뒤 리액트 요소를 반환
- 리액트 컴포넌트 별로 재사용 가능한 자체 스타일을 만들 수 있음
- 스타일 속성을 자바스크립트 스타일이 아닌 CSS 스타일로 적용할 수 있음
- 내부적으로 class가 자동으로 생성되어 적용되므로 스타일명으로 간단히 관리할 수 있음
- 전체는 CSS로, 컴포넌트별로는 styled component로 설정하여 이용

```jsx
const HelloStyle = styled.div`
	color: 'blue',
	background-color: 'yellow'
`

<HelloStyle>Hello World!!!</HelloStyle>
```

### 설치 및 설정

- `npm install styled-components`
- `import styled from 'styled-components';`

### 이미 존재하는 컴포넌트를 새로운 컴포넌트로 만들기

```jsx
const SimpleButton = styled.button`
	color: white;
	background-color: green;
`

const LargeButton = styled(SimpleButton)`
	font-size: 50px;
`
```

- 스타일드 컴포넌트를 사용하지 않고 일반적인 방법으로 만든 래핑할 수 없음
    - props로 전달된 컴포넌트를 전달해야 함
        
        ```jsx
        const ReactButton = (props) => {
        	return <button className={props.className}>{props.children}</button>
        ```
        

### props을 이용한 동적 적용

```jsx
const PrimaryButton = styled.button`
  color: ${function(props) {
    console.log(props)
    if (props.primary) {
      return 'white';
    } else {
      return 'black';
    }
  }};
  background-color: ${ props => props.primary ? 'blue': 'gray'}
`
```