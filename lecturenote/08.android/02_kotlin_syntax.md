## 02 코틀린 문법 빠르게 살펴보기

- 스크래치 파일을 이용해 코틀린 쉽게 실행하기

### 자료형

```kotlin
println("Hello World")
val pi : Double = 3.14 // val 변수명 : 자료형
println(pi)
val pi2 = 3.14 // val 변수명 = 값
println(pi2)

val name = "gil-dong" // 형 추론 (String)
// name = "hong gil-dong" // 재할당 불가능
var name2 = "gil-dong"
name2 = "hong gil-dong" // 재할당 가능
println(name2)

val numByte: Byte = 100
val numShort: Short = 20
val numInt: Int = 1
val numLong: Long = 2L

val numDouble: Double = 3.2
val numFloat: Float = 3.2f

val char1: Char = 'h'
val isTrue: Boolean = true
val greeting: String = "Hello World"

var age: Int = 20
// 타입이 한 번 정해지면 바꿀 수 없다
// age: Float = 20.2

val 한글: String = "한글이 세종대왕이 창조한 문자이다"
println(한글)

val stringArray: Array<String> = arrayOf("apple", "banana", "grape")
println(stringArray)
val intArray = arrayOf(1, 2, 3)
println(intArray[2])
```

- 형변환

```kotlin
// 명시적 형변환
val score = 100
println(score.javaClass)
println(score.javaClass.kotlin)

val scoreString = score.toString()
val scoreDouble = score.toDouble()
println(scoreDouble)
println(scoreDouble.javaClass.kotlin)
```

- 연산

```kotlin
// 산술연산
val a: Int = 7
val b: Int = 5
println("${a} + ${b} = ${a + b}")
println("${a} - ${b} = ${a - b}")
println("${a} * ${b} = ${a * b}")
println("${a} / ${b} = ${a / b}")
println("${a} % ${b} = ${a % b}")

// 관계연산
println("${a} > ${b} : ${a > b}")
println("${a} < ${b} : ${a < b}")
println("${a} == ${b} : ${a == b}")
println("${a} != ${b} : ${a != b}")

// 마이너스 값에 대한 나머지 연산 시 부호를 따라감. 자바와 같음
println("${-a} % ${b} = ${-a % b}")
```

### 함수

```kotlin
fun printAge(age: Int): Unit {
    println(age)
}
printAge(15)

fun addNum(a: Int, b: Int): Int {
    return a + b
}
println(addNum(3, 7))

fun minusNum(a: Int, b: Int) = a - b
println(minusNum(minusNum(1000, 200), 100))
```

### 문자열템플릿

```kotlin
val price = 3000
val tax = 300

val originalPrice = "The original price is $price"
val totalPrice = "The total price is ${price + tax}"

println(originalPrice)
println(totalPrice)

val god: String = "신"
val human = "인간"
val msg = """
    실수란
    ${god}을 용서하는
    ${human}의 행위다.
"""
println(msg)
println(msg.trimIndent())
```

### 제어문

- for문

```kotlin
val numRange: IntRange = 1..5
println(numRange.contains(3))
println(numRange.contains(10))

val charRange: CharRange = 'a'..'e'
println(charRange.contains('b'))
println(charRange.contains('z'))

// for 문
for (i in 1..5) {
    println(i)
}

for (i in 5 downTo 1) {
    println(i)
}

for (i in 1..10 step 2) {
    println(i)
}

val students = arrayOf("jungi", "junsu", "siu", "yeonseo")
for (name in students) {
    println(name)
}

for ((index, name) in students.withIndex()) {
    println("Index: $index Name: $name")
}

```

- while문

```kotlin
// while 문
var num = 1
while (num < 5) {
    println(num)
    num++
}

var num2 = 1
do {
    num2++
    println(num2)
} while (num2 < 5)
```

- if문

```kotlin
// if 문
val examScore = 60
var isPass = false

if (examScore > 80) {
    isPass = true
}
println("시험 결과: $isPass")

val examScore2 = 99
if (examScore2 == 100) {
    println("만점이네요.")
} else {
    println("만점은 아니에요.")
}
```

