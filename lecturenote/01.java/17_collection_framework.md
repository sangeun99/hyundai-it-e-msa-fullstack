
## 17장. 컬렉션 프레임워크

- List
- Set
- Map

### 컬렉션

- 동일한 타입을 묶어 관리하는 자료구조
- 배열과는 다름
    - 배열: 생성 시점에 저장 공간의 크기를 확정. 변경 불가능
    - 컬렉션: 데이터의 개수에 따라 동적으로 변화

### List

- ArrayList
- Vector
- LinkedList

- Array.asList로 만들면 변경이 안 됨

### Vector<E> 구현 클래스

- 멀티쓰레드에서 사용할 수 있도록 기능 추가
    - remove, add 등이 syncronized 처리되어 있음
    - 쓰레드에서 데이터가 안전함
        
        ```java
        List<String> list = Collections.synchronizedList(new ArrayList());
        // 이렇게 사용한다면 데이터별로 lock을 걸어줌
        // 무거운 Vector보다 효과적일 수 있음
        ```
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/9a5eb8ec-8db4-4c44-b608-e9870a00b8ee)
        
- 속도가 빠름

### LinkedList<E> 구현 클래스

- 양방향으로 연결된 구조

### ArrayList<E> vs LinkedList<E>

|  | ArrayList<E> | LinkedList<E> |
| --- | --- | --- |
| 추가, 삭제
(add, remove) | 속도 느림 | 속도 빠름 |
| 검색
(get) | 속도 빠름 | 속도 느림 |
- ArrayList는 수정 시 처리할 과정 많음
    - ArrayList에서 add 시 맨 마지막 인덱스부터 하나하나 밀려서 수정하는 과정 필요
- LinkedList는 언제 유리할까
    - 데이터를 가져온 상태에서 수정할 일이 많을 때

### Set

- HashSet
- LinkedHashSet
- TreeSet

- 중복 데이터를 저장하지 않음
    - 그러기 위해 equals 등이 오버라이딩 되어있음

### HashSet<E> 구현 클래스

- 입력 순서에 무관하게 출력
- iterator()는 객체 내부의 데이터를 하나씩 꺼내 처리하고자 할 때
    - Iterator<E> 클래스의 메서드
        - hasNext()
        - next()
- 인덱스가 없어 일반적인 for문이 불가능. for-each 구문으로 데이터 접근은 가능

### HashSet<E>의 중복 확인 매커니즘

- HashSet 관점에서 `A a1 = new A(3)` 과 `A a2 = new A(3)` 는 같아야 함
- 하지만 A를 HashSet에 담을 때 그렇게 동작하지 않음
- 객체의 hashcode()가 동일하고, equal() 결과가 동일해야 함
    - 객체A에서 hashCode() 오버라이딩, equals() 오버라이딩 필요

### 등가연산자 ==과 Object 클래스의 equals()

- 등가연산자 ==
    - 스택 메모리값을 동등비교
    - 기본 자료형의 등가연산: 실젯값
    - 참조 자료형의 등가연산: 위칫값
- Object 클래스의 equals()
    - 등가연산과 동일
    - 메서드 오버라이딩을 했다면 다르게 동작
        - ex) String 객체
            
            ```java
            public class EqualsTest {
                public static void main(String[] args) {
                	String str1 = "test";
                	String str2 = new String("test");
            
                	System.out.println(str1==str2); // false
                	System.out.println(str1.equals(str2)); // true
            	}
            }
            ```
            

### LinkedHashSet<E> 구현 클래스

- 출력 순서가 항상 입력 순서와 동일
- List<E>처럼 중간에 데이터를 추가하거나 특정 순서에 저장된 값을 가져오는 것은 불가능

### TreeSet<E> 구현 클래스

- 데이터를 입력 순서와 상관없이 크기순으로 출력
- TreeSet<E>의 부모 인터페이스
    - Set ← SortedSet ← NavigableSet
    - SortedSet, NavigableSet에서 정렬과 검색 기능이 정의됨
    - TreeSet<E> 생성자로  Set으로 Upcasting하여 객체를 생성 시 정렬 검색 기능 X

### TreeSet<E>의 주요 메서드

- SortedSet<E> headSet(E element)
    - 기본 boolean: false
- SortedSet<E> tailSet(E element)
    - 기본 boolean: true
- SortedSet<E> subSet(E element, E element)
    - 기본 boolean: 각각 true, false
    

### TreeSet<E>의 데이터 크기 비교

- 기준의 정의되어야 함
- 방법1) java.lang.Comparable<T> 인터페이스 구현
- 방법2) TreeSet 생성자 매개변수로 java.util.Comparator<T> 인터페이스 객체 제공

### Map

- HashMap
- Hashtable
- LinkedHashMap
- TreeMap

- Key, Value가 한 쌍으로 데이터를 저장
    - Key는 겹치면 안됨

### HashMap<K, V>

- Key 값의 중복 여부 확인
    - hashCode()가 같음
    - equals() 메서드가 true
    

### Hashtable<K, V>

- 멀티쓰레드에 안정
- HashMap과 동일

### LinkedHashMap<K, V>

- 출력이 입력의 순으로 나옴
- HashMap과 동일

### TreeMap<K, V>

- 정렬 및 검색 기능이 추가됨
    - Map 타입으로 Upcasting 시 메서드 사용 불가능
- 데이터를 Key값의 크기 순으로 저장
    - 크기 비교 기준이 정의되어야 함

### Stack<E> 컬렉션 클래스

- Vector<E> 클래스의 자식 클래스
- LIFO
    - 나중에 입력된 데이터가 먼저 출력
- 주요 메서드
    - push()
    - pop()
    - peek()
    - search()
        - 맨 위의 값이 1, 아래로 내려갈수록 1씩 증
    - empty()

### Queue<E> 컬렉션 인터페이스

- LinkedList<E>가 Queue<E> 인터페이스의 구현 클래스
- FIFO
    - 먼저 입력된 값이 먼저 출력
- 주요 메서드
    - add(), offer()
    - remove(), poll()
    - peek(), element()