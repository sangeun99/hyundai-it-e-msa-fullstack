package basic;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// @WebServlet("/HelloServlet2")
public class HelloServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HelloServlet2() {
        System.out.println("HelloServlet2 생성자 수행");
    }

	public void init(ServletConfig config) throws ServletException {
        System.out.println("HelloServlet2 init 수행");
	}

//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("HelloServlet2 doGet() 수행");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("HelloServlet2 doPost() 수행");
	}
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("HelloServlet2 doPut() 수행");
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("HelloServlet2 doDelete() 수행");
	}

}
