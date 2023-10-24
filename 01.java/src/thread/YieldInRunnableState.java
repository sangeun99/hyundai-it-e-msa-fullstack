package thread;

class MyNewThread extends Thread {
	boolean yieldFlag;
	public void run() {
		while (true) {
			if (yieldFlag) {
				Thread.yield();
			}
			else {
				System.out.println(getName() + "실행");
				for (long i = 0; i < 1000000000L; i++) {}
			}
		}
	}
}

public class YieldInRunnableState {
	public static void main(String[] args) {
		MyNewThread t1 = new MyNewThread();
		t1.setName("t1");
		t1.yieldFlag = false;
		t1.setDaemon(true);
		t1.start();
		
		MyNewThread t2 = new MyNewThread();
		t2.setName("t2");
		t2.yieldFlag = true;
		t2.setDaemon(true);
		t2.start();
		
		for (int i = 0; i < 6; i++) {
			try { Thread.sleep(1000); } catch (InterruptedException e) {}
			t1.yieldFlag = !t1.yieldFlag;
			t2.yieldFlag = !t2.yieldFlag;
		}
	}
}
