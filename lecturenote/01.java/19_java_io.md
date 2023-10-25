## 19장. 자바 입출력

### 파일 관리

- 파일 객체 생성 File
    - 객체 생성 시점에는 실제 파일의 존재유무가 문제되지 않음
    - 파일 읽을 때 FileNotFoundException
- 파일 관련 메서드
    - exists(), mkdir(), createNewFile()

### 문자셋

- 한글 전용 문자셋: EUC-KR, **MS949**
    - EUC-KR에서는 뷁 인식 불가, MS949는 가능
- 유니코드 문자셋: UTF-16, **UTF-8**
    - UTF-8: 가변 길이 문자 인코딩 방식, 한글은 3byte

- 각각의 글자는 문자의 종류와 문자셋에 따라 1~3byte를 가짐
    - 분할이나 조합 시 문자셋에 따라 결과가 다를 수 있기에 문자셋을 고려해야 함
- 워크스페이스에서 저장하는 파일의 인코딩 정보
    
    ![3](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/2ef73718-fa1f-448a-991e-9c7ee9952b4b)
    
- 템플릿에 들어가는 인코딩 정보
    
    ![4](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/a1aac7a7-731c-4863-8f27-3be47a807c3a)
    
- 자바 프로젝트 인코딩 정보
    
    ![5](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/204c09e1-4925-46d7-9796-4ef7e350e2c2)
    

- 한글 데이터의 경우 바이트단위 입출력 사용하면 안 됨
    - char 단위나 data 단위로 바꾸기
    - byte 단위로 묶어서 배열에 넣고 그것을 출력
- flush()
    - 마지막에 해주는 게 좋음
    - flush() 없으면 내부에서 버퍼 사용 시 꽉 차야만 작동할 수 있음
- BufferedStream
    - 입출력 과정에서 메모리 버퍼를 사용해 속도 향상
    - 실무에서 사용