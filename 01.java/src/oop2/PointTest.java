package oop2;

public class PointTest {
	public static void main(String[] args) {
		Point2D pt = new Point3D(); // upcasting
		pt.x = 100;
		pt.y = 200;
		// pt.z = 300;
		System.out.println(pt.x);
		System.out.println(pt.y);
		// System.out.println(pt.z);
		Point3D pt2 = (Point3D) pt; // downcasting
		System.out.println(pt2.x);
		System.out.println(pt2.y);
		System.out.println(pt2.z);
	}
}