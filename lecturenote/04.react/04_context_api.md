## 04. Context API

### 리액트 컨텍스트

- 컴포넌트 전체에서 데이터를 전달할 수 있도록 함
    - 부모 자식을 기준으로 상태 전달하는 props의 한계 극복
    - Props Drilling
        - props는 부모 자식의 단계가 깊어질수록 경로 관리가 복잡해짐
        - props에 의존성이 생김
        - 수정 시 연결된 모든 props 수정 필요함
- 기능
    - createContext, Provider(Content 제공자), Consumer(구독자)

### Context API

- React.createContext
    - Context 객체를 생성하여 반환
    - 필요할 경우 하나 이상 생성
    - defaultValue
        - 컴포넌트가 상위 경로에서 context를 제공하는 provider를 찾지 못하는 경우 사용
        - 한 번 설정되면 변경되지 않음
    - context 객체의 데이터는 스스로 변경 불가
- Provider Component
    - 지정된 Context의 value props 값을 하위 자손 컴포넌트에게 전달하는 구독 서비스를 제공
    - 자손 컴포넌트의 수는 제한이 없음
    - context의 변화가 있으면 구독 컴포넌트에게 전달함
    - Context별 Provider 중첩을 허용
        - 동일 Provider가 중첩된 경우 consumer 컴포넌트에서 가장 가까운 Provider value 값이 우선
    - Provider 의 value props 값이 변경될 때마다 구독 중인 컴포넌트들은 re-render
        - 잦은 value 값 변경은 빈번한 re-render를 발생
- Consumer Component
    - context 변화를 구독하는 컴포넌트
    - Consumer 컴포넌트는 내에 content는 함수를 이용하여 구현
    - 최근에는 useContext hook를 이용하여 구독

### Context 만들기

```jsx
import React, { createContext, useContext } from 'react';
import './style.css';

const themeDefault = { border: '10px solid green'};
const themeContext = createContext(themeDefault);
```

- themeDefault가 새로 생성한 컨텍스트의 기본값
- 이후 `useContext(themeContext)`로 설정된 컨텍스트 값을 사용
    
    ```jsx
    const theme = useContext(themeContext);
      return (
        <div style={theme}>
          <h1>Sub1</h1>
          <Sub2 />
        </div>
      )
    ```
    

### Provider 이용하기

- 컨텍스트를 바꿔주는 역할
- `<themeContext.Provider>`가 감싼 컴포넌트 안에서 `useContext`의 반환값이 `Provider value`와 같아짐
    
    ```jsx
    function Sub1() {
      const theme = useContext(themeContext);
      return (
        <themeContext.Provider value={{ border: '10px solid green' }}>
          <div style={theme}>
            <h1>Sub1</h1>
            <Sub2 />
          </div>
        </themeContext.Provider>
      )
    }
    ```
    
- useContext는 자신의 부모 중에서 가장 먼저 등장하는 Provider의 value를 가짐