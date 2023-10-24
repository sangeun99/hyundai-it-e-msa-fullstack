package thread;

class VideoFileRunnable implements Runnable {
	@Override
	public void run() {
		int[] intArray = {1, 2, 3, 4, 5};
		for (int i = 0; i < intArray.length; i++) {
			System.out.print("(비디오 프레임) " + intArray[i]);
			try {Thread.sleep(200); } catch (InterruptedException e) {}
		}
	}
}

public class CreateAndStartThread4 {
	public static void main(String[] args) {
		Runnable smiFileRunnable = new SMIFileRunnable();
		Thread smiThread = new Thread(smiFileRunnable);
		smiThread.start();
		
		Runnable videoFileRunnable = new VideoFileRunnable();
		Thread videoThread = new Thread(videoFileRunnable);
		videoThread.start();
	}
}
