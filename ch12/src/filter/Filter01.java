package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Filter01 implements Filter {
	private FilterConfig filterConfig;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter01 init()");
		this.filterConfig = filterConfig;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		System.out.println("filter01 doFilter()");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		/* web.xml파일에 <init-param>태그에 <param-name>의 값을 이용하여 <param-value>값을 가져온다.
		 * <init-param>에 접근하기위해서는 JSP에선 getServletConfig().getInitParameter("<param-name>값");을 사용할 수 있고,
		 * 필터에서 사용할때는 init()메서드의 매개값을 멤버변수(filterConfig)에 대입하고 filterConfig.getInitParameter("<param-name값");을 사용한다. */
		String param1 = filterConfig.getInitParameter("param1");
		String param2 = filterConfig.getInitParameter("param2");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if(id == null || id.equals("")) {
			out.print("입력된 name은 null 입니다.");
			return;
		}
		
		String message;
		if(id.equals(param1) && pw.equals(param2)) {
			message = "로그인 성공"; 
		} else {
			message = "로그인 실패";
		}
		out.print(message);
		
		filterChain.doFilter(request, response);	// filter01_process.jsp 실행
	}

	@Override
	public void destroy() {
		System.out.println("Filter01 destory()");
	}
}
