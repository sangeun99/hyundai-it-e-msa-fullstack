## 15장. 쓰레드

- 프로그램
    - 하드디스크에 저장된 파일들의 모임
    - 실행되기 위해서는 메모리에 올라와서 사용되어야 함
- 프로세스
    - 메모리상에 로딩된 프로그램
- 쓰레드
    - 한정된 코어의 수를 갖는 CPU를 여러 개의 작업이 나눠 사용해야 함
    - 단일쓰레드 : 프로세스 내에서 하나의 흐름을 가질 때
    - 멀티쓰레드 : 프로세스 내에서 여러 개의 흐름을 가질 때

### Java에서의 쓰레드

- 시작 시점에서는 main 쓰레드 1개만 존재
- 이후 main 쓰레드에서 쓰레드를 생성/실행하면 멀티 쓰레드

### 동시성과 병렬성

- 쓰레드는 동시성 또는 병렬성을 갖고 수행한다
- 사용자는 동시에 동작하는 것으로 인식
- 동시성
    - 작업의 수 > CPU의 코어 수
    - 매우 짧은 간격으로 교차 실행
- 병렬성
    - 작업의 수 < CPU의 코어 수
    - 동시에 작업이 수행

### 쓰레드의 생성

- 방법1) Thread 클래스를 상속 받아 run() 메서드를 오버라이딩
- 방법2) Runnable 인터페이스를 구현한 Runnable 객체를 생성. Thread 객체를 생성할 때 Runnable 인스턴스를 생성자로 전달
- 멀티쓰레드가 활용될 때에는 스택 영역이 하나 더 생김. (class 영역과 heap 영역은 함께 사용)

### 쓰레드 속성

- 현재 실행 중인 쓰레드 확인하기

    ```java
    Thread.currentThread();
    ```

- 쓰레드 이름 설정하기

    ```java
    t.setName(String name);
    ```

- 쓰레드 우선순위 지정

    ```java
    t.setPriority(10);
    ```

### 데몬 쓰레드

- 일반적으로 쓰레드를 실행하면 다른 쓰레드의 종료 여부와 관계 없이 자신의 쓰레드가 종료될 때까지 계속 실행
- 일반 쓰레드가 모두 종료되면 함께 종료되는 쓰레드가 데몬 쓰레드
- 데몬 쓰레드 설정

    ```java
    setDaemon(True)
    ```

### 쓰레드 동기화

- 하나의 작업이 완전히 완료된 후 다른 작업을 수행
- 필요성
    - 결과값의 불일치
- 방법
    - 메서드 동기화
        - 메서드의 리턴 타입 앞에 synchronized 키워드를 삽입
        
        ```java
        public synchronized void plusData() {}
        ```
        
        - 메서드를 사용할 때 lock이 걸리고 다른 쓰레드는 waiting 상태가 됨
    - 블럭 동기화
        - 특정 블록에 synchronized 키워드를 삽입
        
        ```java
        synchronized (this) {}
        // this 자리에는 특정 키값이 들어갈 수도 있음
        ```
        
        - key 객체의 열쇠를 가지고 있음 (메서드 동기화는 항상 this 객체의 열쇠 이용)
        - 다른 열쇠를 사용한다면 동시에 실행 가능

### 쓰레드 상태

```java
Thread.State getState()
```

- Enum 타입 (6가지)으로 정의됨
- NEW
    - Thread myThread = new MyThread()
- RUNNABLE
    - myThread.start()
- TERMINATED
    - run() 완료
- TIMED_WAITING
    - 시간만큼을 기다림 상태
- BLOCKED
    - 사용 객체 잠김 상태
- WAITING
    - 시간 정보 없는 join(), wait() 호출

### Enum 타입

- 상수들의 집합
- 장점
    - 명확하게 표기됨
    - RequestMethodType, Thread.State과 같이 이중에 꼭 속해야한다는 속성을 가지면 이 타입이 유용함

```java
package thread;

public class NewRunnableTerminated {
	public static void main(String[] args) {
		Thread.State state;
		
		// 1. 객체 생성 (New)
		Thread myThread = new Thread() {
			public void run() {
				for (long i = 0; i < 1000000000L; i++) {}
			}
		};
		state = myThread.getState();
		System.out.println("myThread state: " + state);
		
		// 2. myThread 시작
		myThread.start();
		state = myThread.getState();
		System.out.println("myThread state: " + state);
		
		// 3. myThread 종료
		try {
			myThread.join(); // myThread 실행이 완료될 때까지 main 쓰레드 일시 정지
		} catch (InterruptedException e) {}
		state = myThread.getState();
		System.out.println("myThread state: " + state);		
	}
}
```

### Thread.sleep(1000)과 join(1000)의 차이

- Thread.sleep(1000)
    - 정적 메서드
    - 호출한 현재 쓰레드를 일시정지
- join(1000)
    - 인스턴스 메서드
    - 특정 쓰레드 객체에게 일정시간동안 CPU 할당

### wait()와 notify()

- wait() : 쓰레드 일시정지
- notify() : 쓰레드 깨우기