## 20. Servlet & JSP

### Tomcat 다운로드

- https://tomcat.apache.org/download-90.cgi
- conf > server.xml에서 포트 번호와 URIEncoding="UTF-8” 설정 추가

    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/b728cbe5-8345-4b5d-9730-c8cbe4745f34)

- Eclipse에서 서버 설정 추가 (JRE: jdk-17.0.8 / 다운로드한 경로 넣어주기)
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/8d970532-9a33-4fea-8d52-4d038f1bff99)
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/362e5d74-8078-4f71-9844-c121d411e963)
    
- [Window] → [Preferences]에서 [Web] 쪽의 HTML, CSS, JSP 파일 인코딩 UTF-8로 변경
    - 기본 파일 생성 시 입력한 인코딩 정보가 표현식으로 들어감

### JSP 이용하기

- Dynamic Web Project 생성하기
- Run as → [1 Run on Server] 으로 index.jsp 실행하기
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/31c8a91f-4e2f-417b-aeb8-8eed8932da27)
    

### Servlet

- 원래 자바의 클래스
- jsp는 내부에서 자바 파일로 바뀐 후에 실행됨
    - `C:\dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\03-1.web_basic_jsp\org\apache\jsp`
    - 해당 경로에서 java 파일 확인 가능
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/22f07e69-1429-44f2-9033-c1e4a3edec59)

### Java Servlet 클래스를 직접 만들어 웹 페이지 구성하기

- Servlet: HttpServlet를 상속 받은 Java 클래스
- HttpServlet의 service의 request를 통해 브라우저의 정보를 받을 수 있고, response를 통해 브라우저에 전달 가능

```java
public class HelloServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter(); // response 객체 stream을 얻을 수 있음
		out.println("<html>");
		out.println("<head><title>first servlet</title></head>");
		out.println("<body><h1>Hello Servlet</h1></body>");
		out.println("</html>");
		out.flush();
		out.close();
		// 이 파일을 웹 서버가 인식할 수 있도록 함 -> web.xml에서 설정 필요
	}
}
```

```xml
<servlet>
	<servlet-name>helloServlet</servlet-name>
	<servlet-class>basic.HelloServlet</servlet-class>
</servlet>

<servlet-mapping>
	<servlet-name>helloServlet</servlet-name>
	<url-pattern>/helloServlet</url-pattern>
</servlet-mapping>
```


### PuTTY 셋팅 후 요청과 응답 확인하기

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/079ac202-9413-4005-b14f-71e2099e4d82)

- 서버 설정으로 기본 path로 설정 바꿔주기
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/f9c80daf-d9df-4bda-8ebf-ef34d1012471)
    

- 처음 접속이 된다면 GET 방식으로 /index.jsp 요청할 것
    
    ```
    GET /index.jsp HTTP/1.1
    Host: localhost:80
    ```
    
- 응답 확인
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/19071fa8-b4da-4e22-b1ca-4d139f74aa25)
    
    ```
    HTTP/1.1 200
    Set-Cookie: JSESSIONID=B05E5E57EDC52A0E80805A5163A5C23D; Path=/; HttpOnly
    Content-Type: text/html;charset=UTF-8
    Content-Length: 169
    Date: Mon, 13 Nov 2023 02:36:28 GMT
    ```
    
    - Set-Cookie: JSESSIONID=B05E5E57EDC52A0E80805A5163A5C23D
        - 브라우저가 쿠키 정보를 가지게 됨
        - 로그인한 상태에서 세션이 저장되었다면 어디서든 키를 통해 접속 가능
    - Content-Length: 169
        - 컨텐츠의 정보를 항상 보내줌
        - POST로 보낼 때에도 정보를 적어줘야 함
- GET 방식 테스트 (basic/form.jsp, basic/process.jsp)
    
    ```
    GET /basic/process.jsp?name=jungdaeman HTTP/1.1
    Host: localhost:80
    ```
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/13bff3e7-b718-44d5-955d-2930077aea19)
    
- POST 방식 테스트 (basic/form.jsp, basic/process.jsp)
    
    ```
    POST /basic/process.jsp HTTP/1.1
    Host: localhost:80
    Content-type: application/x-www-form-urlencoded
    User-agent: Mozilla/5.0
    Content-Length: 15
    
    name=jungdaeman
    ```
    
