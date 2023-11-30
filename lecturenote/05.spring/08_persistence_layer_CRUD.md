## Chapter 08. 영속/비즈니스 계층의 CRUD 구현

- 테이블을 기반으로 BoardVO 클래스 구성

### Mapper 인터페이스와 Mapper XML

- `root-context.xml`에서 MyBatis 선언
    - Mapper 인터페이스를 지정
        
        ```xml
        <mybatis-spring:scan base-package="net.developia.spring03.mapper"/>
        ```
        
- 방법1) Mapper 인터페이스에서 어노테이션을 이용해 SQL문 처리
    
    ```java
    package net.developia.spring03.mapper;
    
    import java.util.List;
    
    import org.apache.ibatis.annotations.Select;
    
    import net.developia.spring03.domain.BoardVO;
    
    public interface BoardMapper {
    	@Select("select * from tbl_board where bno > 0")
    	public List<BoardVO> getList();
    }
    ```
    
- 방법2) Mapper XML 파일 이용
    - src/main/rescources 내에 패키지와 동일한 폴더 생성 후 XML 작성
    - BoardMapper.xml
        
        ```xml
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE mapper
         PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
         "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
        <mapper namespace="net.developia.spring03.mapper.BoardMapper">
        
        	<select id="getList" resultType="net.developia.spring03.domain.BoardVO">
        	<![CDATA[
        	select * from tbl_board where bno > 0
        	]]>
        	</select>
        
        </mapper>
        ```
        
    - `<![CDATA[ … ]]>`
        - 부등호 이용 시 문제 생기는 부분을 개선

### CRUD 구현

- 위에서 실행한 방법과 동일하게 작업
- 소스코드
    - BoardMapper 인터페이스
        
        ```java
        package net.developia.spring03.mapper;
        
        import java.util.List;
        
        import org.apache.ibatis.annotations.Select;
        
        import net.developia.spring03.domain.BoardVO;
        
        public interface BoardMapper {
        	// @Select("select * from tbl_board where bno > 0")
        	public List<BoardVO> getList();
        	
        	public void insert(BoardVO board);
        	
        	public void insertSelectKey(BoardVO board);
        	
        	public BoardVO read(Long bno);
        	
        	public int delete(Long bno);
        	
        	public int update(BoardVO board);
        }
        ```
        
    - BoardMapper.xml
        
        ```xml
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE mapper
         PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
         "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
        <mapper namespace="net.developia.spring03.mapper.BoardMapper">
        
        	<select id="getList" resultType="net.developia.spring03.domain.BoardVO">
        	<![CDATA[
        	select * from tbl_board where bno > 0
        	]]>
        	</select>
        	
        	<insert id="insert">
        		insert into tbl_board (bno, title, content, writer)
        		values (seq_board.nextval, #{title}, #{content}, #{writer})
        	</insert>
        	
        	<insert id="insertSelectKey">
        		<selectKey keyProperty="bno" order="BEFORE"
        			resultType="long">
        			select seq_board.nextval from dual	
        		</selectKey>
        		
        		insert into tbl_board (bno, title, content, writer)
        		values (#{bno}, #{title}, #{content}, #{writer})
        	</insert>
        
        	<select id="read" resultType="net.developia.spring03.domain.BoardVO">
        		select bno, title, content, writer, regdate, updatedate from tbl_board where bno=#{bno}
        	</select>
        	
        	<delete id="delete">
        		delete from tbl_board where bno=#{bno}
        	</delete>
        	
        	<update id="update">
        		update tbl_board
        		set title=#{title},
        		content=#{content},
        		writer=#{writer},
        		updateDate=sysdate
        		where bno=#{bno}
        	</update>
        </mapper>
        ```
        
    - BoardMapperTests 클래스로 테스트