- when문

```kotlin
// when 문
val whether = 15
when(whether) {
    -20 -> { println("매우 추운 날씨")}
    11, 12, 13, 14 -> { println("쌀쌀한 날씨")}
    in 15 .. 26 -> { println("활동하기 좋은 날씨")}

    // 범위 안에 안 들어가는 경우
    !in -30..50 -> { println("잘못된 값입니다. -30 ~ 50 가운데 값을 적어주세요")}
    else -> { println("잘 모르겠는 값")} // 위 경우가 모두 아닐 때
}

val essayScore = 95
val grade = when(essayScore) {
    in 0..40 -> "D"
    in 41..70 -> "C"
    in 71..90 -> "B"
    else -> "A"
}
println("에세이 학점: $grade")
```

### 컬렉션

- 리스트

```kotlin
// 1. 리스트
val numImmutableList = listOf(1, 2, 3)
// numImmutableList[0] = 2

val numMutableList = mutableListOf(1, 2, 3)
numMutableList[0] = 100
println(numMutableList)
println(numMutableList[0])

println(numMutableList.contains(1))
println(numMutableList.contains(2))
```

- 셋

```kotlin
// 2. 셋
// 읽기 전용 셋
val immutableSet = setOf(1, 1, 2, 2, 2, 3, 3)
println(immutableSet)

// 읽기 쓰기 모두 가능한 셋
val mutableSet = mutableSetOf(1, 1, 2, 3, 3, 3)
mutableSet.add(100)
mutableSet.remove(1)
mutableSet.remove(200) // false
println(mutableSet)
println(mutableSet.contains(1))
```

- 맵

```kotlin
// 3. 맵
// 읽기 전용 맵
val immutableMap = mapOf("name" to "junsu", "age" to 13, "age" to 15 ,"height" to 160)
println(immutableMap)

// 읽기 쓰기 모두 가능한 맵
val mutableMap = mutableMapOf("돈까스" to "일식", "짜장면" to "중식", "김치" to "중식")
mutableMap.put("막국수", "한식")
mutableMap.remove("돈까스")
mutableMap.replace("김치", "한식")
println(mutableMap)
```

### 클래스

- 클래스 선언 및 객체 생성

```kotlin
class Car(val color: String)

val car = Car("red")
println("My car color is ${car.color}")
```

- 주 생성자

```kotlin
// 주 생성자
class Person1 constructor(name: String) {}
class Person2(name: String) {}
class Person3(val name: String) {}
```

- 보조 생성자

```kotlin
// 보조 생성자
class Person4 {
    constructor(age: Int) {
        println("I'm $age years old")
    }
}

class Person5(name: String) {
    constructor(name: String, age: Int): this(name) {
        println("I'm $age years old")
    }
}
```

- 초기화 블록

```kotlin
// 초기화 블록
class Person6(name: String) {
    val name: String
    init {
        if (name.isEmpty()) {
            throw IllegalArgumentException("이름이 없어요")
        }
        this.name = name
    }
}

// val newPerson = Person6("") // 에러
val newPerson = Person6("강은구")
```

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/62fef7c4-5f67-4569-bd4f-3de9a3f6bc36)

- 클래스 상속
    - 클래스를 상속받으려면 부모 클래스에 open 키워드 추가
    - 메서드도 자식 클래스에서 오버라이드하려면 부모 클래스의 메서드에 open 키워드 추가

```kotlin
// 클래스 상속
open class Flower {
    open fun waterFlower() {
        println("water flower")
    }
}

class Rose: Flower() {
    override fun waterFlower() {
        super.waterFlower()
        println("Rose is happy now")
    }
}

val rose = Rose()
rose.waterFlower()
```

- 컴패니언 객체
    - static 키워드처럼 객체를 만들지 않고도 접근이 가능하게 함

```kotlin
class Dinner {
    companion object {
        val MENU = "pasta"
        fun eatDinner() {
            println("$MENU is yummy!")
        }
    }
}

println(Dinner.Companion.MENU)
println(Dinner.MENU)
Dinner.eatDinner()
```

