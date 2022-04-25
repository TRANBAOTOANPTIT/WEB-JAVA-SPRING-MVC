package ptithcm.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor2 extends HandlerInterceptorAdapter{
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("users"));
	
		
		/*
		 * if (session.getAttribute("users") == null ) {
		 * response.sendRedirect(request.getContextPath() + "/user/login.htm"); return
		 * false; }
		 */
		  if(session.getAttribute("users") == "admin"){
				/* response.sendRedirect(request.getContextPath() + "/admin/user.htm"); */
			  return true; 
			  } if(session.getAttribute("users") == "user"){
				  response.sendRedirect(request.getContextPath() + "/user/login.htm");
				  return false; 
			  }else if(session.getAttribute("users") == null){
			  response.sendRedirect(request.getContextPath() + "/user/login.htm");
		      return false; 
			  }
		
		return true;
	}
}
