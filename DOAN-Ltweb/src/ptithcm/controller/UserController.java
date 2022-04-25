package ptithcm.controller;

import javax.mail.internet.MimeMessage;
import javax.transaction.SystemException;
import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ptithcm.entity.User;
import ptithcm.encrypt.*;

@Controller
@Transactional
@RequestMapping("/user/")
public class UserController {
	@Autowired 
	SessionFactory factory;
	
	@RequestMapping(value = "/userinfo/{username}", method = RequestMethod.GET)
	public String update(ModelMap model,@PathVariable String username) throws IllegalStateException, SystemException {
		 Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(User.class);
	     crit.add(Restrictions.eq("username", username));
	     User user = (User) crit.uniqueResult();
	     	
	        if (user != null) {
	        	try {
	        		AES aes = new AES();
					user.setEmail(aes.decrypt(user.getEmail(),"N18DCAT076")); 
					/* user.setSdt(aes.decrypt(user.getSdt(),"N18DCAT076")); */
	        		model.addAttribute("user", user);
				} catch (Exception e) {
				}
	        	
	        	
	        }
		
		return "user/userinfo";
		
	}
	
	public User getuser(String username) {
		Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(User.class);
	     crit.add(Restrictions.eq("username", username));
	     User user = (User) crit.uniqueResult();
	    
		return user;
	}
	
	@RequestMapping(value = "/updateuser/{id}", method = RequestMethod.POST)
	public String deleteuser(ModelMap model,@PathVariable int id,@Validated @ModelAttribute("user") User user, BindingResult errors) throws IllegalStateException, SystemException {
		 
		Session session = factory.getCurrentSession();
		 	
	        	if(user.getUsername().trim().length()==0) {
	    			errors.rejectValue("username", "user", "Username không được để trống!");
	    			model.addAttribute("user", user);
	    			return "user/userinfo";
	    		}if(user.getPassword().trim().length()==0){
	    			errors.rejectValue("password", "user", "Password không được để trống!");
	    			model.addAttribute("user", user);
	    			return "user/userinfo";
	    		}if(user.getTen().contains("< script >")){
	    			errors.rejectValue("ten", "user", "Tên không được chứa mã <script>!");
	    			model.addAttribute("user", user);
	    			return "user/userinfo";
	    		}if(user.getUsername().contains("< script >")){
	    			errors.rejectValue("username", "user", "username không được chứa mã <script>!");
	    			model.addAttribute("user", user);
	    			return "user/userinfo";
	    		}if(user.getPassword().contains("< script >")){
	    			errors.rejectValue("password", "user", "password không được chứa mã <script>!");
	    			model.addAttribute("user", user);
	    			return "user/userinfo";
	    		}if(user.getHo().contains("< script >")){
	    			errors.rejectValue("ho", "user", "Họ không được chứa mã <script>!");
	    			model.addAttribute("user", user);
	    			return "user/userinfo";
	    		}if(user.getEmail().contains("< script >")){
	    			errors.rejectValue("email", "user", "Email không được chứa mã <script>!");
	    			model.addAttribute("user", user);
	    			return "user/userinfo";
	    		}if(user.getSdt().contains("< script >")){
	    			errors.rejectValue("sdt", "user", "số điện thoại không được chứa mã <script>!");
	    			model.addAttribute("user", user);
	    			return "user/userinfo";
	    		}else{
	    			try {
	    				AES aes = new AES();
	    				user.setPhanquyen("user");
						user.setEmail(aes.encrypt(user.getEmail(),"N18DCAT076")); 
							/* user.setSdt(aes.encrypt(user.getSdt(),"N18DCAT076")); */
	    				session.update(user);			
	    				model.addAttribute("user", user);
	    				model.addAttribute("message", "Sửa thành công!");
	    			} catch (Exception e) {
	    				model.addAttribute("message", "Sửa thất bại!");
	    				model.addAttribute("user", user);
	    				return "user/userinfo";
	    			}
	    			}
	        	
	            
		
		return "home/index";
		
	}

