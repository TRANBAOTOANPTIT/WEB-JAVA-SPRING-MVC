package ptithcm.controller;

import java.util.List;

import javax.transaction.SystemException;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.encrypt.*;
import ptithcm.entity.User;

@Transactional
@Controller
@RequestMapping("/admin/")
public class AdminUserController {

	// private static final User Null = null;
	@Autowired
	SessionFactory factory;

	@RequestMapping("user")
	public String user(ModelMap model, @ModelAttribute("user") User user) {
		AES aes = new AES();
		Session session = factory.getCurrentSession();
		String hql = "FROM User";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		/*
		 * for (int i =0; i< list.size();i++) {
		 * list.get(i).setSdt(aes.decrypt(list.get(i).getSdt(), "N18DCAT076")); }
		 */
		model.addAttribute("users", list);
		return "admin/user";
	}

	@RequestMapping(value = "/deleteuser/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id, ModelMap model) throws IllegalStateException, SystemException {
		Session session = factory.getCurrentSession();
		Criteria crit = session.createCriteria(User.class);
		crit.add(Restrictions.eq("makh", id));
		User user = (User) crit.uniqueResult();
		if (user != null) {
			this.factory.getCurrentSession().delete(user);
			model.addAttribute("message", "Xoá thành công!");
		}

		return "redirect:../user.htm";

	}

	@RequestMapping(value = "insertuser", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("user", new User());
		return "admin/insertuser";
	}

	@RequestMapping(value = "insertuser", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("user") User user, BindingResult errors)
			throws IllegalStateException, SystemException {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		;
		Criteria crit = session.createCriteria(User.class);
		crit.add(Restrictions.eq("username", user.getUsername()));
		User user1 = (User) crit.uniqueResult();
		if (user1 != null) {
			model.addAttribute("message", "Tên đăng nhập đã tồn tại vui lòng chọn tên đăng nhập khác!");
			return "admin/insertuser";
		} else if (user.getUsername().trim().length() == 0) {
			errors.rejectValue("username", "user", "Username không được để trống!");
			return "admin/insertuser";
		} else if (user.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "user", "Password không được để trống!");
			return "admin/insertuser";
		}
		if (user.getTen().contains("< script >")) {
			errors.rejectValue("ten", "user", "Tên không được chứa mã <script>!");
			model.addAttribute("user", user);
			return "admin/insertuser";
		}
		if (user.getUsername().contains("< script >")) {
			errors.rejectValue("username", "user", "username không được chứa mã <script>!");
			model.addAttribute("user", user);
			return "admin/insertuser";
		}
		if (user.getPassword().contains("< script >")) {
			errors.rejectValue("password", "user", "password không được chứa mã <script>!");
			model.addAttribute("user", user);
			return "admin/insertuser";
		}
		if (user.getHo().contains("< script >")) {
			errors.rejectValue("ho", "user", "Họ không được chứa mã <script>!");
			model.addAttribute("user", user);
			return "admin/insertuser";
		}
		if (user.getEmail().contains("< script >")) {
			errors.rejectValue("email", "user", "Email không được chứa mã <script>!");
			model.addAttribute("user", user);
			return "admin/insertuser";
		}
		if (user.getSdt().contains("< script >")) {
			errors.rejectValue("sdt", "user", "số điện thoại không được chứa mã <script>!");
			model.addAttribute("user", user);
			return "admin/insertuser";
		} else {
			try {
				AES aes = new AES();
				user.setPhanquyen("user");
				user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
				user.setEmail(aes.encrypt(user.getEmail(), "N18DCAT076")); 
				/* user.setSdt(aes.encrypt(user.getSdt(), "N18DCAT076")); */
				session.save(user);
				t.commit();
				model.addAttribute("message", "Them moi thanh cong!");
			} catch (Exception e) {
				System.out.println("message: " + e);
				t.rollback();
				model.addAttribute("message", "Them moi that bai!");
				throw e;
			}
		}

		return "redirect:admin/../user.htm";
	}

	public Integer insertUser(User pd) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(pd);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	@RequestMapping(value = "/updateuser/{id}", method = RequestMethod.GET)
	public String update(ModelMap model, @PathVariable int id) throws IllegalStateException, SystemException {
		Session session = factory.getCurrentSession();
		Criteria crit = session.createCriteria(User.class);
		crit.add(Restrictions.eq("makh", id));
		User user = (User) crit.uniqueResult();
		if (user != null) {
			try {

				AES aes = new AES();
				user.setEmail(aes.decrypt(user.getEmail(), "N18DCAT076")); 
				/* user.setSdt(aes.decrypt(user.getSdt(), "N18DCAT076")); */

				model.addAttribute("user", user);
			} catch (Exception e) {
			}

		}

		return "admin/updateuser";

	}

	@RequestMapping(value = "/updateuser/{id}", method = RequestMethod.POST)
	public String deleteuser(ModelMap model, @PathVariable int id, @Validated @ModelAttribute("user") User user,
			BindingResult errors) throws IllegalStateException, SystemException {
		String us = user.getEmail();
		String sdt = user.getSdt();
		Session session = factory.getCurrentSession();
		if (user.getUsername().trim().length() == 0) {
			errors.rejectValue("username", "user", "Username không được để trống!");
			return "admin/updateuser";
		} else if (user.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "user", "Password không được để trống!");
			return "admin/updateuser";
		}
		if (user.getTen().contains("< script >")) {
			errors.rejectValue("ten", "user", "Tên không được chứa mã <script>!");
			model.addAttribute("user", user);
			return "admin/updateuser";
		}
		if (user.getUsername().contains("< script >")) {
			errors.rejectValue("username", "user", "username không được chứa mã <script>!");
			model.addAttribute("user", user);
			return "admin/updateuser";
		}
		if (user.getPassword().contains("< script >")) {
			errors.rejectValue("password", "user", "password không được chứa mã <script>!");
			model.addAttribute("user", user);
			return "admin/updateuser";
		}
		if (user.getHo().contains("< script >")) {
			errors.rejectValue("ho", "user", "Họ không được chứa mã <script>!");
			model.addAttribute("user", user);
			return "admin/updateuser";
		}
		if (user.getEmail().contains("< script >")) {
			errors.rejectValue("email", "user", "Email không được chứa mã <script>!");
			model.addAttribute("user", user);
			return "admin/updateuser";
		}
		if (user.getSdt().contains("< script >")) {
			errors.rejectValue("sdt", "user", "số điện thoại không được chứa mã <script>!");
			model.addAttribute("user", user);
			return "admin/updateuser";
		} else {
			try {

				user.setPhanquyen("user");
				System.out.println("updateusAdmin: " + user.getEmail());
				AES aes = new AES();
				user.setEmail(aes.encrypt(user.getEmail(), "N18DCAT076")); 
				/* user.setSdt(aes.encrypt(user.getSdt(), "N18DCAT076")); */

				session.update(user);
				model.addAttribute("message", "Sua thanh cong!");
			} catch (Exception e) {
				model.addAttribute("message", "Sua that bai!");
				return "admin/updateuser";
			}
		}

		return "redirect:../user.htm";

	}

}
