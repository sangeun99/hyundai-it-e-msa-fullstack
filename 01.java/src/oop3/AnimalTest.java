package oop3;

public class AnimalTest {	
	public static void main(String[] args) {
		Animal a = new Condor();
		System.out.println(a);
		
		Bird b = (Bird) a;
		System.out.println(b);
		
		Condor c = null;
		if (b instanceof Condor) {
			c = (Condor) b;
			System.out.println(c);
		}
		else {
			System.out.println("Downcasting 불가");
		}
		
		if (c instanceof BlackVulture) {
			BlackVulture d = (BlackVulture) c;
			System.out.println(d);
		}
		else {
			System.out.println("Downcasting 불가");
		}
	}
}
