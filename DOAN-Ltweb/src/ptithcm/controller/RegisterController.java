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
import ptithcm.encrypt.*;
import ptithcm.entity.User;


@Controller
@Transactional
@RequestMapping("/user/")
public class RegisterController {

	@Autowired 
	SessionFactory factory;
	
	@RequestMapping(value = "register", method =RequestMethod.GET)			
	public String register(ModelMap model ) {
		model.addAttribute("user",new User());
		return "user/register";
	}
	
	
	@RequestMapping(value = "register", method =RequestMethod.POST)
	public String insertregister(ModelMap model,@ModelAttribute("user") User user) throws IllegalStateException, SystemException {
		
		Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(User.class);
	     crit.add(Restrictions.eq("username", user.getUsername()));
	     User user1 = (User) crit.uniqueResult();
	     if(user1!=null) {
	    	 model.addAttribute("message", "Tên đăng nhập đã tồn tại vui lòng chọn tên đăng nhập khác!");
	    	 return "user/register";
	     }else if(user1==null){
	    	 if(user.getUsername().trim().equalsIgnoreCase("")==true||user.getPassword().trim().equalsIgnoreCase("")==true) {
	    		 model.addAttribute("message", "Tên đăng nhập và mật khẩu không được bỏ trống!");
	    		 return "user/register";
	    	
	    	 }if(user.getUsername().contains("< script >") || user.getPassword().contains("< script >")){
	    		 model.addAttribute("message", "Tên đăng nhập và mật khẩu không được chứa mã script!");
	    		 return "user/register";
	    	 }if(user.getEmail().contains("< script >") || user.getSdt().contains("< script >")){
	    		 model.addAttribute("message", " không được chứa mã script!");
	    		 return "user/register";
	    	 }
	    	 if(user.getHo().contains("< script >") || user.getTen().contains("< script >")){
	    		 model.addAttribute("message", " không được chứa mã script!");
	    		 return "user/register";
	    	 }else {
				try {
					AES aes = new AES();
					user.setPhanquyen("user");
					user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)) ); 
					user.setEmail(aes.encrypt(user.getEmail(),"N18DCAT076")); 
					/* user.setSdt(aes.encrypt(user.getSdt(),"N18DCAT076")); */
					 
					session.save(user);
					
					model.addAttribute("message", "Đăng ký thành công. <a href=\"user/login.htm\">Đăng nhập tại đây.</a>");
				} catch (Exception e) {
					model.addAttribute("message", "Đăng ký thất bại!");
					return "user/register";
				}
	    	 }
	     
	     }
		return "user/login";
	}
}



