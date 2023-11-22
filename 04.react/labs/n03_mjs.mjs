// default

import a1 from "#labs/esm/esm01.mjs";
console.log(a1);

import a2 from "#labs/esm/esm02.mjs";
a2();

import a3 from "#labs/esm/esm03.mjs";
console.log(a3.a);
a3.fnA();

console.log("======");

// named
import * as mA from "#labs/esm/esm04.mjs";
console.log(mA.a);
mA.fnA();

// 객체 구조 분해 할당 -> 제일 많이 쓰는 방법
import { a as a_1, fnA as fnA } from "#labs/esm/esm04.mjs";
console.log(a_1);
fnA();

console.log("======");

import { m_a, m_fnA, m_a2 } from "#labs/esm/esm05.mjs"; // if문 사용 불가
console.log(m_a);
m_fnA();

import * as mB from "#labs/esm/esm05.mjs";
console.log(mB.m_a);
mB.m_fnA();