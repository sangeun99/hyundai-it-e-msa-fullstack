package oop4;

public class Rectangle extends Shape {
	int w = 10;
	int h = 5;
	
	@Override
	void area() {
		res = w * h;
	}
}
