package thread;

public class CreateAndStartThread5 {
	public static void main(String[] args) {
		System.out.println(Thread.currentThread());
		Thread thread1 = new Thread(new Runnable() {
			@Override
			public void run() {
				System.out.println(Thread.currentThread());
				String[] strArray = {"하나", "둘", "셋", "넷", "다섯"};
				try {Thread.sleep(10);} catch(InterruptedException e) {}
				for (int i = 0; i < strArray.length; i++) {
					System.out.println("- (자막 번호) " + strArray[i]);
					try {Thread.sleep(200);} catch(InterruptedException e) {}
				}
			}
		});
		thread1.start();
		Thread thread2 = new Thread(new Runnable() {
			@Override
			public void run() {
				System.out.println(Thread.currentThread());
				int[] intArray = {1, 2, 3, 4, 5};
				for (int i = 0; i < intArray.length; i++) {
					System.out.print("(비디오 프레임) " + intArray[i]);
					try { Thread.sleep(200); } catch(InterruptedException e) {}
				}
			}			
		});
		thread2.start();
	}
}
