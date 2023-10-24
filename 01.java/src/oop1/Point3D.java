package oop1;

public class Point3D extends Point2D {
	private int z;
	public int getZ() {
		return z;
	}

	public void setZ(int z) {
		this.z = z;
	}

	@Override
	public void print() {
		super.print();
		System.out.println("z = " + this.getZ());
	}
}