- HTTP 요청이 오면 요청에 대한 분석 진행 (WAS)
- 내부에 인스턴스 생성
- 앞부분을 ningix 를 이용하여 라우팅 역할이나 스트리밍 등을 처리할 수 있도록 함
- POST
    - 내용을 숨길 수 있을 때
- GET 방식 2000자 제한?
    - 과거 256바이트 제한

### Servlet 설정하기

- annotation 으로 서블릿 연결 설정을 해줄 수도 있음

```
@WebServlet(urlPatterns = "/helloServlet")
```

- load-on-startup 옵션
    - 생성자와 init을 수행 (메모리에 미리 로드)
        - 이후 메소드 처리 시 수행 속도가 빠름
    - 여러 개의 Servlet이 load-on-startup을 양수로 가질 경우 작은 수를 가진 Servlet의 우선순위가 높음
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/cd781be1-3cdb-4745-b548-94b7696a6b18)
        
        - service에 정의된 함수는 메소드(GET, POST, PUT, DELETE)에 상관 없이 같은 컨텐츠를 제공
    - annotation으로도 설정 가능
        
        ```java
        @WebServlet
        (urlPatterns = "/helloServlet",
        loadOnStartup = 10)
        ```
        

### JSP

- Servlet과 JSP 차이
    - Servlet
        - Java 언어 중심적 동적 파일
        - HTML 응답을 생성하기보다는 바이너리 응답을 생성
        - 요청 흐름을 제어하는 역할을 주로 함
    - JSP
        - 태그 중심적 동적 파일
        - HTML 응답을 생성하여 클라이언트에 보내는 역할
        - 클라이언트의 프레젠테이션이 목적
- JSP 실행 원리
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/74897d39-9638-4d55-a911-9ecd55dc8655)

### @include 지시문으로 파일 분리하기

- <%@include file=”포함할 파일의 URL”%>
- 부분마다 file을 include하여 대체할 수 있음
    
    ```html
    <table style="width: 1180px">
    	<tr>
    		<td colspan = "2" style="height: 150px; background-color:yellow"><%@ include file="top.jsp" %></td>
    	</tr>
    	<tr>
    		<td style="width: 250px; background-color:red; height: 450px"><%@ include file="menu.jsp" %></td>
    		<td style="background-color:green;"><%@ include file="content.jsp" %></td>
    	</tr>
    </table>
    ```
    
- main.jsp에서 정의한 변수를 분할된 파일에서 사용도 가능함
    - plugin 폴더 내 실제로 generate 된 java 파일을 확인하면 세 파일이 하나로 합쳐져 컴파일된 것을 확인 가능
    - `C:\dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\ROOT\org\apache\jsp\include\main_jsp.java`

### JSP 표준 Action

- 자주 사용하는 자바 코드를 표준 태그화
- XML 문법에 맞추어 작성
- JSP 표준 Action 종류
    - jsp:include
    - jsp:forward
        - redirect와의 차이점
            - request 객체 재사용
            - 상단 URL이 바뀌지 않음
            - 컨테이너 안에서 forward 해석을 하므로서 forward한 곳의 자원을 이용하여 응답을 만들어 보내게 됨
    - jsp:param
    - jsp:useBean
    - jsp:setProperty
    - jsp:getProperty

### JSP 표준 Action으로 JSP 파일 분리하기

```html
<table>
<tr>
   <td colspan="2" id="top"><jsp:include page="top.jsp" /></td>
</tr>
<tr>
   <td id="menu"><jsp:include page="main.jsp" /></td>
   <td id="content"><jsp:include page="content.jsp" /></td>
</tr>
</table>
```

- 완벽한 모듈화 (내부에서 별개로 존재함)
- 브라우저에 각각 따로 전달됨
    - 서로 다른 페이지로 존재하기에 main.jsp → top.jsp 변수 사용이 불가능
    - parameter로 전달 필요 → request, response가 내장되어 top.jsp에서는 내장 객체 사용 가능
        
        ```html
        <!-- main.jsp -->
        <table>
        <tr>
        	<td colspan="2" id="top">
           		<jsp:include page="top.jsp">
           			<jsp:param value="<%=msg%>" name="msg" /> 
           		</jsp:include>
        	</td>
        </tr>
        <tr>
           <td id="menu"><jsp:include page="menu.jsp" /></td>
           <td id="content"><jsp:include page="content.jsp" /></td>
        </tr>
        </table>
        ```
        
        ```html
        <!-- top.jsp -->
        <body>
        <h1 style="color: white;">top</h1>
        <%
        	String msg = request.getParameter("msg");
        	out.println(msg);
        %>
        </body>
        ```
        
