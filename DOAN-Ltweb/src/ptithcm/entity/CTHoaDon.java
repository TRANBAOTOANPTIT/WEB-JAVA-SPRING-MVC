package ptithcm.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="CTHoaDon")
public class CTHoaDon {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="MaCTHD")
	int macthd;

	@ManyToOne
	@JoinColumn(name = "MaSP")
	Product product;
	
	@ManyToOne
	@JoinColumn(name = "MaHD")
	HoaDon hoadon;
	
	@Column(name="SoLuong")
	int soluong;

	@ManyToOne
	@JoinColumn(name = "MaKH")
	User user;
	
	@Column(name="TrangThai")
	String trangthai;
	@Column(name="SoTien")
	int sotien;
	@Column(name="Ngay")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date ngay;
	public int getMacthd() {
		return macthd;
	}
	public void setMacthd(int macthd) {
		this.macthd = macthd;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public HoaDon getHoadon() {
		return hoadon;
	}
	public void setHoadon(HoaDon hoadon) {
		this.hoadon = hoadon;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getTrangthai() {
		return trangthai;
	}
	public void setTrangthai(String trangthai) {
		this.trangthai = trangthai;
	}
	public int getSotien() {
		return sotien;
	}
	public void setSotien(int sotien) {
		this.sotien = sotien;
	}
	public Date getNgay() {
		return ngay;
	}
	public void setNgay(Date ngay) {
		this.ngay = ngay;
	}
	
	
	
}
