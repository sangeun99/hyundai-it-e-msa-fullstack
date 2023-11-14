<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>프런트엔드 개발자 지원서</title>
    <style>
			#container { 
				width:520px;
				border:1px solid black;
				padding:20px 40px;
				margin:0 auto;
			}
      fieldset { margin-bottom:15px; }
      legend { font-weight:bold; }
			ul {list-style-type: none;}
			li { line-height:30px;}
    </style>
  </head>
  <body>
	<div id="container">
		<h1>프런트엔드 개발자 지원서 </h1>
		<p>HTML, CSS, Javascript에 대한 기술적 이해와 경험이 있는 분을 찾습니다.</p>
		<hr>
		<form action="process-2-1.jsp" method="get">
			<h4>개인정보</h4>
			<ul>
				 <li>
					 <!-- <input>태그 앞 뒤에 <label>과 </label> 태그로 묶어도 됩니다 -->
					<label for="sname"> 이름 </label>
					<input type="text" id="sname" name="name" autofocus placeholder="공백없이 입력하세요">
				</li>
				<li>
					<label for="snumber"> 연락처 </label>
					<input type="text" id="snum" name="phone">
				 </li>
			</ul>
			<h4>지원 분야</h4>
			<ul>
				<li>
					<label><input type="radio" name="field" value="웹 퍼블리싱"> 웹 퍼블리싱</label>
				</li>
				<li>
					<label><input type="radio" name="field" value="웹 애플리케이션 개발"> 웹 애플리케이션 개발</label>
				</li>
				<li>
					<label><input type="radio" name="field" value="개발 환경 개선"> 개발 환경 개선</label>
				</li>
			</ul>
			<h4>취미</h4>
			<ul>
				<li><input type="checkbox" name="hobby" value="잠자기">잠자기</li>
				<li><input type="checkbox" name="hobby" value="뒹굴기">뒹굴기</li>
				<li><input type="checkbox" name="hobby" value="가위눌리기">가위눌리기</li>					
			</ul>
			<h4>성별</h4>
			<select name="gender">
				<option value="1">남자</option>
				<option value="2">여자</option>
			</select>
	      <label>
	        <h4>지원동기</h4>
	        <textarea id="motive" name="motive" cols="60" rows="5" placeholder="본사 지원 동기를 간략히 써 주세요."></textarea>
	      </label>
			<div>
				<input type="submit" value="접수하기">
				<input type="reset" value="다시 쓰기">
				<!-- 다음과 같이 작성해도 됩니다.
					<button type="submit">접수하기</button>
					<button type="reset">다시 쓰기</button>
				-->
			</div>
		</form>
	</div>
  </body>
</html>