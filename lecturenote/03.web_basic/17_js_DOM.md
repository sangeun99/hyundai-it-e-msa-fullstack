## 17. 문서 객체 모델 (DOM)

### 문서 객체 모델

- 자바스크립트를 이용하여 웹 문서에 접근하고 제어할 수 있도록 객체를 사용해 웹 문서를 체계적으로 정리하는 방법

```html
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>DOM Tree 알아보기</title>
</head>
<body>
  <h1>Do it!</h1>
  <img src="images/doit.jpg" alt="공부하는 이미지">
</body>
</html>
```

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/bfdd265e-da0b-4aae-9de1-67d084edfaae)


### DOM에 접근하기

- getElementById()
- getElementsByClassName()
- getElementsByTagName()
- querySelector()
- querySelectorAll()
- getElementById(), getElementsByClassName(), getElementsByTagName() 의 반환값은 HTMLElement 객체
- querySelector(), querySelectorAll()의 반환값은 노드이거나 노드리스트

### 웹 요소의 내용 수정

- innerText
- innerHTML
    - HTML 태그까지 반영하여 표시

### 속성을 가져오거나 수정

- getAttribute()
- setAttribute()

### DOM에서 이벤트 처리하기

- DOM 요소에 함수 직접 연결하기
    
    ```jsx
    var cup = document.querySelector("#cup");  // id = cup인 요소를 가져옴
    cup.onclick = function(){
      alert("이미지를 클릭했습니다");
    }
    ```
    
- 함수 이름을 사용해 연결하기
    
    ```jsx
    var cup = document.querySelector("#cup");  // id = cup인 요소를 가져옴
    cup.onclick = changePic;  // cup을 클릭하면 changePic 함수 실행
    
    function changePic() {
      cup.src = "images/cup-2.png";
    }
    ```
    
- addEventListener() 이용하기
    
    ```jsx
    var cover = document.getElementById("cover");
    cover.addEventListener("mouseover",changePic, false);
    cover.addEventListener("mouseout",originPic, false);
    
    function changePic() {
      cover.src = "images/easys-2.jpg";
    }
    function originPic() {
      cover.src = "images/easys-1.jpg";
    }
    ```
    

### CSS 속성에 접근하기

- `document.요소명.style.속성명`

### event 객체

- 프로퍼티
    - type
    - pageX
        - 이벤트가 발생한 가로 위치
    - pageY
- 메서드
    - preventDefault()
        - 이벤트를 취소할 수 있는 경우에 취소
- event 객체에는 이벤트 정보만 들어있음. 이벤트가 발생한 대상에 접근하려면 `this` 예약어 사용
    
    ```jsx
    var cup = document.getElementById("cup");
    cup.onclick = function(event) {
    	alert("클릭한 이미지 파일 : " + this.src);
    }
    ```
    

### DOM에서 노드 추가, 삭제하기

- 새로운 요소 추가하기
    - 요소 노드 만들기
        - createElement()
    - 텍스트 노드 만들기
        - createTextNode()
    - 자식 노드 연결하기
        - appendChild()
    
    ```jsx
    function addP() {
      var newP = document.createElement("p");
      var txtNode = document.createTextNode("DOM은 Document Object Model의 줄임말입니다.");
      newP.appendChild(txtNode);
      document.getElementById("info").appendChild(newP);
    }
    ```
    
- 속성값이 있는 새로운 요소 추가하기
    - 요소 노드 만들기
        - createElement()
    - 속성 노드 만들기
        - createAttribute()
    - 속성 노드 연결하기
        - setAttributeNode()
    - 자식 노드 연결하기
        - appendChild()
    
    ```jsx
    var newImg = document.createElement("img");
    var srcNode = document.createAttribute("src");
    var altNode = document.createAttribute("alt");
    srcNode.value = "images/dom.jpg";
    altNode.value = "돔 트리 예제 이미지";
    newImg.setAttributeNode(srcNode);
    newImg.setAttributeNode(altNode);
    
    document.getElementById("info").appendChild(newP);
    document.getElementById("info").appendChild(newImg);
    ```
    
- 노드 삭제하기
    - 부모 노드에 접근하기
        - parentNode
    - 자식 노드를 삭제
        - removeChild()
    
    ```jsx
    var items = document.querySelectorAll("li");  // 모든 항목 가져오기
    for(i=0; i<items.length; i++) {
      items[i].addEventListener("click", function() {  // 항목 클릭했을 때 실행할 함수
        if(this.parentNode)    // 부모 노드가 있다면 
          this.parentNode.removeChild(this);  // 부모 노드에서 삭제
      });
    }
    ```