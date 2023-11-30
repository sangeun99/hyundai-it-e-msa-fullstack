## Chapter 06. 스프링 MVC의 Controller

### Controller의 특징

- Spring MVC
- HttpServletRequest, HttpServletResponse를 거의 사용할 필요 없이 필요한 기능 구현
- 다양한 타입의 파라미터 처리, 다양한 타입의 리턴 타입 사용 가능
- GET 방식, POST 방식 등 전송 방식에 대한 처리를 어노테이션으로 처리 가능
- 상속/인터페이스 방식 대신에 어노테이션만으로도 필요한 설정 가능

### @Controller, @RequestMapping

```java
package net.developia.spring02.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	@RequestMapping("")
	public void basic() {
		log.info("basic.....");
	}
}
```

```xml
<context:component-scan base-package="net.developia.spring02.controller" />
```

- SampleController의 클래스 선언부에 @Controller로 선언
- server-context.xml에 context:component-scan으로 해당 클래스를 인식하도록 함
- @RequestMapping으로 경로를 지정
    - method 속성을 직접 정의할 수도 있음
    - `@RequestMapping(value="/basic", method = {RequestMethod.GET, RequestMethod.POST})`

### Controller의 파라미터 수집(바인딩)과 변환

- @RequestParam 어노테이션을 이용해 자동으로 파라미터를 수집할 수 있음
- 기본으로 String으로 들어오지만 parameter 타입으로 자동으로 변환해 줌
    
    ```java
    @GetMapping("/ex02")
    public String ex02(@RequestParam("name") String name, @RequestParam("age") int age) {
    	log.info("name:" + name);
    	log.info("age:" + age);
    	return "ex02";
    }
    ```
    
- `프로젝트경로/sample/ex02List?ids=111&ids=222&ids=333`으로 호출된다면 ArrayList나 배열 타입으로 처리 가능
    
    ```java
    @GetMapping("/ex02List")
    public String ex02List(@RequestParam("ids") ArrayList<String> ids) {
    	log.info("ids: " + ids);
    	return "ex02List";
    }
    
    @GetMapping("/ex02Array")
    public String ex02Array(@RequestParam("ids")String[] ids) {
    	log.info("array ids: " + Arrays.toString(ids));
    	return "ex02Array";
    }
    ```
    

### @InitBinder를 이용해 바인딩하기 (String → java.util.Date)

- @InitBinder 정의
    
    ```java
    @InitBinder
    public void initBinder(WebDataBinder binder) {
    	SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-mm-dd");
    	binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dataFormat, false));
    }
    ```
    
- `http://localhost/spring02/sample/ex03?title=test&dueDate=2018-01-01` 같은 방식으로 호출 시 로그
    
    ```
    11월 30, 2023 11:50:28 오전 net.developia.spring02.controller.SampleController ex03
    정보: todo: TodoDTO(title=test, dueDate=Mon Jan 01 00:01:00 KST 2018)
    ```
    

### @ModelAttribute 어노테이션

- Model
    - 파라미터로 전달된 데이터는 존재하지 않지만 화면에서 필요한 데이터를 전달하기 위해 사용
- 스프링MVC의 Controller는 기본적으로 Java Beans 규칙에 맞는 객체는 다시 화면으로 객체를 전달
    - Java Beans
        - 생성자가 없거나 빈 생성자를 가져야 함
        - getter/setter를 가진 클래스의 객체
    - Java Beans는 파라미터로 선언 시 화면으로 전달, 기본 자료형은 파라미터로 선언되어도 화면까지 전달되지 않
- 소스코드: spring02/sample/ex04
    
    ```java
    @GetMapping("/ex04")
    public String ex04(SampleDTO dto, int page) {
    	log.info("dto: " + dto);
    	log.info("page: " + page);
    	
    	return "/sample/ex04";
    }
    ```
    
    - SampleDTO는 화면에 전달되고 page는 전달되지 않음
