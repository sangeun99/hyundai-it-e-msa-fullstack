package thread;

class MyThread2 extends Thread {
	public void run() {
		System.out.println(getName() + ": " + (isDaemon()? "데몬쓰레드" : "일반쓰레드"));
		for (int i = 0; i < 6; i++) {
			System.out.println(getName() + ": " + i + "초");
			try { Thread.sleep(1000); } catch(InterruptedException e) {}
		}
	}
}

public class ThreadProperties3 {
	public static void main(String[] args) {
		// 일반쓰레드
		Thread thread1 = new MyThread2();
		thread1.setDaemon(false);
		thread1.setName("thread1");
		thread1.start();
		
		// 데몬쓰레드
		Thread thread2 = new MyThread2(); // 모든 일반 쓰레드가 중지돼야 종료됨
		thread2.setDaemon(true);
		thread2.setName("thread2");
		thread2.start();

		try { Thread.sleep(3500); } catch(InterruptedException e) {}
		System.out.println("main thread 종료");
	}

}
