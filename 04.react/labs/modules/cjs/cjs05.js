const m_a = 'A';

function m_fnA() {
  console.log('m_fnA');
}

let a = { m_a, m_fnA, m_a2: m_a };
module.exports = a;