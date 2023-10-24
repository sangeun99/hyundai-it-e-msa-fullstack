package basic;

public class OpTest11 {
	public static void main(String[] args) {
		int n = 3;
		System.out.println(n == 1 || n == 3 ? "남자" :
						   n == 2 || n == 4 ? "여자" :
											  "에러");		
	}
}