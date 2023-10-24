package oop8;

public class InheritanceTest {
	public static void main(String[] args) {
		Human h = new Human();
		h.name = "김현지";
		h.age =11;
		h.eat();
		h.sleep();
		
		Student s = new Student();
		s.name = "김민성";
		s.age = 16;
		s.studentID = 128;
		s.eat();
		s.sleep();
		s.goToSchool();
		
		Worker w = new Worker();
		w.name = "봉윤정";
		w.age = 45;
		w.workerID = 248;
		w.eat();
		w.sleep();
		w.goToWork();		
	}
}
