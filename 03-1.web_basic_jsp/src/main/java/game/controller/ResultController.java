package game.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;

public class ResultController extends AbstractController {

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		int you = Integer.parseInt(request.getParameter("you"));
		int random = (int)(Math.random() * 2) + 1;
		
		String result = "";
		if (you == random) 
			result = "비김";
		else if (you != 3) {
			result = (you < random) ? "패배" : "승리";
		}
		else {
			result = (you > random) ? "패배" : "승리";
		}
		
		String [] status = {"", "가위", "바위", "보"};
		String you_status = status[you];
		String random_status = status[random];
		
		ModelAndView mav = new ModelAndView("/WEB-INF/game/result.jsp");
		mav.addObject("you_status", you_status);
		mav.addObject("random_status", random_status);
		mav.addObject("result", result);
		
		return mav;
	}
}
