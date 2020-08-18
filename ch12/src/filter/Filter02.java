package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Filter02 implements Filter {
	/* 로그파일에 기록하기 위해서 PrintWriter 객체를 필터의 멤버변수로 작성함. */
	private PrintWriter out;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter02 init()");
		
		/* web.xml파일의 <init-param>요소에 접근하여 <prarm-name>을 이용하여 <param-value>값을 가져온다. */
		String filename = filterConfig.getInitParameter("filename");
		if(filename == null) { throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");}
		try {
			/* PrintWriter(Writer out,boolean autoflush);	두번째 매개값이 true이면 자동으로 flush해준다.
			 * FileWriter(String fileName, boolean append); 두번째 매개값이 true이면 파일에 작성된게 있다면 이어서 작성한다. */
			out = new PrintWriter(new FileWriter(filename,true),true);
		} catch (IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		System.out.println("filter02 doFilter()");
		
		out.printf("현재 일시 : %s %n", getCurrentTime());
		String clientAddr = request.getRemoteAddr();
		out.printf("클라이언트 주소 : %s %n", clientAddr);
		
		filterChain.doFilter(request, response);	// filter02_process.jsp 실행
		
		/* response객체를 사용하기 때문에 doFilter()메소드를 사용한 후에 작성해야 콘텐츠 유형을 가져올 수 있다. */
		String contentType = response.getContentType();	
		out.printf("문서의 콘텐츠 유형: %s %n", contentType);
		out.println("==========================================================");
	}

	@Override
	public void destroy() {
		out.close();
		System.out.println("Filter02 destory()");
		
	}
	
	// 현재 시간을 가져올 메서드
	public String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());	// 매개값으로 들어온 값을 Calendar객체로 설정
		System.out.println(formatter.format(calendar.getTime()));
		return formatter.format(calendar.getTime());
		
	}
}
