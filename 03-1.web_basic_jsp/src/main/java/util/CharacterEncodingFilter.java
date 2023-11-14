package util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter(urlPatterns = "/*")
public class CharacterEncodingFilter extends HttpFilter implements Filter {

    public CharacterEncodingFilter() {
    	System.out.println("CharacterEncodingFilter 생성자 수행");
    }
    
    @Override
	public void destroy() {
    	System.out.println("CharacterEncodingFilter 소멸자 수행");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hrequest = (HttpServletRequest) request;
		hrequest.setCharacterEncoding("UTF-8");
		chain.doFilter(request, response);
	}
	
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
    	System.out.println("CharacterEncodingFilter init() 수행");
	}
}