package ptithcm.controller;

import javax.transaction.SystemException;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ptithcm.entity.User;


@Controller
@Transactional
@RequestMapping("/user/")
public class LoginController {
	@Autowired 
	SessionFactory factory;
	public static String usern;
	@RequestMapping(value = "login", method =RequestMethod.GET)			
	public String index(ModelMap model ) {
		model.addAttribute("user",new User());
		return "user/login";
	}
			

	@RequestMapping(value = "login", method =RequestMethod.POST)
	public String checklogin(ModelMap model,@ModelAttribute("user") User user,final RedirectAttributes redirectAttributes) throws IllegalStateException, SystemException {
		Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(User.class);
	     crit.add(Restrictions.eq("username", user.getUsername()));
		 usern = user.getUsername();
		 System.out.println("login: "+usern);
	     String pass = user.getPassword();
	     User user1 = (User) crit.uniqueResult();
	      
	     if(user1==null) {
	    	 model.addAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng!");
	     }else if(BCrypt.checkpw(pass, user1.getPassword())){  /*user1.getPassword().equalsIgnoreCase(user.getPassword())==true*/
	    	 model.addAttribute("message", "Đăng nhập thành công!");
	    	
	    	 if(user1.getPhanquyen().equalsIgnoreCase("user")|| user1.getPhanquyen()=="") {
	    		 redirectAttributes.addFlashAttribute("user", user1);
	    		 return "redirect:../home/index.htm";
	    	 }else if(user1.getPhanquyen().equalsIgnoreCase("admin")) {
	    		 
	    		 return "redirect:../admin/user.htm";
	    	 }
	     }else {
	    	 model.addAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng!");
	     }
		return "user/login";
	}	
		
}
