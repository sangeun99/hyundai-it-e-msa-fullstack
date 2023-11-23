import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import reportWebVitals from './reportWebVitals';
import { HashRouter, Route, Routes, NavLink, useParams } from 'react-router-dom';

function Home() {
  return (
    <div>
      <h2>HOME</h2>
      Home ...
    </div>
  );
}

var contents = [
  { id: 1, title: 'HTML', description: 'HTML is ...' },
  { id: 2, title: 'CSS', description: 'CSS is ...' },
  { id: 3, title: 'React', description: 'React is ...' },
]

function Topic() {
  var params = useParams();
  var topic_id = params.topic_id;
  var selected_topic = {
    title: 'Sorry',
    description: 'Not Found'
  };
  for (var i = 0; i < contents.length; i++) {
    if (contents[i].id === Number(topic_id)) {
      selected_topic = contents[i];
      break;
    }
  }
  return (
    <div>
      <h3>{selected_topic.title}</h3>
      {selected_topic.description}
    </div>
  )
}

function Topics() {
  var lis = [];
  for (var i = 0; i < contents.length; i++) {
    lis.push(
      <li key={contents[i].id}><NavLink to={"/topics/" + contents[i].id}>{contents[i].title}</NavLink></li>
    )
  }
  return (
    <div>
      <h2>TOPICS</h2>
      <ul>
        {lis}
      </ul>
      <Routes>
        <Route path="/:topic_id" element={<Topic/>}/>
      </Routes>
    </div>
  );
}

function Contact() {
  return (
    <div>
      <h2>CONTACT</h2>
      Contact ...
    </div>
  );
}

function App() {
  return (
    <div>
      <h1>Hello React Router DOM</h1>
      <ul>
        <li><NavLink to="/">Home</NavLink></li>
        <li><NavLink to="/topics">Topics</NavLink></li>
        <li><NavLink to="/contact">Contact</NavLink></li>
      </ul>
      <Routes>
        <Route path="/" element={<Home / >}/>
        <Route path="/topics/*" element={<Topics / >}/>
        <Route path="/contact" element={<Contact / >}/>
        <Route path="/*" element={'Not Found'}/>
      </Routes>
    </div>
  );
}

ReactDOM.createRoot(document.getElementById('root')).render(<HashRouter><App /></HashRouter>);
// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
