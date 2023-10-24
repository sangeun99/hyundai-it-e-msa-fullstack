package thread;

class Databox {
	boolean isEmpty = true;
	int data;
	synchronized void inputData(int data) {
		if (!isEmpty) {
			try {wait();} catch (InterruptedException e) {}
		}
		this.data = data;
		isEmpty = false;
		System.out.println("입력 데이터: " + data);
		notify();
	}
	
	synchronized void outputData() {
		if (isEmpty) {
			try { wait(); } catch (InterruptedException e) {}
		}
		isEmpty = true;
		System.out.println("출력 데이터: " + data);
		notify();
	}
}

public class Waiting_WaitNotify {
	public static void main(String[] args) {
		Databox databox = new Databox();
		Thread t1 = new Thread() {
			public void run() {
				for (int i = 1; i < 9; i++) {
					databox.inputData(i);
				}
			};
		};
		Thread t2 = new Thread() {
			public void run() {
				for (int i = 1; i < 9; i++) {
					databox.outputData();
				}
			};
		};
		t1.start();
		t2.start();
	}
}
