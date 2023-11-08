## 07. 텍스트를 표현하는 다양한 스타일

### 글꼴 관련 스타일

- font-family
    - body { font-family: “맑은 고딕”, 돋움, 굴림 }
- font-size
    - font-size: <절대 크기> | <상대 크기> | <크기> | <백분율>
    - 키워드를 사용하여 글자 크기 지겅하기
        - 미리 약속해놓은 키워드 중 하나 사용 가능
        - xx-small < x-small < small < medium < large < x-large < xx-large
    - 단위를 사용하여 글자 크기 지정
        - em: 부모 요소에서 지정한 글꼴의 대문자 M의 너비를 기준(1em)으로 한 후 비율값을 지정
        - rem: 문서 시작 부분에서 지정한 크기를 기준(1rem)으로 한 후 비율값을 지정
        - ex: 해당 글꼴의 소문자 x의 높이를 기준(1ex)으로 한 후 비율값을 지정
- font-style
    - font-style: normal | italic | oblique
- font-weight
    - font-weight: normal | bold | bolder | lighter | 100 | … | 900

### 웹 폰트 사용하기

- 구글 웹 폰트 이용
- 직접 업로드하여 함께 게시
    
    ```css
    @font-face {
    	font-family: 'Ostrich';  /* 폰트 이름 */
    	src: local('Ostrich Sans'),
    	      url('fonts/ostrich-sans-bold.woff') format('woff'), 
    	      url('fonts/ostrich-sans-bold.ttf') format('truetype'), 
    	      url('fonts/ostrich-sans-bold.svg') format('svg');
    	}
    	.wfont {
    	font-family: 'Ostrich', sans-serif; /* 웹 폰트 지정 */
    	}
    ```
    

### 텍스트 관련 스타일

- color
- text-align
    - text-align: start | end | left | right | center | justify | match-parent
- line-height
- text-decoration
- text-shadow
    - text-shadow: none | <가로 거리> <세로 거리> <번짐 정도> <색상>
- text_transform
    - 영문자에만 적용
- letter-spacing, word-spacing

### 목록 스타일

- list-style-type
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/44250444-bc8e-4dcc-a6d1-b100234ecefe)
    
- list-style-image
    - 불릿 대신 이미지 사용
- list-style-position
    - list-style-position: inside | outside;
      ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/1316f502-1cd2-42fb-9104-5073849bd231)
        
        
- list-style
    - 속성을 한번에 표현

### 표 스타일

- caption-side
- border
- border-collapse
    - collapse
        - 표와 셀의 테두리를 합쳐 하나로 표시
    - separate
        - 표와 셀의 테두리를 따로 표시 (기본값)