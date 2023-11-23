## 01. 리액트 기초

### React.js

- 개발 전 스토리보드를 이용해 화면 구성을 꼭 먼저 설계할 것
- 이후 리액트를 쓸지를 고민
- 반복되는 작업이 너무 많다면 리액트를 사용 결정
- 리액트 컴포넌트를 이용해 재사용할 것

### React.js 개요

- 리액트
    - 페이스북 주도로 개발된 라이브러리(MIT)
        - 프레임워크 vs 라이브러리
            - 프레임워크: 상태 흐름의 주도권을 프레임워크가 가짐
            - 라이브러리: 상태 흐름의 주도권을 프로그래머가 가지고 필요할 때 라이브러리를 끌어 씀
    - 컴포넌트를 만드는 데까지 리액트를 이용, 관련되지 않은 기능은 외부 라이브러리 (Axios, Redux 등)을 이용
- 특징
    - **컴포넌트 기반으로 코드의 재활용성**을 높임
    - **가상돔 (Virtual DOM) 을 제공**하여 효율적인 DOM 관리와 화면 처리를 지원
        - HTML 문서의 요소를 기반으로 DOM 생성
        - DOM의 요소 변경 시마다 렌더링 실행되는 문제
        - 가상돔은 메모리에 DOM구조를 만들고 요소 변경이 발생되면 가상 돔 변경.
        - 가상돔 변경을 모아 한번에 DOM을 적용해 렌더링 부하를 줄이고 성능 향상
        - 브라우저에 대한 의존성이 없음
    - JSX를 이용하여 DOM Tree를 생성
    - 모델과 뷰 사이에 단방향 데이터 바인딩을 제공
        - 단방향: 모델→뷰, watcher 하나
        - 양방향: 모델→뷰, 뷰→모델, watcher 두 개

### 실습 환경 구축

- VS Code 설치
    - 확장 프로그램
        - `Prettier`, `Live Server`, `ESLint`, `Code Runner`, `Auto Import` 설치
        - `ES7+ React/Redux/React-Native snippets` 설치
    - setting.json 설정
        
        ```json
        {
          "terminal.integrated.env.windows": {
              "NODEJS_HOME": "D:\\labs_lect\\labs_js\\nodejs\\",
              "NODE_PATH": "D:\\labs_lect\\labs_js\\node_modules\\",
              "PATH": "D:\\labs_lect\\labs_js\\nodejs;${env:PATH};"
          },
          "terminal.integrated.defaultProfile.windows": "Command Prompt",
          "code-runner.runInTerminal": true,
          "liveServer.settings.host": "localhost",
          "liveServer.settings.port": 80,
          "editor.wordWrap": "on",
          "editor.formatOnSave": true,
          "editor.defaultFormatter": "esbenp.prettier-vscode",
          "prettier.printWidth": 120,
          "prettier.useTabs": false,
          "prettier.tabWidth": 2,
          "prettier.trailingComma": "all",
          "prettier.singleQuote": true,
          "prettier.semi": true,
          "prettier.bracketSpacing": true
        }
        ```
        
- node.js 설치
    - node.js
        - *.class를 실행하는 실행기: JVM
        - *.html을 실행하는 실행기: browser
        - *.js를 실행하는 실행기가 node.js
    - 이벤트기반, 논블로킹 I/O (비동기) 방식 환경을 제공
    - npm(Node Package Manager)를 제공하여 다양한 JavaScript 패키지의 의존성 관리 및 설치 및 관리
        - 모듈의 모임이 패키지. 패키지의 모임이 라이브러리.
- 바벨(Babel) 설치
    - 트랜스파일러: 최신 버전의 코드(ES6, JSX 등)을 이전 버전 호환 가능한 코드로 변환
- 웹팩(Webpack)
    - ~= Maven
    - CSS와 이미지 등을 묶어서 배포하도록 도와줌
