package exception;

class AA {}
class BB extends AA {}

public class UncheckedException {
	public static void main(String[] args) {
		// 1. ArithmeticException
		// System.out.println(3 / 0);
		
		// 2. ClassCastException
		// AA a = new AA();
		// BB b = (BB)a;
		
		// 3. ArrayIndexOutOfBoundsException
		// int[] array = {1, 2, 3};
		// System.out.println(array[4]);
		
		// 4. NumberFormatException
		// int num = Integer.parseInt("10!");
		
		// 5. NullPointerException
		// String str = null;
		// System.out.println(str.charAt(2));
	}
}
