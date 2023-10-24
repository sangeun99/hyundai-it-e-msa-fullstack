package oop9;

class C extends B{}
class D extends B{}

public class Typecasting1 {
	public static void main(String[] args) {
		A ac = (A)new C();
		B bc = (B)new C();
		
		B bb = new B();
		A a = (A) bb;
		
		A aa = new A();
//		B b = (B) aa;
//		C c = (C) aa;
		
		B bd = new D();
		D d = (D) bd;
		
		A ad = new D();
		B b1 = (B) ad;
		D d1 = (D) ad;
	}

}