- 리액트 설정
    - npm 업데이트
        - `npm install -g npm`
            - 모듈 관리 시 npm 이용
    - 모듈 실행
        - `npx create-react-app <프로젝트명>`
            - 실행 시 npx 이용
            - React, Babel, Webpack, ESLint 등의 모듈들이 자동으로 설치되고 환경 설정이 자동으로 설정됨
    - 프로젝트 실행
        - `npm start`
    - 프로젝트 종료
        - terminal에 `ctrl+c`
    - 프로젝트 삭제
        - 프로젝트명 폴더를 삭제
    - 폴더 구조 확인
        - `public`
            - 배포 시 사용되는 폴더
            - index.html 같은 정적 파일이 포함되는 곳
        - `src`
            - 리액트에서 사용하는 다양한 것들이 포함됨
        - `package.json`
            - 각종 dependency를 저장하고 npm install시 이를 바탕으로 설치됨
    - 실행과정
        - `index.js`와 `index.html`는 바꾸지 않고 사용 (물론 바꾸고 webpack 설정을 바꿔줄 수도 있음)
        - `index.js`와 `index.html` 이 묶여서 컴파일됨
        - `index.js`는 `App.js`를 호출
            - `index.js`가 진입점
            - 진입점에 대한 정보와 html 문서 정보는 webpack의 환경 파일 에 설정됨
                - `node_modules/react-scripts/config/paths.js`
        - `App.js`가 `App.css`를 import

### React CDN을 이용해 환경 만들기

- [소스코드](https://github.com/sangeun99/hyundai-it-e-java-fullstack/tree/master/04.react/react.html)
- 루트 하나를 만들어 하나의 DOM Tree 생성
- React 구조 이해하기
    - App.js의 App() 리턴부는 jsx로 리액트의 element가 됨
        - XML이기에 대소문자를 구분
        - {} 표현식을 통해 JS 리소스 사용 가능

### src 폴더 구조

- components
    - 재사용 가능한 공통 컴포넌트와 관련 파일
- pages
    - 페이지별로 사용되는 컴포넌트와 관련 파일
- store(context)
    - 상태관리 라이브러리(Redux)와 관련한 코드
- utils
    - 공통 유틸리티
- assets
    - 이미지, 스타일시트, 폰트 등
- services
    - API 등 외부 연동 서비스
- hooks
    - 사용자화 훅 관리

### 설치/실행/배포 명령어

- 설치
    
    ```bash
    npm install -g npm
    ngx create-react-app react-app
    ```
    
- 실행
    
    ```bash
    react-app > npm start
    ```
    
- 배포
    
    ```bash
    react-app > npm run build
    ```
    

### 모듈

- [소스코드](https://github.com/sangeun99/hyundai-it-e-java-fullstack/tree/master/04.react/labs)
- 함수나 코드로 구성된 프로그램의 기능적 단위 (자바스크립트의 경우 파일 단위)
- 모듈 내 함수나 변수는 모듈 스코프가 적용
- export로 지정하지 않는 이상 보호된다
- Node.js는 CommonJS(CJS), ECMAScript(ES) 모듈 사양을 지원함
    - CommonJS가 기본
- 모듈 탐색
    - 파일 경로가 지정된 경우 상대 경로를 탐색
    - Node.js의 코어 모듈인지 확인
    - 코어 모듈이 아닌 경우 node_modules 폴더를 기준으로 탐색
- `package.json` 에 imports 속성으로 별칭 지정해서 사용 가능
    
    ```json
    "imports": {
      "#labs/*": "./modules/*"
    }
    ```
    

### CommonJS Module(CJS Module)

- require 함수 이용
    - id 매개변수로 전달된 모듈명 또는 경로에서 지정된 모듈의 module.exports 객체를 반환
    
    ```jsx
    const 변수명 = require(모듈명);
    const { 속성명1, 속성명2, …, ┄ } = require(모듈명); // 객체 구조 분해 할당
    ```
    
- module.exports 객체
    - 함수, 객체, 값들을 module.exports 에 담아 require 함수에서 반환할 수 있게 gka
    - exports는 module.exports의 단축어
    
    ```jsx
    // default: 내보낼 대상이 하나만 정의된 경우
    module.exports = { ... };
    // named: 내보낼 대상이 여러 개가 정의된 경우
    exports.name = { ... };
    module.exports.name = { ..., ..., ┄ };
    ```
    

### ECMAScript Module(ES Module, ESM)

- 파일 확장자를 '.mjs'로 지정
- 엄격 모드 (use strict)가 기본
- import ~ from 모듈명 문
    
    ```jsx
    import 변수명 from '모듈명';
    import { 속성명1, 속성명2, …, ┄ } from '모듈명'; // 객체 구조 분해 할당
    import * from '모듈명'
    ```
    
- export문
    
    ```jsx
    // default: 내보낼 대상이 하나만 정의된 경우
    export default { ... };
    // named: 내보낼 대상이 여러 개가 정의된 경우
    export { ... };
    export { 대상1 as 별칭1, ... };
    ```
    

### 컴포넌트

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/dbbc89c9-e1bb-4163-9aa2-bf8d1568719d)

- 리액트 애플리케이션의 UI를 구성하는 재사용 가능한 기본 단위
- container / presentational 패턴
    - container: 데이터와 처리에 관련된 자바스크립트 부분
    - presentational: 화면 출력 부분 (JSX)
- atomic 패턴
    - 컴포넌트의 중복을 피하기 위해 작은 단위로 나눔

### React DOM

- 브라우저 DOM 구조를 투영한 React 엘리먼트로 구성된 가상 돔 생성
    
    ```jsx
    const root = ReactDOM.createRoot(document.getElementById('root'));
    root.render(
      <React.StrictMode>
        <App />
      </React.StrictMode>
    );
    ```
    
- 자식 요소 생성을 위해서는 루트 요소가 필요
- React 요소
    - 순수 자바스크립트 객체
    - 상태가 수정되지 않는 불변
    - 수정을 할 경우 새 요소를 생성하여 갱신
- 이전 상태와 비교해 상태가 변경된 React 엘리먼트를 기준으로 브라우저 DOM을 변경

### 함수 컴포넌트

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/52eea016-17f6-4a9a-bedf-749ae3d064ae)

