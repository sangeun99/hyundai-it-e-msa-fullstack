## 05. useReducer

### useReducer

- 리액트가 제공하는 기본 Hook
- useState와 비슷하게 상태관리에 이용
    - useState 처럼 setXXX()에 Callback 함수를 전달하는 방법을 사용하지 않음
    - 단순한 구조의 state 관리를 할 경우 useState 이용을 권장
    - 복잡한 구조의 state를 이용하는 경우에는 reducer함수를 이용할 수 있는 useReducer 사용을 권장
- Dispatch를 이용해 처리방법이 기술된 Reducer를 호출하면서 상태를 전달하여 실행하는 대리자 구조로 운영
- 컴포넌트에서 상태 처리에 관련된 코드를 Reducer를 이용하여 분리할 수 있고, 컴포넌트에서는 상태 값만 전달하면 되어 구조가 단순해 지고, 재활용성이 높아진다.

### 초기화 및 생성

```jsx
const [state, dispatch] = useReducer(reducer, initialArg, init);
```

- reducer
    - 순수 함수로 state와 action을 매개변수로 한다
    - 매개변수로 넘어온 state를 변경한 뒤 반환
- initialArg
    - 초기 상태
    - 만약 init이 지정되지 않으면 initialArg로 초기화됨
- init
    - 초기화를 하는 함수를 지정할 수 있고 선택 사항
    - initalArg를 매개변수로 사용
    - init 함수가 지정 시 init(initialArg)의 결과로 초기화
- state
    - 현재 상태
    - init(initialArg) 또는 initialArg에 의해 결정
- dispatch
    - 실행할 정보를 가지고 있는 action과 state를 reducer에 전달

### useState를 이용한 방법

```jsx
import React, { useState } from 'react';

function App() {
  const [count, setCount] = useState(0);
  function down() {
    setCount(count - 1);
  }

  function reset() {
    setCount(0);
  }

  function up() {
    setCount(count + 1);
  }

  return (
    <div>
      <input type="button" value="-" onClick={down}></input>
      <input type="button" value="0" onClick={reset}></input>
      <input type="button" value="+" onClick={up}></input>
      <span>{count}</span>
    </div>
  );
}

export default App;
```

### useReducer를 이용한 방법

```jsx
import React, { useReducer } from 'react';

function App() {
  function countReducer(oldCount, action) {
    if (action === 'UP') {
      return oldCount + 1;
    }
    else if (action === 'DOWN') {
      return oldCount - 1;
    }
    else if (action === 'RESET') {
      return 0;
    }

  }
  const [count, countDispatch] = useReducer(countReducer, 0);
  function down() {
    countDispatch('DOWN');
  }
  function reset() {
    countDispatch('RESET');
  }
  function up() {
    countDispatch('UP');
  }

  return (
    <div>
      <input type="button" value="-" onClick={down}></input>
      <input type="button" value="0" onClick={reset}></input>
      <input type="button" value="+" onClick={up}></input>
      <span>{count}</span>
    </div>
  );
}

export default App;
```

- state를 사용자가 직접 사용하는 것이 아니라 액션값만 주고 구체적인 처리는 countReducer라는 함수가 독점적으로 처리함

### useEffect

- 리액트가 제공하는 기본 Hook
- 함수형 컴포넌트의 라이프 사이클(Life Cycle)별 트리거(Trigger)로 동작
- 작업을 Side Effect를 이용하여 수행할 수 있게 함
    - Side Effect
        - 리액트에서는 컴포넌트와 외부 사이에 일어나는 비동기적인 작업을 의미
        - 주로 서버 API통신이나 리액트 컴포넌트 DOM 수동 수정 또는 브라우저 API등을 이용할 때 필요
        - 데이터 로딩과 렌더링을 순차적으로 진행하면 데이터 로딩 시간 때문에 렌더링이 지연되는 문제