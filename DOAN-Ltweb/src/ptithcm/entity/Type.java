package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="LoaiSP")
public class Type {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="MaLoaiSP")
	int maloaisp;
	@OneToMany(mappedBy = "type",fetch = FetchType.EAGER)
	Collection<Product> products;
	
	@Column(name="TenLoaiSP")
	String tenloaisp;


	public Collection<Product> getProducts() {
		return products;
	}

	public void setProducts(Collection<Product> products) {
		this.products = products;
	}

	public int getMaloaisp() {
		return maloaisp;
	}

	public void setMaloaisp(int maloaisp) {
		this.maloaisp = maloaisp;
	}

	public String getTenloaisp() {
		return tenloaisp;
	}

	public void setTenloaisp(String tenloaisp) {
		this.tenloaisp = tenloaisp;
	}


	
	
	
}	
	
	

