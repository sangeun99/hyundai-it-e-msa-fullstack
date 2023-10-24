package oop1;

public class PointTest {
	public static void main(String[] args) {
		Point3D pt = new Point3D(); // heap 영역에 메모리를 저장하기 위한 키워드가 new임
		pt.setX(100);
		pt.setY(200);
		pt.setZ(300);
		pt.print();
	}
}