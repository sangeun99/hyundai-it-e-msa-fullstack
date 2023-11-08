## 05. 입력 양식 작성하기

### 폼 태그 &lt;form>

- 폼과 관련한 작업은 데이터베이스를 기반으로 작동
- 폼 형태는 HTML 태그로 만들지만, 폼에 입력한 정보는 서버 프로그래밍을 이용해 처리함
- 속성
    - method
        - get
        - post
    - name
        - 폼의 이름
    - action
        - 태그 나용을 처리할 서버 프로그램 지정
    - target
        - 지정된 스크립트 파일을 다른 위치에서 열도록 함

### 폼 요소 그룹으로 묶기

- &lt;fieldset>
    - 하나의 폼 안에서 여러 구역을 나누어 표시
    - 예) 개인 정보와 배송 정보를 나누어 표시
- &lt;legend>
    - &lt;fieldset>의 이름을 붙임

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/c7d996c8-99ab-4cd4-a09b-ce18859c2ec2)

### 사용자 입력을 위한 input 태그

- &lt;label>
    - 폼 요소에 레이블을 붙임
    - id 속성값을 &lt;label>의 for 속성으로 알려주어 연결함
- type=”text”, type=”password”
- type=”search”, type=”url”, type=”email”, type=”tel”
- type=”checkbox”, type=”radio”
    - type=”radio”
        - 항목을 하나만 선택
    - type=”checkbox”
        - 항목을 두 개 이상 선택
    - value
        - 서버에게 알려줄 때 넘겨줄 값
- type=”number”, type=”range”
- type=”date”, type=”month”, type=”week”
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/ab4943da-acaa-405d-8f6c-fb7513fbd181)
    
- type=”submit”, type=”reset”
- type=”image”
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/d36f96c4-14f4-40ac-bc5a-261ecb895cfb)
    
- type=”file”
    - 파일 첨부 폼
- type=”hidden”
    - 사용자에게 보여줄 필요는 없지만 관리자가 알아야 할 정보

### input 태그의 주요 속성

- autofocus
- placeholder
- readonly
- required

### 폼에서 사용하는 여러 가지 태그

- &lt;textarea>
- &lt;select>, &lt;option>
- &lt;datalist>, &lt;option>
    
    ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/e9e2ce04-3c8c-4e77-a34f-f06eec9d1660/496e0f9d-5cc3-43e9-a94f-e56d352b481e/Untitled.png)
    
- &lt;button>
    - type
        - submit: 폼을 서버로 전
        - reset
        - button