// default
const value = require('#labs/cjs/cjs01.js');
console.log(value);

const fn = require('#labs/cjs/cjs02.js');
fn();

const obj = require('#labs/cjs/cjs03.js');
console.log(obj.a);
obj.fnA();

console.log("======");

// named
const mA = require('#labs/cjs/cjs04.js');
console.log(mA.a);
mA.fnA();

// 객체 구조 분해 할당
const { a, fnA } = require('#labs/cjs/cjs04.js');
console.log(a);
fnA();

console.log("======");

const { m_a, m_fnA } = require('#labs/cjs/cjs05.js');
console.log(m_a);
m_fnA();

console.log("======");

if (value > 0) {
  const a2 = require('#labs/cjs/cjs01.js');
  console.log(a2);
}