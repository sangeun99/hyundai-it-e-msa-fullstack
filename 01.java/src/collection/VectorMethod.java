package collection;

import java.util.Arrays;
import java.util.List;
import java.util.Vector;

public class VectorMethod {
	public static void main(String[] args) {
		List<Integer> aList1 = new Vector<Integer>();
		// 1. add(E element)
		aList1.add(3);
		aList1.add(4);
		aList1.add(5);
		System.out.println(aList1.toString());
		
		// 2. add(int index, E element)
		aList1.add(1, 6);
		System.out.println(aList1.toString());
		
		// 3. addAll(또 다른 리스트 객체)
		List<Integer> aList2 = new Vector<Integer>();
		aList1.add(1);
		aList1.add(2);
		aList2.addAll(aList1);
		System.out.println(aList2);

		// 4. addAll(int index, 또 다른 리스트 객체)
		List<Integer> aList3 = new Vector<Integer>();
		aList3.add(1);
		aList3.add(2);
		aList3.addAll(1, aList3);
		System.out.println(aList3);
		
		// 5. set(int index, E element)
		aList3.set(1, 5);
		aList3.set(3, 6);
//		aList3.set(4, 7); // 인덱스 에러
		System.out.println(aList3);
		
		// 6. remove(int index)
		aList3.remove(1);
		System.out.println(aList3);
		
		// 7. remove(Object o)
		aList3.remove(new Integer(2));
		System.out.println(aList3);
		
		// 8. clear()
		aList3.clear();
		System.out.println(aList3);
		
		// 9. isEmpty()
		System.out.println(aList1.isEmpty());
		System.out.println(aList2.isEmpty());
		System.out.println(aList3.isEmpty());
		
		// 10. size()
		System.out.println(aList3.size());
		aList3.add(1);
		aList3.add(2);
		aList3.add(3);
		System.out.println(aList3);
		System.out.println(aList3.size());
		
		// 11. get(int index)
		System.out.println(aList3.get(0));
		System.out.println(aList3.get(1));
		System.out.println(aList3.get(2));
		for (int i = 0; i < 3; i++) {
			System.out.println(i + "번째 : " + aList3.get(i));
		}
		
		// 12. toArray() List -> Array
		Object[] object = aList3.toArray();
		System.out.println(Arrays.toString(object));
		
		// 13-1. toArray(T[] t) -> T[]
		Integer[] integer1 = aList3.toArray(new Integer[0]);
		System.out.println(Arrays.toString(integer1));
		
		// 13-2. toArray(T[] t) -> T[]
		Integer[] integer2 = aList3.toArray(new Integer[5]);
		System.out.println(Arrays.toString(integer2));
	}
}
