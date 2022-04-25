
package ptithcm.interceptor;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.SystemException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import ptithcm.controller.LoginController;
import ptithcm.entity.User;

@Transactional
public class GlobalInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	SessionFactory factory;

	@Override

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		Session session = factory.getCurrentSession();
		String username = LoginController.usern;
		String hql = " SELECT phanquyen FROM User WHERE username = " + "'" + username + "'" + " ";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		request.setAttribute("users", list);
		String check = list.toString();
		if (check.contains("[user]") || check.contains("[]")) {
			response.sendRedirect(request.getContextPath() + "/user/login.htm");
			return false;
		}

		return true;
	}

}
