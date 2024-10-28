package day1016;

import java.sql.Date;
import java.util.Arrays;

public class loginVO {
	private String id,pass,chk_pass,name,save,gender,addr2;
	private Date birth;
	private int tel, cellphone;
	private String[] email2,lang ;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getChk_pass() {
		return chk_pass;
	}
	public void setChk_pass(String chk_pass) {
		this.chk_pass = chk_pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSave() {
		return save;
	}
	public void setSave(String save) {
		this.save = save;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public int getCellphone() {
		return cellphone;
	}
	public void setCellphone(int cellphone) {
		this.cellphone = cellphone;
	}
	public String[] getEmail2() {
		return email2;
	}
	public void setEmail2(String[] email2) {
		this.email2 = email2;
	}
	public String[] getLang() {
		return lang;
	}
	public void setLang(String[] lang) {
		this.lang = lang;
	}
	@Override
	public String toString() {
		return "loginVO [id=" + id + ", pass=" + pass + ", chk_pass=" + chk_pass + ", name=" + name + ", save=" + save
				+ ", gender=" + gender + ", addr2=" + addr2 + ", birth=" + birth + ", tel=" + tel + ", cellphone="
				+ cellphone + ", email2=" + Arrays.toString(email2) + ", lang=" + Arrays.toString(lang) + "]";
	}
	
}
