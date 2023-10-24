package thread;

class MyBlockTest {
	// 공유 객체
	MySharedClass msc = new MySharedClass();
	// 3개의 쓰레드 필드 생성
	Thread t1 = new Thread("Thread1") {
		public void run() {
			msc.syncMethod();
		};
	};
	
	Thread t2 = new Thread("Thread2") {
		public void run() {
			msc.syncMethod();
		};
	};
	
	Thread t3 = new Thread("Thread3") {
		public void run() {
			msc.syncMethod();
		};
	};
	
	void startAll() {
		t1.start();
		t2.start();
		t3.start();
	}
	
	class MySharedClass {
		synchronized void syncMethod() {
			try {Thread.sleep(100);} catch (InterruptedException e) {}
			System.out.println("====" + Thread.currentThread().getName() + "====");
			System.out.println("thread1->" + t1.getState());
			System.out.println("thread2->" + t2.getState());
			System.out.println("thread3->" + t3.getState());
			for (long i = 0; i < 1000000000L; i++) {}
		}
	}
}

public class BlockedState {
	public static void main(String[] args) {
		MyBlockTest mbt = new MyBlockTest();
		mbt.startAll();
	}
}
