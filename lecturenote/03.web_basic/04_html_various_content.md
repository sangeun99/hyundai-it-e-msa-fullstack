## 04. 웹 문서에 다양한 내용 입력하기

### 텍스트 입력하기

- &lt;h*n*>
- &lt;p>
- &lt;br>
- &lt;blockquote>
- &lt;strong>, &lt;b>
- &lt;em>, &lt;i>

### 목록 만들기

- &lt;ol>, &lt;li>
    - 순서 있는 목록
    - ol 태그의 type, start 속성으로 순서 있는 목록의 번호를 지정할 수 있음
- &lt;ul>, &lt;li>
    - 순서 없는 목록
- &lt;dl>, &lt;dt>, &lt;dd>
    - 설명 목록

```html
<dl>
	<dt>이름</dt>
	<dd>값</dd>
</dl>
```

### 표 만들기

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/fa4306e9-46bb-45e4-a736-d17da8a507da)

- &lt;table>
    - &lt;caption>
    - &lt;thead>
        - &lt;tr>
            - &lt;th>
    - &lt;tbody>
        - &lt;tr>
            - &lt;td>

```html
<table>
  <caption>선물용과 가정용 상품 구성</caption>
  <thead>
    <tr>
      <th>용도</th>
      <th>중량</th>
      <th>개수</th>
      <th>가격</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>선물용</td>
      <td>3kg</td>
      <td>11~16과</td>
      <td>35,000원</td>
    </tr>
  </tbody>
</table>
```

- &lt;rowspan>, &lt;colspan>
    - 행이나 열을 합침
- &lt;col>, &lt;colgroup>
    - 열을 하나만 지정
    - &lt;col> 태그를 두 개 이상 묶어서 사용
        
        ```html
        &lt;colgroup>
          &lt;col style="background-color:#eee;">
          &lt;col>
          &lt;col span="2" style="width:150px">
        &lt;/colgroup>
        ```
        
    - &lt;caption> 태그 다음에 사용

### 이미지 삽입하기

- &lt;img>

### 오디오와 비디오 삽입하기

- &lt;object>
    - 오디오, 비디오, 자바 애플릿, pdf 등 다양한 파일 삽입 가능
    - `<object width=”너비” height=”높이” data=”파일”></object>`
- &lt;embed>
    - 오디오, 비디오, 이미지 등 파일 삽입 가능
    - &lt;audio>, &lt;video>, &lt;object> 태그를 지원하지 않는 웹 브라우저를 고려할 때 사용
- &lt;audio>, &lt;video>
    - controls
    - autoplay
    - loop
    - muted
    - preload
    - width, height
    - poster=”이미지파일”

### 하이퍼링크 삽입하기

- &lt;a>
    - target: 링크를 새 탭에서 열어줌
