package generic;

class GenericMethods {
	public <T> T method1(T t) {
		return t;
	}
	public <T> boolean method2(T t1, T t2) {
		return t1.equals(t2);
	}
	public <K, V> void method3(K k, V v) {
		System.out.println(k + ": " + v);
	}
}

public class GenericMethod {
	public static void main(String[] args) {
		GenericMethods gm = new GenericMethods();
		
		String st1 = gm.<String>method1("안녕");
		String st2 = gm.method1("안녕");
		System.out.println(st1);
		System.out.println(st2);
		
		boolean bool1 = gm.<Double>method2(2.5, 2.5);
		boolean bool2 = gm.method2(2.5, 2.5);
		System.out.println(bool1);
		System.out.println(bool2);
		
		gm.<String, Integer>method3("국어", 80);
		gm.method3("국어", 80);
		
	}
}
