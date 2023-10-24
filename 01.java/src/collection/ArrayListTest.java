package collection;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ArrayListTest {
	public static void main(String[] args) {
		List<String> list = Collections.synchronizedList(new ArrayList());
	}
}
