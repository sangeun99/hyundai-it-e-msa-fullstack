## 09. 이미지와 그라데이션 효과로 배경 꾸미기

### 배경색과 배경 범위 지정하기

- background-color
- background-clip
    - 배경색의 적용 범위를 조절
    - border-box | padding-box | content-box
        
        ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/f0b412e9-c2d8-48f2-8679-2f3b704b1f4e)
        

### 배경 이미지 지정하기

- background
    - background-image
        - `background-image: url(’이미지 파일 경로’)`
    - background-repeat
        - repeat, repeat-x, repeat-y, no-repeat
    - background-position
        - 수평 위치 또는 수직 위치 값을 저장
    - background-origin
        - 배경 이미지의 적용 범위를 조절
    - background-attachment
        - scroll
            - 기본값
            - 화면을 스크롤하면 배경 이미지도 스크롤됨
        - fixed
            - 화면을 스크롤하면 배경 이미지는 고정되고 내용만 스크롤됨
- background-size 속성
    - 배경 이미지 크기 조정
    - auto, contain, cover, <크기>, <백분율>

### 그라데이션 효과로 배경 꾸미기

- 선형 그라데이션
    - linear-gradient
    - `linear-gradient(to <방향> 또는 <각도>, <색상 중지점>, [<색상 중지점>, … ]);`
    - 방향
        - ex) to right bottom
    - 각도
        - 맨 윗부분이 0deg, 시계 방향으로 회전하며 증가
    - 색상 중지점
        - 색상만 지정할 수도 있고 색상+위치를 지정할 수 있음
        - `background: linear-gradient(to bottom, #06f, white 30%, #06f);`
        - 시작 색상과 30% 지점 색상, 끝 색상을 지정
- 원형 그라데이션
    - radial-gradient
    - 모양
        - circle, ellipse(기본형)

            ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/9c36f0fe-efee-4a8d-acda-b37f685f8ab7)

    - 크기
        - closest-side
        - closest-corner
        - farthest-side
        - farthest-corner
    - 위치
        - at 키워드
    - 색상 중지점
- 패턴 만들기
    - repeating-linear-gradient
    - repeating-radial-gradient