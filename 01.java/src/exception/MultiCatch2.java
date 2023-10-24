package exception;

public class MultiCatch2 {
	public static void main(String[] args) {
//		try {
//			System.out.println(3 / 1);
//			int num = Integer.parseInt("10A");
//		}
//		catch (Exception e) {
//			System.out.println("숫자는 0으로 나눌 수 없습니다.");
//		}
//		catch (NumberFormatException e ) { // unreachable code
//			System.out.println("숫자로 바꿀 수 없습니다");
//		}
		
		try {
			System.out.println(3 / 1);
			int num = Integer.parseInt("10A");
		}
		catch (NumberFormatException e ) {
			System.out.println("숫자로 바꿀 수 없습니다");
		}
		catch (Exception e) {
			System.out.println("숫자는 0으로 나눌 수 없습니다.");
		}
	}
}
