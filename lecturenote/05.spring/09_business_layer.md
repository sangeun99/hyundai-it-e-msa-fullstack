## Chapter 09. 비즈니스 계층

### 비즈니스 계층

- 고객의 요구사항을 반영하는 계층
- 프레젠테이션 계층과 영속 계층의 중간 다리 역할
- “서비스”라는 용어를 사용한 객체

### BoardService 인터페이스와 BoardServiceImpl 클래스 구현

- BoardService 인터페이스를 상속 받은 BoardServiceImpl 클래스
    - @Service 어노테이션을 이용해 주로 비즈니스 영역을 담당하는 객체임을 표시
    - BoardMapper를 가짐
        - @Autowired를 이용해 객체 이용
- 이들을 스프링의 빈으로 인식하게 하기 위해 root-context.sml에 @Service 어노테이션이 있는 패키지를 스캔하도록 추가함
    
    ```xml
    <context:component-scan base-package="net.developia.spring03.service"></context:component-scan>
    ```
    
- 기존에 Mapper에서만 작업했던 CRUD 작업을 Service, Mapper 역할로 각각 나눔
- 소스코드: net.developia.spring03.service의 BoardService, BoardServiceImpl
- 테스트코드로 확인 BoardServiceTests