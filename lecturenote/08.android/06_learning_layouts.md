## 06 화면 구성하기: 레이아웃(뷰 그룹)

### 레이아웃 종류

- 리니어 레이아웃
- 상대적 레이아웃
- 컨스트레인트 레이아웃
- 테이블 레이아웃
- 프레임 레이아웃

### 리니어 레이아웃

- 뷰들이 세로 또는 가로 방향 직선 모양으로 정렬됨
- layout_gravity 속성
    - 리니어 레이아웃 안에 있는 뷰에 주는 속성
    - 리니어 레이아웃 안에서 독립적으로 자신의 위치를 정함
    - orientation: vertical일 때 start, center, end
        
        ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/f0088d8a-2f9b-48fb-8f36-d793e8f2540f)

    - orientation: horizontal일 때, top, center, bottom
        
        ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/a04bf3fd-3ed0-4991-9fe4-081b29c959e2)
        
- layout_weight 속성
    - 부모에 weightSum도 함께 설정
        
        ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/12261926-ca38-4fe7-a8d1-db2cd2f90fee)
        

### 상대적 레이아웃

- 다른 뷰를 기준으로 상대적 위치를 지정

### 컨스트레인트 레이아웃

- 한 화면을 구성하는 뷰들에 서로 제약을 줌
- 반응형 UI를 쉽게 구성할 수 있음
- `app:layout_constraint[내 방향]_to[기준 뷰 방향]Of = “[기준 뷰 ID or parent]”`
- 컨스트레인트 레이아웃에서 마진을 줄 때 주의점
    - 컨스트레인트 레이아웃에서 마진을 주려면 주고자 하는 방향으로 제약이 있는 상태여야 함

### match_constraint 속성

- 컨스트레인트 레이아웃을 이용해 레이아웃을 구성할 때 layout_width와 layout_height 속성이 0dp인 경우 match_constraint를 값으로 주는 것과 같음
- 세팅
    
    ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/fb91e0de-2688-4719-91e8-015eee4863d5)
    
- 여기서 두 번째 버튼의 layout_width를 0dp로 바꾸면 다음과 같이 변경됨
    
    ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/88a61b72-27e5-49fe-8cbd-886d1cf269eb)
    

### Guidelines

- 가이드라인 이용하기
    
    ![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/de13e174-a88a-4e04-8ddf-66c73e1e9bfa)

- 가이드라인 이용하여 텍스트뷰 구성하기
    - 06_LearningLayout/constraint_layout_3.xml