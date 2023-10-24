package oop7;

public class SingletonTest {
	public static void main(String[] args) {
		Singleton s = Singleton.getInstance();
		System.out.println(s);
		System.out.println(s.getClass());
		System.out.println(s.hashCode());
		
		Singleton s2 = Singleton.getInstance();
		System.out.println(s2);
		System.out.println(s2.getClass());
		System.out.println(s2.hashCode());
	}
}
