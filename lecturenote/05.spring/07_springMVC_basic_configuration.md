# Part 3. 기본적인 웹 게시물 관리

## Chapter 07. 스프링MVC프로젝트의 기본 구성

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/7e83d552-45a7-419d-aa42-753a010ece4d)

- xxxController
    - 스프링MVC에서 동작하는 Controller 클래스를 설계
- xxxService, xxxServiceImpl
    - xxxService
        - 비즈니스 영역을 담당하는 인터페이스
    - xxxServiceImpl
        - 인터페이스를 구현한 클래스
- xxxDAO, xxxRepository
    - 책에서는 별도의 DAO 구성 대신 MyBatis의 Mapper 인터페이스를 활용
- VO, DTO
    - 데이터를 담고 있는 객체
    - VO
        - 주로 Read Only의 목적이 강함
        - 데이터 자체도 Immutable하게 설계
    - DTO
        - 주로 데이터 수집의 용도