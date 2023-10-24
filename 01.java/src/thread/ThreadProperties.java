package thread;

public class ThreadProperties {
	public static void main(String[] args) {
		Thread curThread = Thread.currentThread();
		System.out.println("현재 쓰레드의 이름 : " + curThread.getName());
		System.out.println("동작하는 쓰레드의 개수 : " + Thread.activeCount());
		
		// 쓰레드 이름 자동 지정
		for (int i = 0; i < 3; i++) {
			Thread thread = new Thread();
			System.out.println(thread.getName());
			thread.start();
		}
		
		// 쓰레드 이름 직접 지정		
		for (int i = 0; i < 3; i++) {
			Thread thread = new Thread();
			thread.setName(i + "번째 쓰레드");
			System.out.println(thread.getName());
			thread.start();
		}
		
		// 쓰레드 이름 자동 지정
		for (int i = 0; i < 3; i++) {
			Thread thread = new Thread();
			System.out.println(thread.getName());
			thread.start();
		}
		
		// 쓰레드의 개수 가져오기
		System.out.println("동작하는 쓰레드의 개수 : " + Thread.activeCount());
	}
}
