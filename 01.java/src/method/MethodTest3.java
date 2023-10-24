package method;

public class MethodTest3 {
	public static void main(String[] args) {
		print(1);
		print(2, 3);
		print(4, 5, 6);
		
		print2(1);
		print2(2, 3);
		print2(4, 5, 6);
	}

	private static void print(int... i) {
		// TODO Auto-generated method stub
		for (int j = 0; j < i.length; j++) {
			System.out.print(i[j] + "\t");
		}
		System.out.println();
	}
	
	private static void print2(int... i) {
		// TODO Auto-generated method stub
		for (int j : i) {
			System.out.print(j + "\t");
		}
		System.out.println();
	}
	
	
/*
	private static void print(int i) {
		// TODO Auto-generated method stub
		System.out.println(i);
	}
	
	// 메소드 이름은 같은데 전달되는 argument가 다른 경우 -> 메소드 오버로딩
	private static void print(int i, int j) {
		// TODO Auto-generated method stub
		System.out.println(i + ", " + j);
	}

	private static void print(int i, int j, int k) {
		// TODO Auto-generated method stub
		System.out.println(i + ", " + j + ", " + k);
	} */
}
