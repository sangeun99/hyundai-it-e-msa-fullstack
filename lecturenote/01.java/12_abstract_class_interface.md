## 12장. 추상 클래스와 인터페이스

### 인터페이스

- 규격이 맞지 않았을 때 바꿔야 하는 곳이 많음
- 표준이 되는 스펙을 정의할 필요가 있음

```java
public interface TV {
	public abstract void powerOn();	
	public abstract void powerOff();
	public abstract void channerUp();	
	public abstract void channelDown();	
	public abstract void soundUp();	
	public abstract void soundDown();
}
```

- TV의 규격을 구현한 HyundaiTV

```java
public class HyundaiTV implements TV {

	. . . 

}
```

- 특정한 문제가 없다면 upcasting을 해서 가지고 있는 것이 좋음

- 변경이 될 수 있는 클래스를 만들고자 한다면 기반이 되는 타입을 만들어주는 것이 좋음
- 새로운 메서드를 추가하고자 할 때 인터페이스에 추가하고, 그 인터페이스를 구현한 모든 클래스에 해당 메서드가 필요함
    - 불편함
    - default 타입을 사용할 수 있음
    

### new라는 키워드와 독립적인 체계 만들기

- properties를 저장하는 파일에 key, value 형태로 사용할 클래스를 정의함

```java
tv=oop10.SamsungTV
speaker=oop10.HarmanSpeaker
```

- 정의한 properties를 이용하여 TV 인스턴스와 Speaker 인스턴스 생성함

```java
package oop10;

import java.io.FileInputStream;
import java.util.Properties;

public class TVTest {
	public static void main(String[] args) {
		Properties pr = new Properties();
		try {
			pr.load(new FileInputStream("src/oop10/product.properties"));
			String tvClass = pr.getProperty("tv");
			String speakerClass = pr.getProperty("speaker");
			Class tvClazz = Class.forName(tvClass); // 클래스가 있으면 해당 클래스를 메모리에 올림
			Class speakerClazz = Class.forName(speakerClass);
			TV tv = (TV) tvClazz.getConstructor(null).newInstance();
			Speaker speaker = (Speaker) speakerClazz.getConstructor(null).newInstance();

			tv.setSpeaker(speaker);
			tv.powerOn();
			tv.channelDown();
			tv.channelDown();
			tv.channelDown();
			tv.soundUp();		
			tv.powerOff();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
```

### 추상클래스 vs 인터페이스

- 추상메서드와 일반메서드를 모두 가지고있으면 추상클래스로 만드는 것이 낫다
- 일반메서드를 가지고 있지 않으면 인터페이스로 만드는 것이 낫다

### 다중 상속

- 클래스는 다중 상속이 불가능함
    - 왜? 모호성의 문제로 인한 자바 메모리 구조 문제 발생
    - 사자 | 호랑이 모두 이빨, 발톱이라는 필드를 가진다고 가정
    - 라이거 또한 이빨, 발톱이라는 필드를 가질 수 있음
    - 보통 다른 언어에서 각 필드가 누구의 것인지 표기하지만 자바 메모리 구조에서 문제가 생김
- 인터페이스와 인터페이스 사이에서의 다중 상속은 가능함
- 인터페이스를 구현한 클래스 사이에서 다중 구현도 가능함

### 인터페이스를 이용해 다중상속 구현

- thread에서 run()함수가 실행됨..

```java
public class ThreadTest0 extends MyClass implements Runnable;
```

- run처럼 동작하는 것을 쓰레드로 실행함
- Java 자체에서는 멀티쓰레드를 지원하지 않지만 인터페이스를 이용해 멀티쓰레드와 같은 형태로 표현

### 인터페이스

- 인터페이스 내부의 모든 필드는 public static final
- static과 default 메서드 이외의 모든 메서드는 public abstract
    - default 메서드 사용 시 인터페이스에 메서드 구현 가능
- 인터페이스를 구현한 클래스는 추상메서드를 반드시 구현해야 함