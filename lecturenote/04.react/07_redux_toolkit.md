## 07. 리덕스 툴킷

### 리덕스 툴킷(Redux Toolkit)

- 자유도가 높은 리덕스의 특징으로 발생되는 품질 보증과 과도한 다양성 문제와 반복적인 코드(보일러플레이트 코드, BoilerplateCode)를 줄이기 위해 발표된 자동화 도구 모음
- 이점
    - 복잡한 저장소 설정 및 관리가 줄어든다
    - 필요한 패키지가 자동으로 설치되어 복잡한 패키지 의존성 관리를 줄이고, 표준화를 할 수 있다.
    - 불변성 관리 등 다양하고 반복적인 비효율적인 코드를 줄일 수 있다
    - 직접 구현한 코드보다 표준적이고 효과적이며 신뢰할 수 있는 방법으로 실행된다.

### 설치

- `npm install @reduxjs/toolkit`
- `import { configureStore } from '@reduxjs/toolkit’`

### 기능

- configureStore
    - Redux Store를 생성
    - 내부적으로 Redux의 createStore()의 기능을 이용
- createReducer
    - switch 문을 작성하지 않고 간단하게 reducer함수를 생성
- createAction
    - Redux의 Action Creator와 동일한 기능을 제공하는 helper 함수
- createSlice
    - 초기 상태, 액션 타입, 액션 생성 함수, 리듀서를 가진 자바스크립트 함수를 Ducks Pattern을 이용하여 를 리듀서를 생성하는 함수
- createSelector
    - Reselect 라이브러리를 사용하기 쉽도록 re-export한 helper 함수
    - 메모이제이션(Memoization)을 이용하여 값의 변경 없이 리렌더링이 일어날 때 다시 계산하지 않고, 이전에 저장한 값을 반환
- createAsyncThunk
    - createAction의 비동기 버전
    - 리덕스 thunk action creater를 반환