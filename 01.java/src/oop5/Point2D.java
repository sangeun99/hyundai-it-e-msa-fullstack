package oop5;

public class Point2D extends Object {
	int x;
	int y;
	
	public Point2D () {
		this(1, 2);
		System.out.println("Point2D() 수행");
	}
	
	public Point2D (int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("Point2D(x, y) 수행");
	}
}
