## 9장. 자바 제어자 1

### 접근 지정자 (Access Modifier)

|  | 클래스 내부 | 패키지 내부 | 상속관계 | 관계없음 |
| --- | --- | --- | --- | --- |
| public | O | O | O | O |
| protected | O | O | O | X |
| default | O | O | X | X |
| private | O | X | X | X |

### static 제어자

- 프로그래밍이 수행될 때 미리 메모리에 올라가있게 된다

### Java 메모리 구조

클래스파일이 클래스로더에 올라온 다음에 클래스 라이브러리가 들어오게 됨

문제: 메모리에 올라온 후에 컴파일을 다시 해야함 → 느림

JVM을 이용해 한 번 만들면 어디서든 사용할 수 있음

→ 소스파일의 크기가 작음

PC레지스터 : JVM이 접근하는 부분 (우리가 직접 다루는 게 아님)

Native 메소드 스택 : Java에서 다루는 부분 (우리가 직접 다루는 게 아님)

- 클래스 영역
    - class, static, method, 상수, ..
- 힙 영역
    - 동적으로 인스턴스 생성 시
- 스택 영역
    - 프로그램 실행 시 메모리에 스택 형태로 올려서 사용함

실행 전에 memorytest에 대한 바이트코드를 메모리에리아에 올려둠

```java
class MemoryTest {
		static int total = 0;
		public static void main(String[] args) {
				int x=10, y=20, z; //1번
				z=add(x,y);
		}
		static int add(int a, int b) {
				total++; //2번
				return(a+b);
		}
}
```

- 힙영역에 Class 생성 시 add 와 multi는 생성하지 않음
- 필드만 생성함

- 인스턴스를 생성할 때마다 개별적으로 메모리에 모두 저장되어있다면 메모리 낭비임
- stack 영역에 add frame만 만들 뿐이다
- 각각의 인스턴스
- 리턴됨과 동시에 multi frame은 없어지고 변수에 저장될 것임

### 배열만들기

- 동적 할당을 위해 new 사용
- 남은 애들은 나중에 GC가 처리할 것임
- 이차원 배열이 하나 만들어짐

### 싱글톤패턴 만들기

- 객체를 바로 출력하면 패키지명.클래스@해시코드로 구성되어 있음
- 해시코드를 통해 힙 영역의 인스턴스를 찾아가는 과정을 가짐
- 해시코드가 다르면 서로 다른 인스턴스라는 것을 의미함
- 만약 값은 공유해도 되거나 개별적인 인스턴스를 만들 필요가 없다면 싱글톤패턴으로 만드는 것이 좋음

### 싱글톤패턴을 만드는 방법

- 외부에서 인스턴스를 생성하면 새로운 인스턴스가 생기기 때문에 외부에서 생성을 못 하도록 처리
    - 생성자를 private으로 설정
- 자기자신을 참조하는 변수를 static으로 선언
    - **`public** **static** Singleton *s* = **null**;`
- 처음 1회만 인스턴스를 생성하는 메서드를 생성하고 리턴

→ 싱글톤패턴을 이용해 생성자를 구성하면 객체를 여러 개 생성해도 같은 해시코드를 가짐 (하나의 객체만을 가짐)

```java
public class Singleton {
	public static Singleton singleton = null;
	int score;
	private Singleton() {}
	public static Singleton getInstance() {
		if (singleton == null) {
			singleton = new Singleton();
		}			
		return singleton;
	}
}
```

- 인스턴스 생성 없이도 바로 접근 가능