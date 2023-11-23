import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import reportWebVitals from './reportWebVitals';
import { BrowserRouter, Route, Routes } from 'react-router-dom';

function Home() {
  return (
    <div>
      <h2>HOME</h2>
      Home ...
    </div>
  );
}

function Topics() {
  return (
    <div>
      <h2>TOPICS</h2>
      Topics ...
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
        <li><a href="/">Home</a></li>
        <li><a href="/topics">Topics</a></li>
        <li><a href="/contact">Home</a></li>
      </ul>
      <Routes>
        <Route path="/" element={<Home / >}/>
        <Route path="/topics" element={<Topics / >}/>
        <Route path="/contact" element={<Contact / >}/>
        <Route path="/*" element={'Not Found'}/>
      </Routes>
    </div>
  );
}

ReactDOM.createRoot(document.getElementById('root')).render(<BrowserRouter><App /></BrowserRouter>);
// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
