package oop7;

public class Singleton {
	public static Singleton singleton = null;
	int score;
	private Singleton() {}
	public static Singleton getInstance() {
		if (singleton == null) {
			singleton = new Singleton();
		}			
		return singleton;
	}
}
