package collection;

import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.SortedMap;
import java.util.TreeMap;

public class TreeMapMethod {
	public static void main(String[] args) {
		TreeMap<Integer, String> treeMap = new TreeMap<>();
		for (int i = 20; i > 0; i -= 2) {
			treeMap.put(i, i + "번째 데이터");
		}
		System.out.println(treeMap.toString());

		// 1. firstKey()
		System.out.println(treeMap.firstKey());

		// 2. firstEntry()
		System.out.println(treeMap.firstEntry());

		// 3. lastKey()
		System.out.println(treeMap.lastKey());

		// 4. lastEntry()
		System.out.println(treeMap.lastEntry());

		// 5. lowerKey(K key)
		System.out.println(treeMap.lowerKey(11));
		System.out.println(treeMap.lowerKey(10));

		// 6. higherKey(K key)
		System.out.println(treeMap.higherKey(11));
		System.out.println(treeMap.higherKey(10));

		// 7. pollFirstEntry()
		System.out.println(treeMap.pollFirstEntry());
		System.out.println(treeMap.toString());

		// 8. pollLastEntry()
		System.out.println(treeMap.pollLastEntry());
		System.out.println(treeMap.toString());

		// 9. SortedMap<K, V> heapMap(K toKey)
		SortedMap<Integer, String> sortedMap = treeMap.headMap(8);
		System.out.println(sortedMap);

		// 10. NavigableMap<K, V> heapMap(K toKey, boolean inclusive)
		NavigableMap<Integer, String> navigableMap = treeMap.headMap(8, true);
		System.out.println(navigableMap);

		// 11. SortedMap<K, V> tailMap(K toKey)
		sortedMap = treeMap.tailMap(8);
		System.out.println(sortedMap);

		// 12. NavigableMap<K, V> tailMap(K toKey, boolean inclusive)
		navigableMap = treeMap.tailMap(8, true);
		System.out.println(navigableMap);

		// 13. SortedMap<K, V> subMap(K fromKey, K toKey)
		sortedMap = treeMap.subMap(6, 10);
		System.out.println(sortedMap);

		// 14. SortedMap<K, V> subMap(K fromKey, K toKey)
		navigableMap = treeMap.subMap(6, true, 10, true);
		System.out.println(navigableMap);

		// 15. NavigableSet<K> descendingKeySet()
		NavigableSet<Integer> navigableSet = treeMap.descendingKeySet();
		System.out.println(navigableSet);
		System.out.println(navigableSet.descendingSet());

		// 16. NavigableMap<K, V> descendingMap()
		navigableMap = treeMap.descendingMap();
		System.out.println(navigableMap);
		System.out.println(navigableMap.descendingMap());

	}
}
