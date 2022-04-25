package ptithcm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="SanPham")
public class Product {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="MaSP")
	private int masp;
	@Column(name="TenSP")
	private String tensp;
	@Column(name="MoTaSP")
	private String motasp;
	@Column(name="GiaSP")
	private int giasp;
	@Column(name="AnhSP")
	private String anhsp;
	
	@Column(name="NgayTaoSP")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ngaytaosp;
	
	@Column(name="SoLuongSP")
	private int soluongsp;
	
	@ManyToOne
	@JoinColumn(name = "MaLoaiSP")
	Type type;
	
	@Column(name="HangSX")
	private String hangsx;
	
	@OneToMany(mappedBy = "product",fetch = FetchType.EAGER)
	Collection<CTHoaDon> ctHoaDons;

	public int getMasp() {
		return masp;
	}

	public void setMasp(int masp) {
		this.masp = masp;
	}

	public String getTensp() {
		return tensp;
	}

	public void setTensp(String tensp) {
		this.tensp = tensp;
	}

	public String getMotasp() {
		return motasp;
	}

	public void setMotasp(String motasp) {
		this.motasp = motasp;
	}

	public int getGiasp() {
		return giasp;
	}

	public void setGiasp(int giasp) {
		this.giasp = giasp;
	}

	public String getAnhsp() {
		return anhsp;
	}

	public void setAnhsp(String anhsp) {
		this.anhsp = anhsp;
	}

	public Date getNgaytaosp() {
		return ngaytaosp;
	}

	public void setNgaytaosp(Date ngaytaosp) {
		this.ngaytaosp = ngaytaosp;
	}

	public int getSoluongsp() {
		return soluongsp;
	}

	public void setSoluongsp(int soluongsp) {
		this.soluongsp = soluongsp;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public String getHangsx() {
		return hangsx;
	}

	public void setHangsx(String hangsx) {
		this.hangsx = hangsx;
	}

	public Collection<CTHoaDon> getCtHoaDons() {
		return ctHoaDons;
	}

	public void setCtHoaDons(Collection<CTHoaDon> ctHoaDons) {
		this.ctHoaDons = ctHoaDons;
	}

	public Product(int masp, String tensp, String motasp, int giasp, String anhsp, Date ngaytaosp, int soluongsp,
			Type type, String hangsx, Collection<CTHoaDon> ctHoaDons) {
		super();
		this.masp = masp;
		this.tensp = tensp;
		this.motasp = motasp;
		this.giasp = giasp;
		this.anhsp = anhsp;
		this.ngaytaosp = ngaytaosp;
		this.soluongsp = soluongsp;
		this.type = type;
		this.hangsx = hangsx;
		this.ctHoaDons = ctHoaDons;
	}

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
	
}
