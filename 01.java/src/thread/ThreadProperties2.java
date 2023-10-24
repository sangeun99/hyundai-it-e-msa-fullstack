package thread;

class MyThread extends Thread {
	public void run() {
		for (long i = 0; i < 2_000_000_000_000_000L; i++) {}
		System.out.println(getName() + " 우선순위 : " + getPriority());
	}
}

public class ThreadProperties2 {
	public static void main(String[] args) {
		// CPU 코어 수
		System.out.println("코어 수 : " + Runtime.getRuntime().availableProcessors());
		
		// 우선순위 자동 지정
		for (int i = 0; i < 3; i++) {
			Thread thread = new MyThread();
			thread.start();
		}
		
		try { Thread.sleep(2000); } catch(InterruptedException e) {}
		
		// 우선순위 직접 지정
		Thread[] thread = new Thread[20];
		for (int i = 0; i < 20; i++) {
			thread[i] = new MyThread();
			thread[i].setName(i + "번째 쓰레드");
			if (i == 19) thread[i].setPriority(10);
			thread[i].start();
		}
	}
}
