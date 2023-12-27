import React from "react";
import { createStore } from 'redux';
import { Provider, useSelector, useDispatch } from 'react-redux';

function reducer(state, action) {
  if (action.type === 'up'){
    return {...state, value:state.value + action.step}
  }
  return state;
}
const initialState = {value:0}
const store = createStore(reducer, initialState);

function Counter() {
  const dispatch = useDispatch();
  const count = useSelector(state=>state.value);
  return <div>
    <button onClick={()=>{
      dispatch({type: 'up', step:2});
    }}>+</button> { count }
  </div>
}

function App() {
  return (
    <Provider store={store}>
      <div>
        <Counter></Counter>
      </div>
    </Provider>
  );
}

export default App;