- 추상클래스
    - abstract 키워드

```kotlin
abstract class Game {
    fun startGame() {
        println("게임을 시작했습니다")
    }
    
    abstract fun printName()
}

class Overwatch: Game() {
    override fun printName() {
        println("오버워치입니다.")
    }
}

val overwatch = Overwatch()
overwatch.startGame()
overwatch.printName()
```

- 데이터 클래스
    - 특정 메서드의 실행보다 데이터 전달의 목적
    - 주 생성자에는 반드시 val이나 var를 사용한 프로퍼티 정의가 적어도 하나 이상 필요
    - 각각의 프로퍼티에 대한 toString(), copy()와 같은 메서드를 자동으로 만들어 줌

```kotlin
data class Memo(val title: String, val content: String, var isDone: Boolean)
var memo1 = Memo("마트 가기", "계란, 우유, 빵", false)
var memo2 = memo1.copy(content="칫솔, 과자")

println(memo1.toString())
println(memo2.toString())
println(memo1)
println(memo2)
```

### 인터페이스

- 클래스들이 같은 기능을 수행하게끔 강제함
- 인터페이스를 구현하는 모든 클래스는 반드시 인터페이스의 모든 메소드를 오버라이드하여 구현해야 함

```kotlin
// 인터페이스
interface Car {
    abstract fun drive()
    fun stop() // abstract 생략 가능 (body가 없다면 abstract이기에)
    fun destroy() = println("차가 파괴되었습니다")
}

// 인터페이스 구현
class Ferrari: Car {
    override fun drive() {
        println("페라리가 달립니다.")
    }
    
    override fun stop() {
        println("페라리가 멈춥니다")
    }
}

val myFerrari = Ferrari()
myFerrari.drive()
myFerrari.stop()
myFerrari.destroy()
```

- 다중 인터페이스 구현
    - 한 클래스에서 클래스는 단 한 개만 상속받을 수 있지만 인터페이스는 두 개 이상 구현할 수 있다

```kotlin
// 다중 인터페이스 구현
interface Animal {
    fun breath()
    fun eat()
}

interface Human {
    fun think()
}

class Korean: Animal, Human {
    override fun breath() {
        println("후-하 후-하")
    }

    override fun eat() {
        println("한식을 먹다")
    }

    override fun think() {
        println("생각하기..")
    }
}

val tori = Korean()
tori.breath()
tori.eat()
tori.think()
```

- 클래스 상속과 인터페이스 구현
    - 추가로 클래스를 상속받을 수 있다
        - 다중 상속을 지원하지 않으므로 단 한 개의 클래스만 상속 가능
        - 부모 클래스 생성자에 필요한 인수는 자식 클래스 생성자에서 전달해주어야 함

```kotlin
interface Animal {
    fun breath()
    fun eat()
}

interface Human {
    fun think()
}

open class Name(val name: String) {
    fun printName() {
        println("제 이름은 $name")
    }
}

class Korean(name: String): Name(name), Animal, Human {
    override fun breath() {
        println("후-하 후-하")
    }

    override fun eat() {
        println("한식을 먹다")
    }

    override fun think() {
        println("생각하기..")
    }
}

val tori = Korean("상은")
tori.breath()
tori.eat()
tori.think()
tori.printName()
```

### Null 처리하기

- 기본적으로는 객체는 null이 될 수 없음
- 명시적으로 null 값이 허용되도록 만들 수 있음
    - ? 기호
- myName에 null이 들어갈 수 있기 때문에 런타임 오류를 예방

```kotlin
var myName: String? = null
myName = "tori"
// println(myName.reversed()) // 에러 발생
```

- 셰이프 콜 연산자 **?**
    - ? 연산자를 이용해 메서드 호출, 혹은 객체 프로퍼티 접근과 null 체크 가능
    - 만약 객체 참조가 null이면 세이프 콜 연산자의 반환값은 null이 됨