	@RequestMapping(value = "forget")
	public String forget() throws IllegalStateException, SystemException {
		
		
		return "user/forgetpassword";
		
	}
	
	
	// function to generate a random string of length n 
   public String getAlphaNumericString(int n){ 
        // chose a Character random from this String 
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz"; 
  
        // create StringBuffer size of AlphaNumericString 
        StringBuilder sb = new StringBuilder(n); 
  
        for (int i = 0; i < n; i++) { 
  
            // generate a random number between 
            // 0 to AlphaNumericString variable length 
            int index 
                = (int)(AlphaNumericString.length() 
                        * Math.random()); 
  
            // add Character one by one in end of sb 
            sb.append(AlphaNumericString 
                          .charAt(index)); 
        } 
  
        return sb.toString(); 
    } 
	
    @Autowired JavaMailSender mailer;
	@Qualifier("mailSender")
	@RequestMapping(value = "forgetpass")
	public String forget(ModelMap model,@RequestParam("username") String username) throws IllegalStateException, SystemException {
		String ma=getAlphaNumericString(6);
		String tu="SHOP-WATCHS";
		String noidung="Mã xác thực của bạn là: "+ma+". Vui lòng nhập mã vào website để đặt lại mật khẩu!";
		String tieude="Quên mật khẩu"; 
		Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(User.class);
	     crit.add(Restrictions.eq("username", username));
	     User user = (User) crit.uniqueResult();
	        if (user == null) {
	        	model.addAttribute("message", "Username không tồn tại. Vui lòng nhập lại!");
	        	return "user/forgetpassword";
	        }
	        if (user.getEmail() == null) {
	        	model.addAttribute("message", "Bạn chưa thêm email nên không thể sử dụng chức năng này!");
	        	return "user/forgetpassword";
	        }
	       AES aes = new AES();	        
	       String email=aes.decrypt(user.getEmail(),"N18DCAT076");
	        try{
				
				// Tạo mail 
				MimeMessage mail =mailer.createMimeMessage();
				// Sử dụng lớp trợ giúp 
				MimeMessageHelper helper = new MimeMessageHelper(mail); 
				helper.setFrom(tu, tu); 
				helper.setTo(email); 
				helper.setReplyTo(tu, tu); 
				helper.setSubject(tieude); 
				helper.setText(noidung, true);
				// Gửi mail 
				mailer.send(mail);
			}
			catch(Exception ex){

				
			}
	        
	        model.addAttribute("message", "Mã xác thực đã được gửi về email của bạn");
	        model.addAttribute("ma", ma);
	        model.addAttribute("username", user.getUsername());
		return "user/confirmpassword";
		
	}
	
	@RequestMapping("confirm/{username}")
	public String confirm(ModelMap model,@PathVariable String username,@RequestParam("ma") String ma, @RequestParam("xacthuc") String xacthuc) {
		if(xacthuc.equalsIgnoreCase(ma)==true) {
			model.addAttribute("username", username);
			model.addAttribute("message", "Mời bạn đặt lại mật khẩu!");
			return "user/setpassword";
		}else {
			model.addAttribute("ma", ma);
	        model.addAttribute("username", username);

			model.addAttribute("message", "Mã xác thực không chính xác. Vui lòng nhập lại!");
			return "user/confirmpassword";
		}
			
	}
	
	
	@RequestMapping("setpass/{username}")
	public String setpass(ModelMap model,@PathVariable String username,@RequestParam("pass") String pass, @RequestParam("pass1") String pass1) {
		if(pass.trim().equalsIgnoreCase("")==true) {
			model.addAttribute("username", username);
			model.addAttribute("message", "Mật khẩu không được để trống!");
			return "user/setpassword";
		}
		if(pass1.trim().equalsIgnoreCase(pass)==false) {
			model.addAttribute("username", username);
			model.addAttribute("message", "Mật khẩu không khớp. Vui lòng nhập lại!");
			return "user/setpassword";
		}else {
			User user = getuser(username);
			user.setPassword(BCrypt.hashpw(pass, BCrypt.gensalt(12)));
			Session session = factory.getCurrentSession();
			session.update(user);
	        model.addAttribute("user", user);

			model.addAttribute("message", "Đổi mật khẩu thành công!");
			return "user/login";
		}
			
	}
}
