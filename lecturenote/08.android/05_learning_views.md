## 05 화면 구성하기: 뷰(위젯)

### UI 구성요소

- 뷰
    - UI 구성요소의 기본 클래스면서 화면을 구성하는 기본 단위
- 위젯(뷰)
    - 화면에 직접적으로 보이고 사용자와 상호작용하는 구성요소
    - 뷰 그룹에 속해야 함
- 뷰 그룹(레이아웃)
    - 한 개 이상의 뷰 혹은 다른 뷰 그룹을 담고 뷰들을 배치하는 역할

### 뷰의 공통 속성 - 너비와 높이

- layout_width
- layout_height
- dp 단위
    - density-independent pixel
    - 해상도와 관계없이 이미지를 같은 크기로 표현하도록 함
    - 안드로이드 프로그래밍에서 뷰와 이미지에는 dp를 주로, 텍스트에는 sp를 주로 사용하면 됨

### 뷰의 공통 속성 - 패딩과 마진

- 여백을 주기 위한 속성
    
    ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/314332c0-4d20-4cc0-9edf-06550913fa64)
    
- left/right와 start/end의 차이
    - 모든 언어에서 글이 왼쪽에서 시작하지는 않기 때문에 left/right 옵션이 존재

### 텍스트뷰

- text, textColor, textSize, textStyle
- strings.xml과 colors.xml에 값 정의해두고 사용하기
    
    ```xml
    <TextView
    	android:layout_width="wrap_content"
    	android:layout_height="wrap_content"
    	android:text="@string/greeting"
    	android:textColor="@color/colorMain"
    	android:textSize="20sp"
    	android:textStyle="bold" />
    ```
    
- 국가별 values directory 구분하여 사용하기
    
    ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/d61702e3-3de6-4c33-b680-9509392f6fba)
    
    - 사용자의 설정값에 따라 언어가 바뀌게 됨
        
        ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/c71fe825-051f-474d-81a0-84a883b5c37a)
        

### 이미지뷰

- 9-Patch 이미지 만들기
    - 다양한 사이즈에서도 이미지가 원본과 비슷한 형태를 띄기 위해 설정함
    - 확장자명을 `.9.(확장자)` 로 수정
        - `test.9.png`

![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/ab0c0aff-ace2-429f-ac1d-1c297f2f7ec0)

![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/47a84def-3214-4bbc-b8b5-d89dc61a2dba)