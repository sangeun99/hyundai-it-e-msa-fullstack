package thread;

class MyData2 {
	int data = 3;
	public void plusData() {
		synchronized(this) { // 블럭 동기화
			int mydata = data;
			try { Thread.sleep(2000);} catch (InterruptedException e) {}
			data = mydata + 1;	
		}
	}
}

class PlusThread2 extends Thread {
	MyData2 myData;
	public PlusThread2(MyData2 myData) {
		this.myData = myData;
	}
	public void run() {
		myData.plusData();
		System.out.println(getName() + "실행 결과 : " + myData.data);
	}	
}

public class SynchronizedMethod2 {
	public static void main(String[] args) {
		MyData2 myData = new MyData2();
		
		Thread plusThread1 = new PlusThread2(myData);
		plusThread1.setName("plusThread1");
		plusThread1.start();		

		try { Thread.sleep(1000);} catch (InterruptedException e) {}
		
		Thread plusThread2 = new PlusThread2(myData);
		plusThread2.setName("plusThread2");
		plusThread2.start();
	}
}
