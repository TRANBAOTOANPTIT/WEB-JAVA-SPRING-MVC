package ptithcm.entity;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import ptithcm.encrypt.AES;

@Entity
@Table(name = "Users")
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3530010885697280401L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@JoinColumn(name = "MaKH")
	private int makh;
	@Column(name = "Username")
	private String username;
	@Column(name = "Password")
	private String password;
	@Column(name = "Phanquyen")
	private String phanquyen;
	@Column(name = "Ho")
	private String ho;
	@Column(name = "Ten")
	private String ten;
	@Column(name = "Email")
	private String email;
	@Column(name = "SDT")
	private String sdt;
	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	Collection<CTHoaDon> ctHoaDons;

	public Collection<CTHoaDon> getCtHoaDons() {
		return ctHoaDons;
	}

	public void setCtHoaDons(Collection<CTHoaDon> ctHoaDons) {
		this.ctHoaDons = ctHoaDons;
	}

	public int getMakh() {
		return makh;
	}

	public void setMakh(int makh) {
		this.makh = makh;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhanquyen() {
		return phanquyen;
	}

	public void setPhanquyen(String phanquyen) {
		this.phanquyen = phanquyen;
	}

	public String getHo() {
		return ho;
	}

	public void setHo(String ho) {
		this.ho = ho;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public User(int makh, String username, String password, String phanquyen, String ho, String ten, String email,
			String sdt) {
		super();
		this.makh = makh;
		this.username = username;
		this.password = password;
		this.phanquyen = phanquyen;
		this.ho = ho;
		this.ten = ten;
		this.email = email;
		this.sdt = sdt;
	}

	
	/*
	 * public User usemail(User user) { AES aes = new AES();
	 * user.setEmail(aes.decrypt(user.getEmail(),"N18DCAT076"));
	 * user.setSdt(aes.decrypt(user.getSdt(),"N18DCAT076")); return user; }
	 */
	 
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

}