- 클래스 컴포넌트 방법보다 권장됨
- 매개변수를 이용해 데이터를 받고, 일반 객체인 리액트 엘리먼트를 반환
- props
    - 컴포넌트에 사용자가 정의 가능한 속성
    - 값이나 함수 등을 부모 컴포넌트에서 자식 컴포넌트로 단방향으로 전달
    - 불변형 (읽기 전용)
    - { expression } 을 이용하여 props의 값 사용 가능
        
        ```jsx
        function Header(props) {
          console.log('props', props.title)
          return (
            <header>
              <h1><a href="/">{props.title}</a></h1>
            </header>
          )
        }
        ```
        
    - 배열을 이용하여 return할 경우 key가 필요
        - key를 이용해 리액트 요소의 고유 식별자로 이용, 리렌더링에 이용 → 성능 향상
        - key 값은 형제 노드에서만 유일한 값이면 되고 글로벌할 필요 없음
        
        ```jsx
        const topics = props.topics;
        return (
        	<ol>
        		{ topics.map((t) => 
        		<li key={i.id}><a href={'/read/'+t.id}>{t.title}</a></li>) } 
        	</ol>
        )
        ```
        

### 이벤트

- React 컴포넌트에서 선언된 이벤트 핸들러는 이벤트로 처리되지 않고 props로 전달
- 이벤트가 처리되는 DOM 엘리먼트에서 이벤트 핸들러에서 함께 처리
- <Header> 컴포넌트 안에 이벤트 기능 추가하기
    - <Header> 컴포넌트(부모)에 onChangeMode라는 props의 값으로 함수를 전달하기
    - 이 <Header> 컴포넌트 안에서(자식) 링크를 클릭하면 컴포넌트가 함수를 호출하도록 만들기
    - Header 함수 (자식) 의 <a> 태그에 onClick 이벤트를 추가하여 동작을 선언하기
        - `event.preventDefault();` 를 통해 <a> 태그 기본 동작을 막아주기
        - `props.onChangeMode();` 로 props로 전달된 함수를 호출
    
    ```jsx
    function Header(props) {
      console.log('props', props.title)
      return (
        <header>
          <h1><a href="/" onClick={(event) => {
            event.preventDefault();
            props.onChangeMode();
          }}>{props.title}</a></h1>
        </header>
      )
    }
    ```
    
    ```jsx
    function App() {
      return (
        <div>
          <Header title="WEB" onChangeMode={() => {
          alert('Header');
        }}></Header>
          <Article title="Welcome" body="Hello, Web"></Article>
          <Article title="Hi" body="Hello, React"></Article>
        </div>
      );
    }
    ```
    

