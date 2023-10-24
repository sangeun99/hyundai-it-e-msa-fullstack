package exception;

// 1. 하위 메서드에 직접 예외를 처리할 때
class ThrowA {
	void abc() {
		bcd();
	}
	void bcd() {
		try {
			Thread.sleep(1000);
		}
		catch (InterruptedException e) {}
	}
}

// 2. 예외를 호출 메서드로 전가할 때
class ThrowB {
	void abc() {
		try {
			bcd();
		}
		catch (InterruptedException e) {}
	}
	void bcd() throws InterruptedException {
		Thread.sleep(1000);
	}
}

public class ThrowsException1 {
	public static void main(String[] args) {
		
	}
}
