package collection;

public class EqualsTest {
    public static void main(String[] args) {
    	String str1 = "test";
    	String str2 = new String("test");

    	System.out.println(str1==str2); // false
    	System.out.println(str1.equals(str2)); // true
	}
}
