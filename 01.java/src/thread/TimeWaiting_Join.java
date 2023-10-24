package thread;

class MT1 extends Thread {
	public void run() {
		for (long i = 0; i < 1000000000L; i++ ) {} // 시간 지연
	}
}

class MT2 extends Thread {
	MT1 mT1;
	public MT2(MT1 mT1) {
		this.mT1 = mT1;
	}
	public void run() {
		try {
			mT1.join(3000);
		}
		catch (InterruptedException e) {
			System.out.println(" -- join(...) 진행 중 interrupt() 발생");
			for (long i = 0; i < 1000000000L; i++) {}
		}
	}
}

public class TimeWaiting_Join {
	public static void main(String[] args) {
		MT1 mT1 = new MT1();
		MT2 mT2 = new MT2(mT1);
		mT1.start();
		mT2.start();
		
		// 쓰레드 시작 준비시간
		try { Thread.sleep(100);} catch (InterruptedException e) {}
		System.out.println("mT1 state: " + mT1.getState());
		System.out.println("mT2 state: " + mT2.getState());
		
		mT2.interrupt();
		// 인터럽트 준비시간
		try { Thread.sleep(100);} catch (InterruptedException e) {}
		System.out.println("mT1 state: " + mT1.getState());
		System.out.println("mT2 state: " + mT2.getState());
		
	}
}
