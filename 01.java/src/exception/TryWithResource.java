package exception;

class MyResource implements AutoCloseable {
	@Override
	public void close() throws Exception {
		System.out.println("자원 반납");		
	}
}

public class TryWithResource {
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