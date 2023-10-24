package basic;

public class ForTest3 {
	public static void main(String[] args) {
		for (int i = 2; i <= 9; i += 4) {
			for (int k = 1; k <= 9; k++) {
				for (int j = i; j < i + 4; j++) {
					System.out.print(j + " * " + k + " = " + (j * k) + "\t");
				}
				System.out.println("\t");
			}
			System.out.println();
		}
	}
}
