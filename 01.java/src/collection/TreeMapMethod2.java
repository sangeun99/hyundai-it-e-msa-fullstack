package collection;

import java.util.Comparator;
import java.util.TreeMap;

class MyDataClass{
	int data1;
	int data2;
	public MyDataClass(int data1, int data2) {
		this.data1 = data1;
		this.data2 = data2;
	}
	@Override
	public String toString() {
		return "data1 = " + data1 + "을 갖고 있는 클래스";
	}
}

class MyDataComparableClass implements Comparable<MyDataComparableClass> {
	int data1;
	int data2;
	public MyDataComparableClass(int data1, int data2) {
		this.data1 = data1;
		this.data2 = data2;		
	}
	@Override
	public int compareTo(MyDataComparableClass o) {
		if (this.data1 < o.data1) return -1;
		else if (this.data1 == o.data1) return 0; 
		return -1;
	}
	@Override
	public String toString() {
		return "data1 = " + data1 + "을 갖고 있는 클래스";
	}
}

public class TreeMapMethod2 {
	public static void main(String[] args) {
		// 1. Integer 크기 비교
		TreeMap<Integer, String> treeMap1 = new TreeMap<>();
		Integer intValue1 = new Integer(20);
		Integer intValue2 = new Integer(30);
		treeMap1.put(intValue1, "가나다");
		treeMap1.put(intValue2, "나라다");
		System.out.println(treeMap1.toString());		
		
		// 2. String 크기 비교
		TreeMap<String, Integer> treeMap2 = new TreeMap<>();
		String str1 = "가나";
		String str2 = "다라";
		treeMap2.put(str1,  10);
		treeMap2.put(str2,  20);
		System.out.println(treeMap2.toString());
		
		// 3. MyDataClass 크기 비교
//		TreeMap<MyDataClass, Integer> treeMap3 = new TreeMap<>();
//		MyDataClass mdc1 = new MyDataClass(2, 5);
//		MyDataClass mdc2 = new MyDataClass(3, 3);
//		treeMap3.put(mdc1,  10);
//		treeMap3.put(mdc2,  20);
//		System.out.println(treeMap3.toString());
		
		// 4. MyDataComparableClass 크기 비교 방법 1
		TreeMap<MyDataComparableClass, String> treeMap4 = new TreeMap<>();
		MyDataComparableClass mdcc1 = new MyDataComparableClass(2, 5);
		MyDataComparableClass mdcc2 = new MyDataComparableClass(3, 3);
		treeMap4.put(mdcc1,  "가나다");
		treeMap4.put(mdcc2,  "나라다");
		System.out.println(treeMap4.toString());
		
		// 5. MyDataClass 객체 크기 비교 방법 2
		TreeMap<MyDataClass, String> treeMap5 = new TreeMap<MyDataClass, String>((new Comparator<MyDataClass>() {

			@Override
			public int compare(MyDataClass o1, MyDataClass o2) {
				if (o1.data1 < o2.data1) return -1;
				else if (o1.data1 == o2.data1) return 0; 
				return -1;
			}
			
		}));
		MyDataClass mdc1 = new MyDataClass(2, 5);
		MyDataClass mdc2 = new MyDataClass(3, 3);
		treeMap5.put(mdc1,  "가나다");
		treeMap5.put(mdc2,  "나라다");
		System.out.println(treeMap5.toString());
	}
}
