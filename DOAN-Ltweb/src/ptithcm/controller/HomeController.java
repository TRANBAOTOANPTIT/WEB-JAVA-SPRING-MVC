package ptithcm.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.SystemException;
import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ptithcm.entity.CTHoaDon;
import ptithcm.entity.HoaDon;
import ptithcm.entity.Product;
import ptithcm.entity.User;

@Transactional
@Controller
@RequestMapping("/home/")
public class HomeController {
	@Autowired 
	SessionFactory factory;
	

	public List<Product> getAllProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product order by giasp DESC";
		Query query = session.createQuery(hql);
		List<Product> list = query.list(); 
		return list;
	}
	

	public List<Product> getManProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product where maloaisp=1 order by giasp DESC";
		Query query = session.createQuery(hql);
		List<Product> list = query.list(); 
		return list;
	}
	

	public List<Product> getWomanProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product where maloaisp=2 order by giasp DESC";
		Query query = session.createQuery(hql);
		List<Product> list = query.list(); 
		return list;
	}
	
	public List<Product> getChildrenProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product where maloaisp=3 order by giasp DESC";
		Query query = session.createQuery(hql);
		List<Product> list = query.list(); 
		return list;
	}
	
	public User getuser(String username) {
		Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(User.class);
	     crit.add(Restrictions.eq("username", username));
	     User user = (User) crit.uniqueResult();
		return user;
	}
	
	public Product getproduct(int maSP) {
		Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(Product.class);
	     crit.add(Restrictions.eq("masp", maSP));
	     Product product = (Product) crit.uniqueResult();
		return product;
	}
	

	@RequestMapping("index")
	public String index(ModelMap model) { 
		
		model.addAttribute("productstop", getAllProduct())	;
		model.addAttribute("productsman", getManProduct())	;
		model.addAttribute("productswoman", getWomanProduct())	;
		model.addAttribute("productschildren", getChildrenProduct())	;
		return "home/index";	
	}
	
	@RequestMapping("index/{username}")
	public String index1(ModelMap model,@PathVariable String username) { 
		
		model.addAttribute("productstop", getAllProduct())	;
		model.addAttribute("productsman", getManProduct())	;
		model.addAttribute("productswoman", getWomanProduct())	;
		model.addAttribute("productschildren", getChildrenProduct())	;
		model.addAttribute("user", getuser(username));
		return "home/index";	
	}
	
	
	@RequestMapping("man-watch/{username}")
	public String manwatch(ModelMap model,@PathVariable String username) {
		model.addAttribute("user", getuser(username));
		Session session = factory.getCurrentSession();
		String hql = "FROM Product where maloaisp=1 order by giasp DESC";
		Query query = session.createQuery(hql);
		List<Product> list = query.list(); 
		model.addAttribute("productsman", list);
		
		return "home/man-watch";
	}
	
	
	@RequestMapping("woman-watch/{username}")
	public String womanwatch(ModelMap model, @PathVariable String username) {
		model.addAttribute("user", getuser(username));
		Session session = factory.getCurrentSession();
		String hql = "FROM Product where maloaisp=2 order by giasp DESC";
		Query query = session.createQuery(hql);
		List<Product> list = query.list(); 
		model.addAttribute("productswoman", list);
		
		return "home/woman-watch";
	}
	
	@RequestMapping("children-watch/{username}")
	public String childrenwatch(ModelMap model, @PathVariable String username) {
		model.addAttribute("user", getuser(username));
		Session session = factory.getCurrentSession();
		String hql = "FROM Product where maloaisp=3 order by giasp DESC";
		Query query = session.createQuery(hql);
		List<Product> list = query.list(); 
		model.addAttribute("productschildren", list);
		
		return "home/children-watch";
	}
	

	
	@RequestMapping(value = "/singleproduct/{id}/{username}", method = RequestMethod.GET)
	public String singleproduct(ModelMap model,@PathVariable int id,@PathVariable String username) throws IllegalStateException, SystemException {
		model.addAttribute("p", getproduct(id));	 
		model.addAttribute("user", getuser(username));	
	        if (getproduct(id) != null) {
	        	try {
	        		model.addAttribute("product", getproduct(id));
				} catch (Exception e) {
				}
	        	
	        	
	        }
		
		return "home/singleproduct";
	}
	
	
	public List<HoaDon> getHoaDonNull(int maKH) {
		Session session = factory.getCurrentSession();
		String hql = "FROM HoaDon H WHERE H.makh = :makh and H.trangthai='0'";
		Query query = session.createQuery(hql);
		query.setParameter("makh", maKH);
		List<HoaDon> list = query.list(); 
		return list;
	}
	
	public void newHD(String username) {
		Session session = factory.getCurrentSession();
		
			HoaDon hd = new HoaDon();
			hd.setMakh(getuser(username).getMakh());
			hd.setNgay(new Date());
			hd.setTrangthai("0");
				
			session.save(hd);
    		
	}

	
	@RequestMapping(value = "/addtocart/{id}/{username}/{soluong}", method = RequestMethod.POST)
	public String addtocart(ModelMap model,@PathVariable int id,@PathVariable String username,@PathVariable int soluong,final RedirectAttributes redirectAttributes) throws IllegalStateException, SystemException {
		Session session = factory.getCurrentSession();
		
		if(getHoaDonNull(getuser(username).getMakh()).isEmpty()) {
			newHD(username);
		}
		if(username==null) {
        	model.addAttribute("message", "Bạn phải đăng nhập để mua hàng!");
        	return"user/login";
        }
		
        	try {
        		CTHoaDon ct =new CTHoaDon();
        		ct.setUser(getuser(username));
        		ct.setProduct(getproduct(id));
        		ct.setNgay(new Date());
        		ct.setTrangthai("0");
        		ct.setHoadon(getHoaDonNull(getuser(username).getMakh()).get(0));
        		if(soluong==0) {
        			ct.setSoluong(1);
        		}else {
        			ct.setSoluong(soluong);
        		}
        		ct.setSotien(getproduct(id).getGiasp()*ct.getSoluong());
        		
        		session.save(ct);
        		model.addAttribute("message", "Them moi thanh cong!");
        		
			} catch (Exception e) {
				model.addAttribute("message", "Them that bai!");
			}
        	
        	
       
		
		redirectAttributes.addFlashAttribute("user", getuser(username));	
	return "redirect:./../../../index.htm";
	}
	


        @RequestMapping(value="/logout",method = RequestMethod.GET)
        public String logout(HttpServletRequest request){
            HttpSession httpSession = request.getSession();
            httpSession.invalidate();
            return "redirect:/home/index.htm";
        }

    
        @RequestMapping("search/{username}")
    	public String search(ModelMap model,@PathVariable String username,@RequestParam("timkiem") String timkiem) {
        	model.addAttribute("user", getuser(username));
        	Session session = factory.getCurrentSession();
        	Criteria query = session.createCriteria(Product.class);
        	query.add(Restrictions.like("tensp", timkiem, MatchMode.ANYWHERE));
    		List<Product> list = query.list();
    		if(list.isEmpty()==true) {
            	query.add(Restrictions.like("hangsx", timkiem, MatchMode.ANYWHERE));
        		list = query.list();
    		}
    		int size = list.size();
    		if(list.isEmpty()==true) {
    			model.addAttribute("message", "Không tìm thấy kết quả cho: "+timkiem);
    		}else {
	    		model.addAttribute("p", list);
	    		model.addAttribute("message", "Tìm thấy "+size+" kết quả cho: "+timkiem);
    		}
    		
    		return "home/search";
 		
    	}
        
        @RequestMapping("search")
    	public String search1(ModelMap model,@RequestParam("timkiem") String timkiem) {
        	
        	Session session = factory.getCurrentSession();
        	Criteria query = session.createCriteria(Product.class);
        	query.add(Restrictions.like("tensp", timkiem, MatchMode.ANYWHERE));
    		List<Product> list = query.list();
    		if(list.isEmpty()==true) {
            	query.add(Restrictions.like("hangsx", timkiem, MatchMode.ANYWHERE));
        		list = query.list();
    		}
    		int size = list.size();
    		if(list.isEmpty()==true) {
    			model.addAttribute("message", "Không tìm thấy kết quả cho: "+timkiem);
    		}else {
	    		model.addAttribute("p", list);
	    		model.addAttribute("message", "Có "+size+" kết quả cho: "+timkiem);
    		}
    		return "home/search";
 		
    	}
}
