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