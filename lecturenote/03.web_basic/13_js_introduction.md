## 13. 자바스크립트와 첫 만남

### 웹 브라우저에서 스크립트를 해석하는 과정

```html
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>글자색 바꾸기</title>
	<style>
		body { text-align:center; }
		#heading { color:blue; }
		#text { 
			color:gray;
			font-size:15px;
		}
	</style>
</head>
<body>
	<h1 id="heading">자바스크립트</h1>
	<p id="text">위 텍스트를 클릭해 보세요</p>
	
	<script>
		var heading = document.querySelector('#heading');
		heading.onclick = function() {
			heading.style.color = "red";
		}
	</script>
</body>
</html>
```

- &lt;!DOCTYPE html>를 보고 웹 문서라는 것을 알게됨
- &lt;html> &lt;/html> 사이의 내용을 HTML 표준에 맞춰 읽기 시작
- 웹 문서에서 HTML 태그의 순서와 포함 관계 확인. 어떤 태그가 있는지 확인하고 태그 간의 관례를 분석
- &lt;style> &lt;/style> 사이의 스타일 정보 분석
- &lt;script> 태그를 만나면 웹 브라우저 안에 포함된 자바스크립트 해석기에게 스크립트 소스 넘김
- 앞서 분석한 HTML과 CSS 정보에 따라 웹 브라우저 화면에 표시
- 웹 브라우저에서 ‘자바스크립트’를 클릭하면 분석한 자바스크립트를 실행

### 기본 입출력 방법

- alert
- confirm
- prompt
- document.write()
- console.log()

### 자바스크립트 스타일 가이드

- 구글 js 스타일 가이드
    - https://google.github.io/styleguide/jsguide.html