package basic;

public class WhileTest3 {
	public static void main(String[] args) {
		int i = 2;
		while (i <= 6) {
			int j = 1;
			while (j <= 9) {
				int k = i;
				while (k < i + 4) {
//					System.out.print(k + " * " + j + " = " + (k*j) + "\t");
					System.out.printf("%d * %d = %d\t", k, j, k*j);
					k++;
				}
				System.out.println();
				j++;
			}
			System.out.println();
			i += 4;
		}
	}
}