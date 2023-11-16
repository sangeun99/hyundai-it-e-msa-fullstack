package article.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.dto.ArticleDTO;
import article.service.ArticleService;
import lombok.extern.log4j.Log4j;
import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;

@Log4j
public class ArticleInsertAction extends AbstractController {
	
	ArticleService service = ArticleService.getInstance();

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String content = request.getParameter("content");
		
		// DTO나 VO class를 이용해 값을 한번에 넘김
		ArticleDTO articleDTO = new ArticleDTO();
		articleDTO.setName(name);
		articleDTO.setTitle(title);
		articleDTO.setPassword(password);
		articleDTO.setContent(content);
		
		log.info(articleDTO);
		try {
			// 성공 시 게시물 리스트로 넘어가면 됨 (forward 아닌 페이지 이동)
			service.insertArticle(articleDTO);
			return new ModelAndView("redirect:list");
		}
		catch (Exception e) {
			// 실패 시 alert으로 알려줌
			ModelAndView mav = new ModelAndView("/WEB-INF/article/result.jsp");
			mav.addObject("msg","게시물 입력 실패\\n 입력 폼으로 되돌아갑니다.");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}
	}
}
