## 4장. 제어문과 제어키워드

- 조건문
    - if, switch
- 반복문
    - for, while, do-while
- 기타제어문
    - continue, break

### 입력 받기

```java
Scanner sc = new Scanner(System.in);
System.out.print("0~100 사이의 점수를 입력>");
int score = sc.nextInt();
```

JRE 로딩될 때 java.lang 패키지를 자동으로 로드함

여기에 들어있는 것들은 import 하지 않아도 됨 (예시: String)

`ctrl + shift + o` 한번에 import 가능함 but 유사한 패키지가 다른 클래스에 있다면 불가능