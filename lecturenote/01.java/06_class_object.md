## 6장. 클래스와 객체

### 메소드 오버로딩

```java
private static void print(int i) {
	// TODO Auto-generated method stub
	System.out.println(i);
}

private static void print(int i, int j) {
	// TODO Auto-generated method stub
	System.out.println(i + ", " + j);
}
```

- 메소드 이름은 같은데 전달되는 argument가 다른 경우

```java
private static void print(int... i) {
}
```

- 가변형으로 처리
    - int가 배열 형태로 처리
    

- 우클릭 [Run As] → [Run Configurations]를 통해 프로그램 실행 시 메인 메서드 arguments 로 넘길 값을 설정해줄 수 있음

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/eab2dbeb-f52c-4dec-808a-e6db090486e2)


- 메서드를 사용하기 위해서는 클래스 인스턴스를 생성해주어야 함.

```java
A a = new A();
a.print();
```

### 클래스

- Class: 형틀, 설계도
- Object: 제품. 메모리에 만들어진 실체
- Instance: 제품. 메모리에 만들어진 실체, 클래스와의 관계, 오브젝트의 타입강조를 위함

### 객체지향 프로그래밍의 특징

- 캡슐화 Encapsulation
    - 내부를 감추고 기능을 사용하는 것
- 상속 Inheritance
    - extends하면 Point3D에 아무것도 없어도 기존에 Point2D에 있던 메서드 모두 사용 가능
    - 메소드 오버라이딩 : 기존에 상속받은 메서드를 재정의하여 사용
- 다형성 Polymorphysm
    - upcasting
    - downcasting

필드(멤버변수)에 접근하기 위해 this를 이용

`alt + shift + s → generate getter and setter` : getter와 setter 세팅

### Upcasting

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/367b44ba-9fcb-4f5a-af7d-2e678bd3bd4a)

```java
public class PointTest {
	public static void main(String[] args) {
		Point2D pt = new Point3D(); // upcasting
		pt.x = 100;
		pt.y = 200;
		// pt.z = 300; // 에러
		System.out.println(pt.x);
		System.out.println(pt.y);
		// System.out.println(pt.z); // 에러
		Point3D pt2 = (Point3D)pt; // downcasting
	}
}
```

- pt는 Point2D 타입이기에 z를 찾아가지 못 함
- child 타입의 인스턴스를 superclass의 인스턴스로 변환 시 자동 형변환(묵시적 형변환)
    - 단, 새롭게 만든 field나 메소드 이용 불가능
- downcasting시 강제 형변환을 해야함

```java
public class AnimalTest {	
	public static void main(String[] args) {
		Animal a = new Bird();
		System.out.println(a.toString());
		
		Bird b = (Bird) a;
		System.out.println(b.toString());
		
		// Condor c = (Condor) b; // 에러
		// System.out.println(c.toString()); // 에
	}
}
```

- 원래 실체보다 downcasting 할 수는 없음
- Bird가 Condor인지는 알 수가 없지???

```java
public class AnimalTest {	
	public static void main(String[] args) {
		Animal a = new Condor();
		System.out.println(a);
		
		Bird b = (Bird) a;
		System.out.println(b);
		
		Condor c = null;
		if (b instanceof Condor) {
			c = (Condor) b;
			System.out.println(c);
		}
		else {
			System.out.println("Downcasting 불가");
		}
		
		if (c instanceof BlackVulture) {
			BlackVulture d = (BlackVulture) c;
			System.out.println(d);
		}
		else {
			System.out.println("Downcasting 불가");
		}
	}
}
```

- instanceof를 통해 확인한 후 출력하도록 설정할 수도 있음