### state

- 컴포넌트의 상태를 동적으로 관리하기 위해 사용되는 기본 React Hooks 중 하나
- props와 다르게 컴포넌트 내부에서 관리된다. (App())
- useState() Hook을 이용
    
    ```jsx
    const [mode, setMode] = useState('WELCOME'); // 상태의 값, 상태의 값을 변경할 때 사용하는 함수
    const [id, setId] = useState(null);
    ```
    
- setMode(), setId()와 같은 상태값 변경함수로 상태값을 변경
    - 변수로 값을 관리한다면 변수 변경 시마다 리렌더링되는 이슈 발생
    - 그와 다르게 컴포넌트가 비동기적으로 리렌더링 되어 한꺼번에 값이 바뀜
- 부모 → 자식 컴포넌트로 단방향 업데이트가 기본
    - 자식들은 상태 변화가 어떻게 진행되는지 모름
        - 자식들의 코드 안에는 hook에 관련된 내용이 없음
    - 부모가 모든 자식을 state hooks를 이용해 관리
    - (이전) 전역변수로 선언하여 자식이 부모 컴포넌트 것을 사용한다면 양방향 업데이트
    - 자식 컴포넌트에서 이벤트가 발생되면 부모가 전달한 이벤트 핸들러를 이용하여 상태를 변경

### JSX

- JavaScript Syntax Extension, JavaScript XML
- XML 형식으로 React 요소 트리를 생성하는 자바스크립트 확장 표현식
- 웹팩(Webpack)의 번들링 과정에서 바벨에 의해 자바스크립트 코드로 변환됨
- 바벨은 React.createElement()를 호출하여 컴파일
- 문법
    
    ```jsx
    const name = '홍길동';
    const greeting = <h1 className='class' style={style}>{name}</h1>;
    ```
    
    ```jsx
    // const element = React.createElement( ) 과 동일하다.
    const element = (
    	<>
    	<h1>연산결과</h1>
    		<div>{data.a} + {data.b} = {add(data)}! </div>
    		{add(data) >= 10?(<h3>10 이상</h3>) : (<h2>10 미만</h2>)}
    		<h3>{add(data)%2 === 0 && '짝수'}</h3>
    		{/* 단축 평가이용 */}
    		<h3 // undefined는 출력하지 않음
    		>{str}, {str || 'default'}</h3>
    	</>
    );
    ```
    
    - el을 이용한다면 {str} 시 undefined 가 출력되지 않음
    - 단축평가 이용
        - 논리 연산자의 규칙을 이용해 뒤의 불필요한 계산을 생략
        - &&
            - 모두 true일 때 가장 오른쪽 값을 반환
            - 하나라도 false인 경우 앞의 false를 반환
        - ||
            - 가장 왼쪽의 참 값을 반환

### 형 변환

- 기본적으로 javascript 비교연산자 사용 시 == 으로 1 == ‘1’ 문제 없음
- react는 ===가 기본이기에 필요 시 typecasting이 필수
- `event.target.id`로 들어온 id를 확인 시 `Number(event.target.id)`로 typecasting