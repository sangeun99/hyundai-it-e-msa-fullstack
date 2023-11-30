# Part 2. 스프링 MVC 설정

## Chapter 05. 스프링 MVC의 기본 구조

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/ee4d555d-ed05-43dc-81c4-2785ec2095a1)

- 스프링은 하나의 기능을 위해서만 만들어진 프레임워크가 아니라 ‘코어’ 프레임워크에 여러 서브 프로젝트를 결합하도록 새발됨
- 스프링 MVC는 스프링의 서브 프로젝트 중 하나
- 설정 파일 또한 분리되어 관리
    - root-context.xml
        - POJO(Plain Old Java Object)
    - servlet-context.xml
        - Web 관련 영역

### Spring Legacy Project 시작하기

- pom.xml
    - 스프링 버전 5.0.7으로 변경
    - lombok 기능을 위해 정의
    - 서블릿 버전 3.1.0 이상으로 변경
    - Maven 컴파일 옵션 1.8으로 변경
- 이후 [Maven] → [update project]
- Tomcat Modules에서 경로 설정

### 프로젝트의 로딩 구조

- web.xml
    - Tomcat 구동 관련 설정
    - context-param에서 root-context.xml 경로 설정
- root-context.xml
    - 처리 시 파일의 빈 설정이 동작
    - 이곳에 정의된 객체(Bean)들은 스프링의 영역(Context) 안에 생성되고 의존성이 처리됨
- 이후 Dispatcher Servlet과 관련된 설정 동작
    - 스프링MVC 구조에서 가장 핵심적인 역할을 하는 클래스
    - 내부적으로 웹 관련 처리의 준비과정 진행
        - 이 때 servlet-context.xml 처리
- servlet-context.xml 처리 시 등록된 객체(Bean)dms 기존에 만들어진 객체(Bean)들과 같이 연동

### 스프링 MVC의 기본 구조

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/4eaf44d5-021b-4e94-b173-1856aebf6483)


- ① ( 사용자 → DispatcherServlet)
    - 사용자의 Request는 Front-Controller인 DispatcherServlet을 통해서 처리
    - web.xml을 살펴보면 모든 Request는 DispatcherServlet이 받도록 처리함을 알 수 있음
        
        ```xml
        <!-- Processes application requests -->
        <servlet>
        	<servlet-name>appServlet</servlet-name>
        	<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        	<init-param>
        		<param-name>contextConfigLocation</param-name>
        		<param-value>/WEB-INF/spring/appServlet/servlet-context.xml</param-value>
        	</init-param>
        	<load-on-startup>1</load-on-startup>
        </servlet>
        	
        <servlet-mapping>
        	<servlet-name>appServlet</servlet-name>
        	<url-pattern>/</url-pattern>
        </servlet-mapping>
        ```
        
- ② (DispatcherServlet → HandlerMapping) ③ (DispatcherServlet → HandlerAdapter)
    - HandlerMapping
        - Request의 처리를 담당하는 컨트롤러를 찾음
        - 이 인터페이스를 구현 한 객체 중 RequestMappingHandlerMappingdms @RequestMapping 어노테이션이 적용된 것을 기준으로 판단
    - HandlerAdapter
        - 적당한 컨트롤러를 찾았다면 해당 컨트롤러를 동작
- ④ (HandlerAdapter → Controller)
    - Controller
        - 개발자가 작성하는 클래스
        - 실제 Request를 처리하는 로직을 작성
        - View에 전달해야하는 데이터는 주로 Model이라는 객체에 담아서 전달
        - 다양한 타입에 대한 결과를 반환하면 이 처리를 ViewResolver가 함
- ⑤ (DispatcherServlet → ViewResolver)
    - ViewResolver
        - Controller가 반환한 결과를 어떤 View를 통해서 처리할지 해석
        - 가장 흔한 설정은 `servlet-context.xml`에 정의된 InternalResourceViewResolver
            
            ```xml
            <!-- Resolves views selected for rendering by @Controllers to .jsp resources in the /WEB-INF/views directory -->
            <beans:bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
            	<beans:property name="prefix" value="/WEB-INF/views/" />
            	<beans:property name="suffix" value=".jsp" />
            </beans:bean>
            ```
            
- ⑥ (DispatcherServlet → View) ⑦ (DispatcherServlet → 사용자)
    - View
        - 실제로 응답 보내야 하는 데이터를 jsp 등을 이용해 생성
        - 만들어진 응답은 DispatcherServlet을 통해서 전송