## Chapter 13. MyBatis와 스프링에서 페이징 처리

### 페이징 처리를 위해 객체 생성

- net.developia.spring03.domain.Criteria
    - 한 페이지 당 지정할 양
    - 현재 페이지

### Mapper를 이용해 SQL문 실행

- Criteria를 이용

```xml
<select id="getListWithPaging" resultType="net.developia.spring03.domain.BoardVO">
	<![CDATA[
		select
			bno, title, content, writer, regdate, updatedate
		from
			(select /*+INDEX_DESC(tbl_board pk_board) */
				rownum rn, bno, title, content, writer, regdate, updatedate
			from
				tbl_board
			where rownum <= #{pageNum} * #{amount}
			)
		where rn > (#{pageNum} - 1) * #{amount}
	]]>
</select>
```

- 이후 Service, Controller도 함께 작성