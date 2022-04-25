package ptithcm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="HoaDon")
public class HoaDon {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="MaHD")
	int mahd;
	
	@OneToMany(mappedBy = "hoadon",fetch = FetchType.EAGER)
	Collection<CTHoaDon> cthoadons;
	
	@Column(name="Ngay")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date ngay;
	@Column(name="TrangThai")
	String trangthai;
	@Column(name="SoTien")
	int sotien;
	@Column(name="MaKH")
	int makh;
	public int getMahd() {
		return mahd;
	}
	public void setMahd(int mahd) {
		this.mahd = mahd;
	}
	
	public Collection<CTHoaDon> getCthoadons() {
		return cthoadons;
	}
	public void setCthoadons(Collection<CTHoaDon> cthoadons) {
		this.cthoadons = cthoadons;
	}
	public Date getNgay() {
		return ngay;
	}
	public void setNgay(Date ngay) {
		this.ngay = ngay;
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
	public int getMakh() {
		return makh;
	}
	public void setMakh(int makh) {
		this.makh = makh;
	}
	
	
	
	

}