- “안녕하세요~” 가 제대로 출력되지 않아 인코딩 설정하기
    
    ```html
    <!-- main.jsp -->
    <%
    	request.setCharacterEncoding("UTF-8");
    	String msg = "안녕하세요~";
    %>
    ```
    
    ```html
    <!-- top.jsp -->
    <%
    	request.setCharacterEncoding("UTF-8");
    	String msg = request.getParameter("msg");
    	out.println(msg);
    %>
    ```
    
    - 매번 encoding 설정을 하기 번거로우니 필터로 설정할 수 있음
        
        ```xml
        <!-- web.xml -->
        
        <filter>
        	<filter-name>character encoding</filter-name>
        	<filter-class>org.apache.catalina.filters.SetCharacterEncodingFilter</filter-class>
        	<init-param>
        		<param-name>encoding</param-name>
        		<param-value>UTF-8</param-value>
        	</init-param>
        </filter>
        <filter-mapping>
        	<filter-name>character encoding</filter-name>
        	<url-pattern>/*</url-pattern>
        </filter-mapping>
        ```
        

### 필터 만들기

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/4ee2a419-611a-473a-a3a3-643d4d3e175b)

- [util/CharacterEncodingFilter.java 소스코드](https://github.com/sangeun99/hyundai-it-e-java-fullstack/tree/master/03-1.web_basic_jsp/src/main/java/util/CharacterEncodingFilter.java)

```java
@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hrequest = (HttpServletRequest) request;
		hrequest.setCharacterEncoding("UTF-8");
		chain.doFilter(request, response);
	}
```

### form문 처리하기

- checkbox, radio의 경우 체크된 항목이 없을 경우 키 값 자체도 넘어오지 않음
- getParameter(), getParameterValues()로 파라미터 받아오기
    
    ```java
    <%
    	String name = request.getParameter("name");
    	String phone = request.getParameter("phone");
    	String field = request.getParameter("field");
    	String[] hobbies = request.getParameterValues("hobby");
    	String motive = request.getParameter("motive");
    %>
    ```
    
- getParameterMap()로 Key, Value로써 파라미터 받아오기
- JSP Action을 이용해 파라미터 받아오기
    - class에 field와 getter, setter를 정의하고 JSP에서 이를 사용하도록 함
        
        ```html
        <%@ page language="java" contentType="text/html; charset=UTF-8"
            pageEncoding="UTF-8"%>
        <jsp:useBean id="reserv" class="beans.Reservation" scope="page" />
        <jsp:setProperty property="*" name="reserv" />
        <!DOCTYPE html>
        <html>
        <head>
        <meta charset="UTF-8">
        <title>예약 확인</title>
        </head>
        <body>
        name : <%= reserv.getName() %> <br/>
        phone : <%= reserv.getPhone() %> <br/>
        email : <%= reserv.getEmail() %> <br/>
        </body>
        </html>
        ```
        

### JSTL 사용하기

- 다운로드
    - https://tomcat.apache.org/download-taglibs.cgi
    - *.jar 파일 네 개 다운로드 후 webapp/WEB-INF/lib에 저장하기
- JSTL
    - JSP 표준 라이브러리
    - JSP에서 반복과 조건, 테이터 관리 포맷, XML 조작, 데이터베이스 접근 등을 구현하는 커스텀 태그 라이브러리 모음
    - EL(Expression Language)을 이용하여 표현
        - ${ i }
        - escape문
            - \${ 10 + 5 }
- JSTL 라이브러리 선언
    - `<%@ taglib uri=*"http://java.sun.com/jsp/jstl/core"* prefix=*"c"*%>`
- 주요 태그
    - <c:set>
        - 변수 선언
        - `<c:set var=*"i"* value=*"10"* />`
    - <c:out>
        - 출력
        - `<c:out value=*"*${ i }*"*/>`
    - <c:forEach>
        - `<c:forEach items="${list}" var="mem">`
        - list 안을 변수 mem으로 접근

### JSP 뷰에서 java 배열 전달받기

- Member class 생성하여 편하게 접근하도록 하기
    - [Member.java 소스코드](https://github.com/sangeun99/hyundai-it-e-java-fullstack/tree/master/03-1.web_basic_jsp/src/main/java/basic/JstlServlet.java)
- JstlServlet.java에서 배열 만들어서 인스턴스 생성 후에 배열에 넣어주기.
    - [JstlServlet.java 소스코드](https://github.com/sangeun99/hyundai-it-e-java-fullstack/tree/master/03-1.web_basic_jsp/src/main/java/basic/JstlServlet.java)
    - 배열 정보만 jsp 파일에 넘겨주도록 함 (forward 이용해 /JstlServlet 위치에 /jstl/view.jsp 뷰가 보이도록 설정)
        
        ```java
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jstl/view.jsp");
        dispatcher.forward(request, response);
        ```
        
    - [view.jsp 소스코드](https://github.com/sangeun99/hyundai-it-e-java-fullstack/tree/master/03-1.web_basic_jsp/src/main/webapp/jstl/view.jsp)

### MVC 패턴 실습

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/2a799460-2ded-4dbb-aafe-34e85b389d8f)
- `http://ip/contextPath/list?pg=10`
- MVC 컴포넌트의 기능
    - 컨트롤러
        - 폼 액션이나 링크 클릭등을 통하여 사용자가 요청하는 액션을 받아들여서 모델과 뷰를 통해서 요청을 처리한 후 응답한다.
    - 뷰
        - 모델은 뷰가 렌더링하는데 필요한 데이터이다. 예를 들면 게시판 리스트에 출력하기 위한 게시물 목록이 모델에 해당한다.
    - 모델
        - 실제로 유저에게 보여주기위한 화면이며 모델을 이용하여 렌더링을 한다. JSP, XML, JSON, PDF 등으로 웹 페이지를 표현한다.

### Controller, ModelAndView로 역할 분리하기

- Controller
    - AbstractController 상속 받아서 handleRequestInternal 추상함수 정의하도록 설정
    - ModelAndView를 리턴
- ModelAndView
    - jsp(뷰)에 object를 담아서 보낼 수 있도록 함

### uri마다 인스턴스 지정할 필요 없이 파일로 관리

- `*.properties`에 새로운 뷰와 Java 클래스 매핑하여 저장
    
    ```
    /pilot/form=pilot.controller.FormController
    /pilot/process=pilot.controller.ProcessController
    ```
    
- `*.properties` 정보를 읽어서 class를 정하고 인스턴스를 생성하도록 함

### 간단한 CRUD 구현하기

- Article 테이블 생성
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/606d97c6-81fc-406c-b31c-284f8d870206)
    
- `ojdbc11.jar` 라이브러리로 불러오기

    | ACTION | CLASS | ROLE |
    | --- | --- | --- |
    | CREATE |  |  |
    | /article/insert | article.controller.ArticleInsert | 게시물 입력 폼 출력 |
    | /article/insertAction | article.controller.ArticleInsertAction | 게시물 생성. 입력 폼에서 전송된 파라미터를 테이블에 저장 |
    | READ |  |  |
    | /article/list | article.controller.ArticleList | 게시물 리스트 출력 |
    | /article/article?no=10 | article.controller.ArticleDetail | 게시물 상세보기 |
    | UPDATE |  |  |
    | /article/update?no=10 | article.controller.ArticleUpdate | 게시물 수정 폼 출력 (입력된 게시물 내용 출력) |
    | /article/updateAction?no=10 | article.controller.ArticleUpdateAction | 게시물 수정. 수정 폼에서 전송된 파라미터로 테이블에 수정 |
    | DELETE |  |  |
    | /article/delete?no=10 | article.controller.ArticleDelete | 게시물 삭제 폼 출력 (입력된 게시물 내용 출력) |
    | /article/deleteAction?no=10 | article.controller.ArticleDeleteAction | 게시물 삭제. 삭제 폼에서 전송된 파라미터로 테이블에 수정 |

### 로그 찍기

- `*.jar` 라이브러리로 가져오기

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/e612cf08-1886-425f-b3fc-673d372625cc)

- annotation을 이용해 사용하기
    - @Log4j
- `log.info(articleDTO);`

### ArticleService, ArticleDAO, ArticleDTO 사용하여 역할 분리하기

- ArticleService
    - 관리자가 비즈니스 로직을 수행하며 로그, 메세지를 찍음
- ArticleDAO
    - Data Access Object
    - 데이터에 직접 접근하고 데이터 조작을 실행함
- ArticleDTO
    - Data Transfer Object
    - 계층간 데이터 교환만 실행