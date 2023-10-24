package collection;

import java.util.NavigableSet;
import java.util.SortedSet;
import java.util.TreeSet;

public class TreeSetMethod {
	public static void main(String[] args) {
		TreeSet<Integer> treeSet = new TreeSet();
		for (int i = 50; i > 0; i -= 2) {
			treeSet.add(i);
		}
		System.out.println(treeSet.toString());
		
		// 1. first()
		System.out.println(treeSet.first());
		
		// 2. last()
		System.out.println(treeSet.last());
		
		// 3. lower(E element)
		System.out.println(treeSet.lower(26));
		
		// 4. higher(E element)
		System.out.println(treeSet.higher(26));
		
		// 5. floor(E element)
		System.out.println(treeSet.floor(25));
		System.out.println(treeSet.floor(26));
		
		// 6. ceil(E element)
		System.out.println(treeSet.ceiling(25));
		System.out.println(treeSet.ceiling(26));
		System.out.println();
		
		// 7. pollFirst()
		System.out.println(treeSet.size());
		int treeSetSize = treeSet.size();
		for (int i = 0; i < treeSetSize; i++) {
			System.out.println(treeSet.pollFirst());
		}
		System.out.println();
		System.out.println(treeSet.size());
		
		// 8. pollLast()
		for (int i = 50; i > 0; i -= 2) {
			treeSet.add(i);
		}
		treeSetSize = treeSet.size();
		for (int i = 0; i < treeSetSize; i++) {
			System.out.println(treeSet.pollLast());
		}
		System.out.println();
		System.out.println(treeSet.size());
		
		// 9. SortedSet<E> headSet(E element)
		for (int i = 50; i > 0; i -= 2) {
			treeSet.add(i);
		}
		SortedSet<Integer> sSet = treeSet.headSet(20);
		System.out.println(sSet.toString());
		
		// 10. NavigableSet<E> headSet(E element, boolean inclusive)
		NavigableSet<Integer> nSet = treeSet.headSet(20, true);
		System.out.println(nSet.toString());
		nSet = treeSet.headSet(20, false);
		System.out.println(nSet.toString());
		
		// 11. SortedSet<E> tailSet(E element)
		sSet = treeSet.tailSet(20);
		System.out.println(sSet.toString());
		
		// 12. NavigableSet<E> tailSet(E element, boolean inclusive)
		nSet = treeSet.tailSet(20, true);
		System.out.println(nSet.toString());
		nSet = treeSet.tailSet(20, false);
		System.out.println(nSet.toString());
		
		// 13. SortedSet<E> subSet(E element, E element)
		sSet = treeSet.subSet(10,  20);
		System.out.println(sSet.toString());
		
		// 14. NavigableSet<E> subSet(E element, boolean inclusive, E element, boolean inclusive)
		nSet = treeSet.subSet(10,  true,  20,  false);
		System.out.println(nSet.toString());
		nSet = treeSet.subSet(10,  true,  20,  true);
		System.out.println(nSet.toString());
		
		// 15. NavigableSet<E> descendingSet()
		System.out.println(treeSet);
		NavigableSet<Integer> descendingSet = treeSet.descendingSet();
		System.out.println(descendingSet);
		descendingSet = descendingSet.descendingSet();
		System.out.println(descendingSet);
	}
}
