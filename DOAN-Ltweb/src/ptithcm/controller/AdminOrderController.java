package ptithcm.controller;

import java.util.Date;
import java.util.List;

import javax.transaction.SystemException;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.HoaDon;

@Transactional
@Controller
@RequestMapping("/order/")
public class AdminOrderController {
	@Autowired 
	SessionFactory factory;
	
	@RequestMapping("index")
	public String user(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM HoaDon order by mahd DESC";
		Query query = session.createQuery(hql);
		List<HoaDon> list = query.list(); 
		model.addAttribute("hd", list);
		
		return "order/index";
	}
	
	
	public HoaDon gethd(int id) {
		Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(HoaDon.class);
	     crit.add(Restrictions.eq("mahd", id));
	     HoaDon hd = (HoaDon) crit.uniqueResult();
		return hd;
	}
	
	@RequestMapping("delete/{id}")
	public String deleteorder(ModelMap model,@PathVariable int id) {
		HoaDon hd = gethd(id);	
		Session session = factory.getCurrentSession();
		hd.setTrangthai("Cancelled");
		session.update(hd);
					
		return "redirect:../index.htm";
	}
	
	@RequestMapping("complete/{id}")
	public String complete(ModelMap model,@PathVariable int id) {
		HoaDon hd = gethd(id);	
		Session session = factory.getCurrentSession();
		hd.setTrangthai("Completed");
		session.update(hd);
					
		return "redirect:../index.htm";
	}
	
	@RequestMapping("upstore/{id}")
	public String upstore(ModelMap model,@PathVariable int id) {
		HoaDon hd = gethd(id);	
		Session session = factory.getCurrentSession();
		hd.setTrangthai("Confirmed");
		session.update(hd);
					
		return "redirect:../index.htm";
	}

}
