## 06. react-redux

### 리덕스 사용 없이 useState를 사용한 예시

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/f19e7a8a-82c7-4316-b646-540326933fed)

- Right3에 있는 + 버튼으로 Root부터 Left3까지 존재하는 요소를 증가시키는 예제
    - Right3에서 props.onIncrease()를 이용해 props를 연쇄적으로 호출
    - 코드가 매우 복잡해짐

### 리덕스 이용하기

- `npm install redux react-redux`
- 스토어 생성
    
    ```jsx
    import React, { useState } from "react"; 
    import './style.css';
    import { createStore } from 'redux';
    
    const store = createStore();
    ```
    
- 리듀서 주입
    - 리듀서는 스토어에 있는 스테이트를 어떻게 바꿀 것인지 결정
    - 파라미터
        - 현재의 값
        - 어떻게 바꿀 것인지에 대한 요청
    - 리턴
        - 새로운 값
        - 각각의 스테이트의 변화를 불변하게 유지해야 함
            - 과거의 스테이트를 복제하여 복제본을 만듦
                
                ```jsx
                function reducer(currentState, action) {
                  if (currentState === undefined) {
                    return {
                      number: 1,
                    }
                  }
                  const newState = { ...currentState };
                  return newState;
                }
                const store = createStore(reducer);
                ```
                
- Provider, useSelector, useDispatch, connect
    - Provider
        - 어떤 컴포넌트들에 제공할 것인지 울타리를 정하는 역할
    - useSelector
        - number라는 값을 표시할 때 사용
        - 함수를 인자로 받음
            
            ```jsx
            function Left3(props) {
              const number = useSelector((state) => state.number);
              return (
                <div>
                  <h1>Left3 : { number }</h1>
                </div>
              )
            }
            ```
            
    - useDispatch
        - onClick시 useDispatch를 이용해 액션을 전달
            
            ```jsx
            function Right3(props) {
              const dispatch = useDispatch();
              return (
                <div>
                  <h1>Right3</h1>
                  <input type="button" value="+" onClick={() => { dispatch({ type: 'PLUS' }) }}></input>
                </div>
              )
            }
            ```
            
        - reducer에서 action으로 인식 가능
            
            ```jsx
            function reducer(currentState, action) {
              if (currentState === undefined) {
                return {
                  number: 1,
                }
              }
              const newState = { ...currentState };
              if (action.type === 'PLUS') {
                newState.number++;
              }
              return newState;
            }
            ```
            
- 리덕스 이용 시 부모가 모두 리렌더링되지 않고 Left3 부분만 리렌더링 됨

### 리덕스(Redux)

- Flux 디자인 패턴을 응용한 App 전역 상태(State)관리 자바스크립트 라이브러리
    - Flux의 Dispatcher 내부적으로 이용
- Context API가 제공되기 이전부터 사용됨
- 다양한 리듀서(Reducer)가 업데이트를 진행하기 전에 추가 작업을 할 수 있는 리덕스 미들웨어(Redux Middleware)를 이용힐 수 있음
- 3가치 원칙
    - Single source of truth
    - State is read-only
    - Changes are made with pure functions

### Flux Pattern

- MVC 패턴의 문제점인 데이터가 Controller 집중하여 관리가 힘들다는 문제에 대안
- 데이터를 한 방향으로 전달되게 하여 복잡성을 줄이는 디자인 패턴
- useReducer의 상태관리의 기본 패턴

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/2600b8d1-4dac-4d03-b2e7-ff99ecb06f28)

### 리덕스 상태 흐름

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/4847e4b3-2b0e-447e-86d6-192a285f54cd)


### 구성 요소

- 스토어(Store)
    - Redux 상태를 관리하는 저장 공간
- 액션(Action)
    - 이전 상태를 갱신하기 위한 상태 정보를 가짐
- 리듀서(Reducer)
    - 리듀서로 전달된 현재 State와 Action을 기반으로 새로운 State를 생성하여 반환