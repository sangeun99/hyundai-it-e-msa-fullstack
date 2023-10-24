package thread;

class SleepThread extends Thread {
	@Override
	public void run() {
		try {
			Thread.sleep(3000);
		}
		catch (InterruptedException e) {
			System.out.println(" -- sleep() 진행 중 interrupt() 발생");
			for (long i = 0; i < 1000000000L; i++) {} // 시간 지연
		}
	}
}
public class TimedWaiting_Sleep {
	public static void main(String[] args) {
		SleepThread t1 = new SleepThread();
		t1.start();
		
		try {Thread.sleep(100); } catch (InterruptedException e) {}
		System.out.println("MyThread State = " + t1.getState());
		// TIMED_WATING
		t1.interrupt();
		try {Thread.sleep(100); } catch (InterruptedException e) {}
		System.out.println("MyThread State = " + t1.getState());		
	}
}