- @ModelAttribute 어노테이션
    - 강제로 전달받은 파라미터를 Model에 담아서 전달하도록 함
        
        ```java
        @GetMapping("/ex04")
        public String ex04(SampleDTO dto, @ModelAttribute("page") int page) {
        	log.info("dto: " + dto);
        	log.info("page: " + page);
        	
        	return "/sample/ex04";
        }
        ```
        

      ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/0322d0c6-3a39-48c9-b840-602fcef23121)

### RedirectAttributes

- 스프링MVC를 이용한 redirect 처리
    
    ```java
    rttr.addFlashAttribute("name", "aaa");
    rttr.addFlashAttribute("age", 10);
    
    return "redirect:/";
    ```
    

### @RestController

```java
@RestController
@RequestMapping("/restful")
```

- @Controller
    - 뷰를 반환하기 위해 사용
- @RestController
    - @Controller에 @ResponseBody가 추가

### Controller의 리턴 타입

- void 타입
    - 호출하는 URL과 동일한 이름의 jsp
- String 타입
    - jsp를 이용하는 경우 jsp 파일의 경로와 파일 이름
- 객체 타입
    - VO나 DTO 등의 객체 → JSON 데이터를 만들어내는 용도
    - jackson-databind 라이브러리를 추가 후 리턴 가능
        
        ```xml
        <dependency>
           <groupId>com.fasterxml.jackson.core</groupId>
           <artifactId>jackson-databind</artifactId>
           <version>2.9.4</version>      	
        </dependency>
        ```
        
- ResponseEntity 타입
    - 현재 상태에 대한 정확한 응답이 필요함
    - 리턴 타입에 ResponseEntity를 이용하고 Generic 처리를 통해 실제 데이터를 담아줌
    - 소스코드: spring02/sample/ex07

### 파일 업로드 처리

- `pom.xml`에 dependency 설정
    
    ```xml
    <dependency>
    	<groupId>commons-fileupload</groupId>
    	<artifactId>commons-fileupload</artifactId>
    	<version>1.3.3</version>
    </dependency>
    ```
    
- 업로드될 폴더 생성
- `servlet-context.xml`의 bean 추가 설정
    
    ```xml
    <!-- file upload -->
    <beans:bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
    	<beans:property name="defaultEncoding" value="utf-8"></beans:property>
    	<beans:property name="maxUploadSize" value="104857560"></beans:property>
    	<beans:property name="maxUploadSizePerFile" value="2097152"></beans:property>
    	<beans:property name="uploadTempDir" value="file:/C:/dev/upload/tmp"></beans:property>
    	<beans:property name="maxInMemorySize" value="10485756"></beans:property>
    </beans:bean>
    ```
    
- 실습할 SampleController의 exUpload(), exUpload.jsp, SampleController의 exUploadPost() 작성
    - SampleController의 exUploadPost()에서 들어온 파일 처리
        
        ```java
        @Controller
        @RequestMapping("/sample/*")
        @Log
        @PropertySource("classpath:sample.properties")
        public class SampleController {
        
        		..
        
        	@Value("${uploadPath}") String uploadPath;
        	@PostMapping("/exUpload")
        	public String exUploadPost(ArrayList<MultipartFile> files) {
        		log.info("/exUploadPost........");
        		
        		files.forEach(file -> {
        			log.info("--------");
        			log.info("name: " + file.getOriginalFilename());
        			log.info("size: " + file.getSize());
        		
        			try {
        				if (file==null) throw new IOException();
        				File filename = new File(uploadPath, file.getOriginalFilename());
        				file.transferTo(filename);			
        				
        			} catch (IOException e) {
        				e.printStackTrace();
        			}
        		});
        		return "sample/exUpload";
        	}
        }
        		
        ```
        
    - `sample.properties`
        
        ```xml
        uploadPath=C:\\dev\\upload
        ```