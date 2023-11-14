package mvc.fx;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class AbstractController {

	public abstract ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response);
}
