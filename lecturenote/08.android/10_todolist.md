## 10 할 일 리스트: Room 데이터베이스, 리사이클러뷰

### Room 지속성 라이브러리

- 스마트폰 내장 데이터베이스에 데이터를 쉽게 저장할 수 있음
- Room
    - 엔티티
        - 데이터베이스 테이블, 관련된 속성의 집합
    - 데이터 접근 객체
        - 데이터베이스를 접군하는 함수를 제공하는 인터페이스
        - 여기서 데이터를 추가하거나 삭제하는 함수를 작성
    - 룸 데이터베이스
        - 테이블을 정의하고 데이터베이스의 버전을 명시
        - RoomDatabase 클래스를 상속받는 추상 클래스

### 리사이클러뷰(RecyclerView)

- 리스트 형식 구조에서 매번 새로운 뷰를 만들어내지 않고 재활용하도록 함
- 구성요소
    - 어댑터
        - 아이템뷰를 생성하고 데이터를 바인딩함
        - 바인딩은 아이템뷰에 알맞는 데이터를 순서대로 넣음
    - 레이아웃 매니저
        - 어댑터에 생성한 아이템뷰의 배치를 결정
        - LinearLayoutManager, GridLayoutManager, StaggeredGridLayoutManager

### 실습 코드

- https://github.com/sangeun99/hyundai-it-e-android/tree/main/10_TodoList