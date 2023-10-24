## 8장. 클래스 외부 구성요소

### 패키지와 임포트

(자바에서 모든 환경에서 돌아가는 언어를 만들기위해 노력하지만 어려운 부분도 있음)

- 다른 패키지에서 사용하려면 public class로 선언해야 함
- 인스턴스 생성 시 경로를 전부 넣고 생성하는 방법도 있음 (잘 사용하지 않음)

- 내가 작성한 클래스를 내보내기
- *.jar로 저장됨
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/829a3e9e-caa5-4fe5-8cf9-3024374224d7)
    

- 가져다쓸 수 있음
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/65c53756-f78c-4854-a4ef-3c23255c72d9)
    
- 이후에 import해서 사용
    
    ```java
    import exam.lib.Dice;
    ```
    

### 외부 클래스

- 패키지 내부에서만 접근 가능. 다른 클래스에서는 접근 불가능