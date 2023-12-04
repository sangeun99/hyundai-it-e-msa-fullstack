# Part 4. REST 방식과 Ajax를 이용하는 댓글 처리

## Chapter 16. REST방식으로 전환

- Representatinal State Transfer
- 하나의 URI는 하나의 고유한 리소스를 대표하도록 설계
- URI + GET/POST/PUT/DELETE/…

### REST와 관련해 알아야 할 어노테이션

- @RestController
    - Controller가 REST 방식을 처리하기 위한 것임을 명시
- @ResponseBody
    - 일반적인 JSP와 같은 뷰로 전달되는 게 아니라 데이터 자체를 전달하기 위한 도
- @PathVariable
    - URL 경로에 있는 값을 파라미터로 추출하려고 할 때 사용
- @CrossOrigin
    - Ajax의 크로스 도메인 문제를 해결해주는 어노테션
- @RequestBody
    - JSON 데이터를 원하는 타입으로 바인딩 처리

### @RestController의 반환 타입

- 단순 문자열 반환
    - @Controller는 문자열을 반환하는 경우에 JSP파일로 처리됨
    - @RestController의 경우에는 순수한 데이터
- 객체의 반환
    - JSON, XML
    - SampleVO를 작성하여 실습
- 컬렉션 타입의 객체 반환
- ResponseEntity 타입

### @RestController에서 파라미터

- @PathVariable
    - `sample/{sno}/page/{pno}`
    
    ```java
    @GetMapping("/product/{cat}/{pid}")
    public String[] getPath(
    		@PathVariable("cat") String cat,
    		@PathVariable("pid") Integer pid) {
    	return  new String[] { "category: " + cat, "productid: " + pid};
    }
    ```
    
    - 기본자료형 사용 불가
- @RequestBody
    - 요청의 내용(body)를 이용해 파라미터 타입으로 변환
    
    ```java
    @PostMapping("/ticket")
    public ticket convert(@RequestBody ticket ticket) {
    	log.info("convert....ticket" + ticket);
    	return ticket;
    }
    ```