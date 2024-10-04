package com.mbc.team.member;

public class MemberDTO {
	String id,nickname,pw,name,gender,birth,phone,phone1,phone2,mainaddress,detailaddress,extraaddress,address,email,fdomain,bdomain,grade;
	int total;
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDTO(String id, String nickname, String pw, String name, String gender, String birth, String phone,
			String phone1, String phone2, String mainaddress, String detailaddress, String extraaddress, String address,
			String email, String fdomain, String bdomain, String grade, int total) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.pw = pw;
		this.name = name;
		this.gender = gender;
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
		this.grade = grade;
		this.total = total;
	}
	
	

	
	
	
	
}
