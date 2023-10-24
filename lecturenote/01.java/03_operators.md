### lombok 설치 후 패치

이클립스를 종료한 상태에서 lombok 실행

```jsx
PS C:\dev\eclipse> java -jar lombok.jar
```

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/62cfb9b8-239f-4aa0-b8dc-0ed28c4325ec)

프로젝트 파일에서 자바 빌드 패스 설정

```java
package basic;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class TestClass {
	String name;
}
```

filter and customizer에서 java output folder 설정을 풀어주면 bin 폴더도 함께 보임

프로젝트 폴더에서 properties로 lombok 경로 설정해주기

### decompiler 설치

Help → Eclipse Marketplace 마켓플레이스 접속 후 디컴파일러 설치

```jsx
package basic;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class TestClass {
	String name;
}
```

lombok이 제대로 적용되었다면 클래스가 제대로 생성되었다면

- bin/*.class에 클래스가 알아서 생성됨

## 3장. 연산자

### 산술 연산 > 관계 연산 > 논리 연산

```jsx
package basic;

public class OpTest1 {
	public static void main(String[] args) {
		int a = 7, b = 4;
		System.out.println(a + "+" + b + "=" + (a + b));
		System.out.println(a + "-" + b + "=" + (a - b));
		System.out.println(a + "*" + b + "=" + (a * b));
		System.out.println(a + "/" + b + "=" + (a / b));
		System.out.println(a + "%" + b + "=" + (a % b));
	}
}
```

- 정수 나누기 정수는 정수가 나옴
- 정밀한 결과를 얻고자하면 a 나 b 를 double로 형변환해준다
- i++가 i += 1보다 빠르다는 이야기가 있었지만 JVM 성능 개선으로 해결되었음
- 전위증가(전위연산), 후위증가(후위연산)

- 나머지연산이 부호를 따라감
- n % 2 == 1로 조건을 잡으면 오류가 발생할 수 있음
- 음수이면서 홀수는 n % 2 값이 -1

### 형변환

- 묵시적 형변환 (자동 형변환)
    - 필드 폭이 좁은 곳에서 넓은 곳으로는 무조건 자동 형변환
    - int(4) → float(4), long(8) → float(4) 도 자동 형변환이 된다
        - 유실될 데이터를 주의해야 함
- 명시적 형변환 (강제 형변환)

```java
int p = (int) 3.14; // 소수점 아래 부분은 반올림이 아닌 버림된다
System.out.println(p);
```

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/6c64c4ae-057b-4353-b5b2-a7f93e0dee94)

### 난수 생성하기

```java
// 1 ~ 6 사이의 난수 발생
int dice = (int)(Math.random() * 6) + 1; // 0.0 ~ 1.0
System.out.println(dice);
```

- Math.random()은 0.0~1.0 사이의 한 값을 가진다
- 1부터 6까지 나오게 하려면 6을 곱한 후 int로 형변환하여 소수점 버리기 (6은 나올 수 없음)
- 후에 1을 더 0-5에서 1-6으로 맞춘다

```java
// 4 ~ 15 사이의 난수 발생
for (int i = 0; i < 100; i++) {
	System.out.print((int)(Math.random() * 12) + 4 + " ");
}
System.out.println();

for (int i = 0; i < 100; i++) {
	System.out.print(((int)(Math.random() * 18) + 6) * 100 + " ");
}
```