package exception;

class B implements AutoCloseable {

	@Override
	public void close() throws Exception {
		System.out.println("B 자원");
	}
}

public class AutoCloseableTest {	
	public static void main(String[] args) {		
		try(B b = new B()){
			System.out.println("try 블록");
		}		
		catch(Exception e) {
			System.out.println("catch 블록");
		}
		System.out.println("프로그램 종료");
	}
}
