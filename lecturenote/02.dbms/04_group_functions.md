## Chapter 04. 그룹함수

- 단일행함수: 행마다 결과를 만들어냄
- 그룹함수: 모든 행을 집계내어 하나로 만듦

### 그룹함수의 종류

- SUM
- AVG
- COUNT
- MAX
- MIN
- STDDEV
- VARIANCE

### GROUP BY 절

- 어떤 컬럼 값을 기준으로 그룹함수를 적용할 수도 있음

### HAVING 절

- 그룹함수의 결과를 제한할 수 있음
    - WHERE 절로는 조건으로 넣을 수 없음
    - WHERE 절은 HAVING 절에 적을 수는 있음
        - 적으면 안 됨 → 성능 저하
    
    ![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/04468453-4f1f-4a16-bfd2-5d43bbac39fa)
    

### 쿼리문의 실행 순서

- FROM → WHERE → GROUP BY / HAVING / SELECT → ORDER BY
- GROUP BY / HAVING / SELECT 셋의 연산 중 누가 먼저 실행될지는 모름
    - 메모리 안에서 일어나는 일
- 그렇기 때문에 HAVING 절에서 별칭을 사용할 수 없음