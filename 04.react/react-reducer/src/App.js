import React, { useReducer, useState } from 'react';

function App() {
  const [number, setNumber] = useState(1);
  function countReducer(oldCount, action) {
    if (action.type === 'UP') {
      return oldCount + action.number;
    }
    else if (action.type === 'DOWN') {
      return oldCount - action.number;
    }
    else if (action.type === 'RESET') {
      return 0;
    }
  }

  function changeNumber(event) {
    setNumber(Number(event.target.value));
  }

  const [count, countDispatch] = useReducer(countReducer, 0);
  function down() {
    countDispatch({ type: 'DOWN', number: number }); // 객체로 전달
  }
  function reset() {
    countDispatch({ type: 'RESET', number: number });
  }
  function up() {
    countDispatch({ type: 'UP', number: number });
  }

  return (
    <div>
      <input type="button" value="-" onClick={down}></input>
      <input type="button" value="0" onClick={reset}></input>
      <input type="button" value="+" onClick={up}></input>
      <input type="text" value={number} onChange={changeNumber}></input>
      <span>{count}</span>
    </div>
  );
}

export default App;
