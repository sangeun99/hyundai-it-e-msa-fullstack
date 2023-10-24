package oop3;

public class AnimalTest2 {
	public static void main(String[] args) {
		Cat c = new Cat();
		System.out.println(c);
		
		Animal a = c;
		System.out.println(a);
		
		if (a instanceof Bird) {
			Bird b = (Bird) a;
			System.out.println(b);			
		}
		else {
			System.out.println("Downcasting 불가");
		}
	}
}
