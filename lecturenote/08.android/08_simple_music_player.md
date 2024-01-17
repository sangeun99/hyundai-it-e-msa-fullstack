## 08 뮤직 플레이어: MediaPlayer API, 서비스

### MediaPlayer API

- 안드로이드에서 다양한 유형의 미디어 재생을 지원
- 오디오를 재생하는 방법
    - Raw 리소스를 사용해 재생하기
    - URI를 사용해 재생하기

### MediaPlayer 클래스에서 지원하는 함수

- 파일 준비하기
    - prepare()
    - prepareAsync()
    - setDataResource()
- 파일 재생하기
    - start()
    - pause()
- 파일 멈추기
    - reset()
- 음악 길이 찾기
    - getDuration()
- 특정 구간으로 이동하기
    - seekTo()
- 자원 해제하기
    - release()