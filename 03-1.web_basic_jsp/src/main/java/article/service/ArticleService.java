package article.service;

import java.sql.SQLException;
import java.util.List;

import article.dao.ArticleDAO;
import article.dto.ArticleDTO;
import lombok.extern.log4j.Log4j;

@Log4j
public class ArticleService {
	// 관리자가 비즈니스 로직을 수행하며 로그, 메세지를 찍는 역할
	private static ArticleService service = new ArticleService();
	private ArticleDAO dao = ArticleDAO.getInstance();
	
	private ArticleService() {}
	
	public static ArticleService getInstance() {
		return service;
	}

	public void insertArticle(ArticleDTO articleDTO) throws SQLException {
		try {
			dao.insertArticle(articleDTO);
		} catch (SQLException e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	public List<ArticleDTO> getArticleList() throws SQLException {
		try {
			return dao.getArticleList();
		} catch (SQLException e) {
			log.info(e.getMessage());
		}
		return null;
	}
}