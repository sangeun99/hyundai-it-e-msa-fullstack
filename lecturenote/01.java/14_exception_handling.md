## 14장. 예외 처리

- 일반 예외
    - Exceiption 클래스에게서 직접 상속
    - 컴파일 전에 예외 발생 문법을 검사
    - ClassNotFoundException, InterruptedException, …
- 실행 예외
    - RuntimeException 클래스를 상속
    - 실행할 때 발생하는 예외
    - ArithmetiException, ClassCastException, …
    
- main에서 throws를 그냥 던져버리는 건 안 됨

### 일반 예외

- InterruptedException
- ClassNotFoundException
    - Class.forName(”패키지명.클래스명”)으로 클래스를 동적으로 메모리에 로딩할 수 있음
    - 이 때 클래스가 없다면 예외 발생. 예외 처리가 필수
- IOException
    - 디바이스에서의 쓰거나 읽을 때 발생
    - write(), read()에 대한 예외 처리 필수
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/65c53756-f78c-4854-a4ef-3c23255c72d9)
    
- FileNotFoundException
- CloneNotSupportedException
- 예외처리 안 해주면 에러 창 발생
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/3aa2b43f-7903-4626-b807-e3e0b8285c5b)
    
    

### 실행 예외

- ArithmeticException
- ClassCastException
- ArrayIndexOutOfBoundsException
- NumberFormatException
- NullPointerException

### 예외 처리

- finally 블럭: 예외 발생 여부에 상관없이 실행
- try 블럭만 적어도 되긴 함
- 다중 예외 처리 시 예외 하위 클래스를 먼저 잡고, 상위 클래스를 나중에 잡아야 함
- try 블럭을 잘게 자르는 걸 권장하지만, 실무에서 짜는 코드는 try 블럭을 크게 침

### 리소스 자동 해제 예외 처리

- finally에서는 자원에 대한 해지 처리를 많이 함
- 하지만 번거로운 작업
- 자동으로 자원을 반납하는 TryWithResources 등장

	```java
	package exception;

	class MyResource implements AutoCloseable {
		@Override
		public void close() throws Exception {
			System.out.println("자원 반납");		
		}
	}

	public class TryWithResources {
		public static void main(String[] args) {
			try (MyResource m = new MyResource()) {
				System.out.println("try 블록");	
				throw new RuntimeException();
			}
			catch (Exception e) {
				System.out.println("catch 블록");
			}
			System.out.println("종료");
		}
	}
	```

- try문에 함께 넣은 자원은 따로 close할 필요가 없이 try 구문이 끝날 때 자원을 반납하게 됨
- AutoCloseable 인터페이스에 구현되어 있는 클래스만 사용 가능
- catch 블록 실행 전에 자원이 먼저 반납됨

### 예외 전가

- throws 예외 클래스명
- 메서드에서도, 생성자에서도 예외 전가 가능
- 나를 호출한 쪽에서 try-catch 구문을 작성하도록 하는 것
- main에서 throws하면 안 됨

### debug

- 진입점 지정
- `f5` step into
- `f6` step over
- `f7` step return
- `f8` 다음 break point로 이동 가능
- variables 탭에서 변수에 들어갈 값을 임의로 지정할 수 있음
