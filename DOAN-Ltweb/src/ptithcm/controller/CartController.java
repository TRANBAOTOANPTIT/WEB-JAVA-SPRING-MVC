package ptithcm.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.encrypt.AES;
import ptithcm.entity.CTHoaDon;
import ptithcm.entity.HoaDon;
import ptithcm.entity.User;

@Transactional
@Controller
@RequestMapping("/cart/")
public class CartController {
	@Autowired
	SessionFactory factory;
	

	public User getuser(String username) {
		Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(User.class);
	     crit.add(Restrictions.eq("username", username));
	     User user = (User) crit.uniqueResult();
		return user;
	}
	
	public User getuserfromid(int id) {
		Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(User.class);
	     crit.add(Restrictions.eq("makh", id));
	     User user = (User) crit.uniqueResult();
		return user;
	}
	
	public CTHoaDon getcthd(int id) {
		Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(CTHoaDon.class);
	     crit.add(Restrictions.eq("macthd", id));
	     CTHoaDon ct = (CTHoaDon) crit.uniqueResult();
		return ct;
	}
	
	public HoaDon gethd(int id) {
		Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(HoaDon.class);
	     crit.add(Restrictions.eq("mahd", id));
	     HoaDon hd = (HoaDon) crit.uniqueResult();
		return hd;
	}
	
	
	public List<CTHoaDon> getlistcthd(int id) {
		Session session = factory.getCurrentSession();
		String hql = "from CTHoaDon C where C.user.makh = :makh and C.trangthai='0'";
		Query query = session.createQuery(hql);
		query.setParameter("makh", id);
		List<CTHoaDon> list = query.list(); 
		return list;
	}
	
	
	public List<HoaDon> getlisthd(int id) {
		Session session = factory.getCurrentSession();
		String hql = "from HoaDon H where H.makh = :makh order by mahd DESC";
		Query query = session.createQuery(hql);
		query.setParameter("makh", id);
		List<HoaDon> list = query.list(); 
		return list;
	}
	
	
	@RequestMapping("index/{username}")
	public String cart(ModelMap model,@PathVariable String username) {
		model.addAttribute("user", getuser(username));
		Session session = factory.getCurrentSession();
		String hql = "from CTHoaDon C where C.user.makh = :makh and C.trangthai='0'";
		Query query = session.createQuery(hql);
		query.setParameter("makh", getuser(username).getMakh());
		List<CTHoaDon> list = query.list(); 
		model.addAttribute("ct", list);
		int tong=0;
		for (int i = 0; i < list.size(); i++) {
			tong+=list.get(i).getSotien();
		}
		model.addAttribute("tong", tong);
		int mahd=-1;
		if(list.isEmpty()==false) {
		mahd = list.get(0).getHoadon().getMahd();
		}
		model.addAttribute("mahd", mahd);
		
		return "cart/index";
	}
	
	
	@RequestMapping("update/{id}")
	public String update(ModelMap model,@PathVariable int id, @RequestParam("soluong") int soluong) {
		CTHoaDon ct = getcthd(id);
		ct.setSoluong(soluong);
		ct.setSotien(ct.getProduct().getGiasp()*ct.getSoluong());
		Session session = factory.getCurrentSession();
		session.update(ct);
			
		
		return "redirect:../index/"+ct.getUser().getUsername()+".htm";
	}
	
	@RequestMapping("delete/{id}")
	public String delete(ModelMap model,@PathVariable int id) {
		CTHoaDon ct = getcthd(id);	
		String username = ct.getUser().getUsername();
		Session session = factory.getCurrentSession();
		session.delete(ct);
			
		
		return "redirect:../index/"+username+".htm";
	}
	
	@Autowired JavaMailSender mailer;
	@Qualifier("mailSender")
	@RequestMapping("confirm/{mahd}/{tong}")
	public String confirm(ModelMap model, @PathVariable int mahd, @PathVariable int tong) {
		AES aes = new AES();
		HoaDon hd = gethd(mahd);
		hd.setSotien(tong);
		String tu="PTITHCM";
		User user=getuserfromid(hd.getMakh());
		String email=aes.decrypt(user.getEmail(), "N18DCAT076");
		String noidung="Bạn đã đặt hàng thành công! Mã đơn hàng: "+hd.getMahd()+". Tổng số tiền: "+hd.getSotien()+" đ";
		String tieude="Đặt hàng thành công. Mã đơn hàng: "+hd.getMahd();
		hd.setTrangthai("Confirmed");
		Session session = factory.getCurrentSession();
		session.update(hd);
		
		List<CTHoaDon> ct = getlistcthd(hd.getMakh());
		for (int i = 0; i < ct.size(); i++) {
			ct.get(i).setTrangthai("1");
			session.update(ct.get(i));
		}
		model.addAttribute("ct", ct);
		model.addAttribute("hd", hd);
		model.addAttribute("user", user);
		model.addAttribute("message", "Đặt hàng thành công!");
		if(email!=null) {	
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
		}
		return "cart/confirm";
	}
	
	@RequestMapping("orderdelete/{id}")
	public String deleteorder(ModelMap model,@PathVariable int id) {
		HoaDon hd = gethd(id);	
		String username = getuserfromid(hd.getMakh()).getUsername();
		Session session = factory.getCurrentSession();
		hd.setTrangthai("Cancelled");
		session.update(hd);
			
		
		return "redirect:../order/"+username+".htm";
	}
	
	@RequestMapping("order/{username}")
	public String orderitems(ModelMap model,@PathVariable String username) {
		List<HoaDon> list = getlisthd(getuser(username).getMakh()); 
		model.addAttribute("user", getuser(username));
		model.addAttribute("hd", list);
		
		return "cart/order";
	}
}
