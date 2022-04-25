package ptithcm.controller;


import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.Product;
import ptithcm.entity.Type;
import ptithcm.entity.User;

@Transactional
@Controller
@RequestMapping("/product/")
public class AdminProductController {

	@Autowired 
	SessionFactory factory;
	
	@RequestMapping("index")
	public String user(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product order by masp DESC";
		Query query = session.createQuery(hql);
		List<User> list = query.list(); 
		model.addAttribute("products", list);
		
		return "product/index";
	}
	
	
	@ModelAttribute("types")
	public List<Type> getType(ModelMap model) { 
		Session session = factory.getCurrentSession();
		String hql = "FROM Type";
		Query query = session.createQuery(hql);
		List<Type> list = query.list(); 
		model.addAttribute("types", list);
		return list;
	}
	
	@RequestMapping(value = "insert", method =RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("product",new Product());
		return "product/insert";
	}
	
	@Autowired ServletContext context;
	@RequestMapping(value = "insert", method =RequestMethod.POST)
	public String insert(ModelMap model,@RequestParam("photo") MultipartFile photo,@ModelAttribute("product") Product product,BindingResult errors) throws IllegalStateException, SystemException {
		Session session = factory.openSession();
		Transaction t =session.beginTransaction();		
	    if(product.getTensp().trim().length()==0) {
			errors.rejectValue("tensp", "product", "Tên sản phẩm không được để trống!");
			return "product/insert";
		}if(product.getType().getMaloaisp()>3 || product.getType().getMaloaisp()<1) {
			errors.rejectValue("type.maloaisp", "product", "Mã loại sản phẩm không chính xác!");
			return "product/insert";
		} if(product.getGiasp()<1111) {
			errors.rejectValue("giasp", "product", "Mời nhập lại giá sản phẩm!");
			return "product/insert";
		}if(product.getSoluongsp()<0) {
			errors.rejectValue("soluongsp", "product", "Mời nhập lại số lượng sản phẩm!");
			return "product/insert";
		}if(photo.isEmpty()){
			errors.rejectValue("anhsp","product", "Vui lòng chọn file ảnh!");
			return "product/insert";
			}
		else{
		try {
			String photoPath = context.getRealPath("/images/"+photo.getOriginalFilename());
			photo.transferTo(new File(photoPath));
			product.setAnhsp("images/"+photo.getOriginalFilename());
			product.setNgaytaosp(new Date());
			session.save(product);
			t.commit();
			model.addAttribute("message", "Thêm sản phẩm thành công!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", e);
		}
		}
		
		return "redirect:product/../index.htm";
	}
	
	//C:\Users\COMPUTER\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WEBAPP\images\74662468_1188845417982729_2231292629042069504_o.jpg
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id,ModelMap model) throws IllegalStateException, SystemException {
		 Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(Product.class);
	     crit.add(Restrictions.eq("masp", id));
	     Product product = (Product) crit.uniqueResult();
	        if (product != null) {
	            this.factory.getCurrentSession().delete(product);
	            model.addAttribute("message", "Xoá thành công!");
	        }
		
		return "redirect:../index.htm";
		
	}
	
	
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public String update(ModelMap model,@PathVariable int id) throws IllegalStateException, SystemException {
		 Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(Product.class);
	     crit.add(Restrictions.eq("masp", id));
	     Product product = (Product) crit.uniqueResult();
	        if (product != null) {
	        	try {
	        		model.addAttribute("product", product);
				} catch (Exception e) {
				}
	        	
	        	
	        }
		
		return "product/update";
		
	}
	

	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	public String updateproduct(ModelMap model,@PathVariable int id,@RequestParam("photo") MultipartFile photo,@Validated @ModelAttribute("product") Product product, BindingResult errors) throws IllegalStateException, SystemException {
		 Session session = factory.getCurrentSession();	
		 
		    if(product.getTensp().trim().length()==0) {
				errors.rejectValue("tensp", "product", "Tên sản phẩm không được để trống!");
				return "product/update";
			}if(product.getType().getMaloaisp()>3 || product.getType().getMaloaisp()<1) {
				errors.rejectValue("type.maLoaiSP", "product", "Mã loại sản phẩm không chính xác!");
				return "product/update";
			} if(product.getGiasp()<1111) {
				errors.rejectValue("giasp", "product", "Mời nhập lại giá sản phẩm!");
				return "product/update";
			}if(photo.isEmpty() && product.getAnhsp().trim().length()==0){
				errors.rejectValue("anhsp","product", "Vui lòng chọn file ảnh!");
				return "product/update";
			}if(product.getSoluongsp()<0) {
				errors.rejectValue("soluongsp", "product", "Mời nhập lại số lượng sản phẩm!");
				return "product/update";
			}if(product.getNgaytaosp()==null) {
				model.addAttribute("message1", "Định dạng ngày chính xác là yyyy-MM-dd !");
				return "product/update";
			}
			else{
			try {
				if(!photo.isEmpty()) {
				String photoPath = context.getRealPath("/images/"+photo.getOriginalFilename());
				photo.transferTo(new File(photoPath));
				product.setAnhsp("images/"+photo.getOriginalFilename());
				}
				product.setNgaytaosp(product.getNgaytaosp());
				session.update(product);
				model.addAttribute("message", "Sua thanh cong!");
			} catch (Exception e) {
				model.addAttribute("message", "Sua that bai!");
			}
			}
	        	
	            
		
		return "redirect:../index.htm";
		
	}
}