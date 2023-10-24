package exception;

class MinusException extends Exception {
	public MinusException() {
		super();
	}
	public MinusException(String message) {
		super(message);
	}
}

class OverException extends Exception {
	public OverException() {
		super();
	}
	public OverException(String message) {
		super(message);
	}
}

class UE { 
	void checkScore(int score) throws MinusException, OverException {
		if (score < 0)
			throw new MinusException("예외 발생: 음숫값 입력");
		else if (score > 100)
			throw new OverException("예외 발생: 100점 초과");
		else
			System.out.println("정상적인 값입니다.");
	}
}


public class UserExceptionExample {
	public static void main(String[] args) {
		UE a = new UE();
		try {
			a.checkScore(65);
			a.checkScore(150);
		}
		catch (MinusException | OverException e) {
			System.out.println(e.getMessage());
		}		
	}
}
