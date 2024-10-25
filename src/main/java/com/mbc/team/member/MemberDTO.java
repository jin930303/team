package com.mbc.team.member;

public class MemberDTO {
	String id,nickname,pw,name,birth,phone,phone1,phone2,mainaddress,detailaddress,extraaddress,address,email,fdomain,bdomain,grade_code,auth,grade_name;
	int total;
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDTO(String id, String nickname, String pw, String name, String birth, String phone, String phone1,
			String phone2, String mainaddress, String detailaddress, String extraaddress, String address, String email,
			String fdomain, String bdomain, String grade_code, String auth, String grade_name, int total) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.mainaddress = mainaddress;
		this.detailaddress = detailaddress;
		this.extraaddress = extraaddress;
		this.address = address;
		this.email = email;
		this.fdomain = fdomain;
		this.bdomain = bdomain;
		this.grade_code = grade_code;
		this.auth = auth;
		this.grade_name = grade_name;
		this.total = total;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getMainaddress() {
		return mainaddress;
	}
	public void setMainaddress(String mainaddress) {
		this.mainaddress = mainaddress;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getExtraaddress() {
		return extraaddress;
	}
	public void setExtraaddress(String extraaddress) {
		this.extraaddress = extraaddress;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFdomain() {
		return fdomain;
	}
	public void setFdomain(String fdomain) {
		this.fdomain = fdomain;
	}
	public String getBdomain() {
		return bdomain;
	}
	public void setBdomain(String bdomain) {
		this.bdomain = bdomain;
	}
	public String getGrade_code() {
		return grade_code;
	}
	public void setGrade_code(String grade_code) {
		this.grade_code = grade_code;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	
	
}
