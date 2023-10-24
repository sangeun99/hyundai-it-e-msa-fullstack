## 7장. 클래스 내부 구성요소

### 생성자

- 객체를 생성하는 역할
- 최초에 수행됨
    - 생성자 안에서 다른 생성자를 호출할 때는 반드시 최초로 생성자부터 호해야
- 리턴타입이 없고 만드시 클래스명과 동일한 이름으로 지어야 함
- 클래스에 아무런 생성자도 정의하지 않는다면 JVM이 껍데기 생성자(default constructor)를 만듦
    - default constructor: 같은 이름의 생성자. 아무런 파라미터, 구현부가 없음

- 파라미터를 다르게 가지는 생성자 두 개를 셋팅한다 (constructor overloading)

```java
package oop5;

public class Point2D extends Object {
	int x;
	int y;
	
	public Point2D () {
		// System.out.println("Point2D() 수행"); // 에러
		this(1, 2);
		System.out.println("Point2D() 수행");
	}
	
	public Point2D (int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("Point2D(x, y) 수행");
	}
}
```

- 자식클래스가 생성자가 없을 경우 JVM이 부모클래스의 생성자부터 실행함

```java
public Point3D() {
		super();
	}
```