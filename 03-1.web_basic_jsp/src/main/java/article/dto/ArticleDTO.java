package article.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.codec.digest.DigestUtils;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ArticleDTO implements Serializable{
	private long no;
	private String title;
	private String name;
	private String content;
	private Date regdate;
	private int readcount;
	private String password;
	
	public void setPassword(String password) {
		this.password = DigestUtils.sha512Hex(password);
	}
}
