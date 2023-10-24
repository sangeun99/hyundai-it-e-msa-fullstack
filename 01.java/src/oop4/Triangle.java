package oop4;

public class Triangle extends Shape {
	int w = 10;
	int h = 5;
	
	@Override
	void area() {
		res = (double) w * h / 2;
	}
}
