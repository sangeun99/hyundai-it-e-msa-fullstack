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
        - `App.js`가 `App.css`를 import

### React CDN을 이용해 환경 만들기

- [소스코드](https://github.com/sangeun99/hyundai-it-e-java-fullstack/tree/master/04.react/react.html)
- 루트 하나를 만들어 하나의 DOM Tree 생성
- React 구조 이해하기
    - App.js의 App() 리턴부는 jsx로 리액트의 element가 됨
        - XML이기에 대소문자를 구분
        - {} 표현식을 통해 JS 리소스 사용 가능