```kotlin
fun reverseName(name: String?): String? {
    return name?.reversed()
}
println(reverseName("joyce"))
println(reverseName(null))
```

- 엘비스 연산자 **?:**
    - 셰이프 콜 시에 null을 반환하지 않고 기본값 반환

```kotlin
fun reverseName(name: String?): String? {
    return name?.reversed() ?: "이름을 확인해주세요"
}
println(reverseName("joyce"))
println(reverseName(null))
```

- 확정 연산자 **!!**
    - 절대 null이 아님을 보증하는 연산자
    - null이 가능한 자료형이지만 절대 null이 아니니까 확정함

```kotlin
fun reverseName2(name: String?): String? {
    return name!!.reversed()
}
println(reverseName2("joyce"))
// println(reverseName2(null)) // 에러
```

- lateinit 키워드와 lazy 키워드
    - lateinit
        - var로 선언한 변수의 늦은 초기화를 도움
        - 기본적으로 모든 변수는 null이 아니기에 반드시 선언과 동시에 초기화해야 하지만 값은 나중에 넣고 싶을 때 사용
        - 주의사항
            - var 변수에만 사용
            - nullable 자료형과 함께 사용할 수 없음
            - 초기화 전에 변수를 사용하면 에러 발생
            - 원시자료형(Int, Double, Float 등)에는 사용 불가능
            - ::변수명.isInitialized() 함수로 초기화여부 확인 가
        
        ```kotlin
        // lateinit
        lateinit var lunch: String
        println(::lunch.isInitialized)
        
        lunch = "waffle"
        println(::lunch.isInitialized)
        println(lunch)
        ```
        
    - lazy
        - val로 선언한 상수의 늦은 초기화를 도움
        - 객체가 생성될 때 초기화되지 않고 처음 호출될 때 lazy{} 안의 코드가 실행되며 초기화됨
        
        ```kotlin
        // lazy
        val lazyBear: String by lazy {
            println("곰이 일어났습니다.")
            "bear"
        }
        
        println(lazyBear) // lazy 블록 실행됨
        println(lazyBear) // 이미 초기화되었으므로 블록 실행 안 됨
        ```
        

### 람다식

- 값처럼 다룰 수 있는 익명 함수

```kotlin
val sayHello = fun() { println("안녕하세요.") }
sayHello()

val squareNum: (Int) -> (Int) = { number -> number*number }
println(squareNum(12))

val squareNum2 = { number: Int -> number * number}
println(squareNum2(3))

val squareNum3: (Int) -> Int = { it * it } // 인수가 한 개일 때
println(squareNum3(10))
```

- 람다식을 함수의 인수로 받기

```kotlin
fun invokeLambda(lambda: (Int) -> Boolean): Boolean {
    return lambda(5)
}

val paramLambda: (Int) -> Boolean = { num -> num == 10 }
println(invokeLambda(paramLambda))
println(invokeLambda({ num -> num == 10 }))
println(invokeLambda( { it == 10 }))
println(invokeLambda{it == 10})
```

- SAM(Single Abstract Method) 변환
    - 람다식이 아님에도 람다식처럼 취급할 수 있는 경우
        
        ```kotlin
        button.setOnClickListener {
        	// 버튼이 눌렸을 때 작동할 코드
        }
        ```
        
        - 조건
            - 코틀린 인터페이스가 아닌 자바 인터페이스여야 할 것
            - 인터페이스 내에는 딱 한 개의 추상 메서드만 존재할 것
    - 예시
        - 람다를 사용하지 않았을 때
        
        ```kotlin
        button.setOnClickListener(object: OnClickListener) {
            override fun onClick(view: View) {
                doSomething()
            }
        }
        ```
        
        - 람다 사용 1
        
        ```kotlin
        button.setOnClickListener({ view -> doSomething() })
        ```
        
        - 람다 사용 2
        
        ```kotlin
        button.setOnClickListener() { doSomething() }
        ```
        
        - 람다 사용 3
        
        ```kotlin
        button.setOnClickListener { doSomething() }
        ```