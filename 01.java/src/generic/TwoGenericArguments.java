package generic;

class KeyValue<K, V> {
	private K key;
	private V value;
	public K getKey() {
		return key;
	}
	public void setKey(K key) {
		this.key = key;
	}
	public V getValue() {
		return value;
	}
	public void setValue(V value) {
		this.value = value;
	}
}

public class TwoGenericArguments {
	public static void main(String[] args) {
		KeyValue<String, Integer> kv1 = new KeyValue<>();
		kv1.setKey("사과");
		kv1.setValue(1000);
		System.out.println("key: " + kv1.getKey() + ", value: " + kv1.getValue());
		
		KeyValue<Integer, String> kv2 = new KeyValue<>();
		kv2.setKey(404);
		kv2.setValue("Not Found(요청한 페이지를 찾을 수 없습니다.)");
		System.out.println("key: " + kv2.getKey() + ", value: " + kv2.getValue());
		
		KeyValue<String, Void> kv3 = new KeyValue<>();
		kv3.setKey("키 값만 사용");
		System.out.println("key: " + kv3.getKey() + ", value: " + kv3.getValue());
	}
}
