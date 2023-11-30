## Chapter 10. 프레젠테이션(웹) 계층의 CRUD 구현

### 스프링MVC의 Controller

- 하나의 클래스 내에서 여러 메서드를 작성하고 @RequestMapping을 이용해 URL을 분기할 수 있음
- 하나의 클래스에서 필요한 만큼 메서드의 분기를 이용
- @Controller 어노테이션을 이용해 스프링의 빈으로 인식할 수 있도록 함

### 테스트 코드의 작성

- WAS를 매번 실행하는 단계를 생략하기 위해 스프링의 테스트 기능 활용
- 테스트 클래스의 선언부에 @WebAppConfiguration 어노테이션 적용
    - Servlet의 ServletContext를 이용하기 위함
- @Before 적용된 메소드는 모든 테스트 전에 매번 실행되는 메서드
    - `import org.junit.Before;`

```java
package net.developia.spring03.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
// Test for controller
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTests {
	
	@Autowired
	private WebApplicationContext ctx;
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());				
	}
}
```

- 소스코드: net.developia.spring03.controller의 BoardController
- 테스트코드로 확인 BoardControllerTests