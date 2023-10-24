## 2장. 자료형

- 기본자료형 primitive data type
    - 8가지
        - 정수형: byte, short, int, long
        - 실수형: float, double
        - 문자형: char
        - 논리형: boolean (1bit지만 메모리에서 1byte를 사용. 메모리가 byte단위로 할당 가능함. 7bit는 놀고 있음)
    - boxed primitives
    - wrapper class?
- 참조자료형 reference data type
    - 어떤 주소에서 다른 주소로 data type을 읽어냄
    - array, interface, class, enum, …

- 0이 양수로 처리되기에 양수 범위가 하나 적음
- 자바에서는 36진법까지 지원함 (10진법 + 알파벳 26자)

### byte 타입

```jsx
byte b2 = 128;
System.out.println(b2);
```

>> Type mismatch: cannot convert from int to byte

### int 타입

```jsx
int i = 2147483647 + 1;
System.out.println(i);
```

>> -2147483648

### long 타입

```jsx
long l1 = 2147483648L;
System.out.println(l1);
```

long l1 = 2147483648; 라고 정의하면 오류가 남

long 타입이라고 명시해줘야 함

### char 타입

char 타입은 홑따옴표를 사용해줘야 함

### float 타입

```jsx
float p2 = 3.1415926535f;
System.out.println(p2);
```

실수타입은 기본이 double

정수타입은 기본이 int

float 정의 시 f 명시

3.1415927 → 소수점 7자리부터 근사치가 나옴

소수점 표현 시 조심해야 함.. mol이나 달러 처리 시..

정밀하게 저장해야 한다면 BigDecimal 같은 클래스를 이용해야 함

```jsx
BigDecimal bd1 = new BigDecimal("2");
BigDecimal bd2 = new BigDecimal("1.1");
System.out.println(bd1.subtract(bd2));
```

문자열로 선언해야 제대로 된 값으로 연산됨

### 변수명

- 변수 이름 지을 때 첫 두 글자를 대문자로 짓는 것은 지양
