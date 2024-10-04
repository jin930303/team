package com.mbc.team.board;

public class SosickDTO {
	String id, nickname, stitle, scontents, sdate, scnt, simage, stag;
	int snum;
	
	public SosickDTO() {}

	public SosickDTO(String id, String nickname, String stitle, String scontents, String sdate, String scnt,
			String simage, String stag, int snum) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.stitle = stitle;
		this.scontents = scontents;
		this.sdate = sdate;
		this.scnt = scnt;
		this.simage = simage;
		this.stag = stag;
		this.snum = snum;
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

	public String getStitle() {
		return stitle;
	}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}

	public String getScontents() {
		return scontents;
	}

	public void setScontents(String scontents) {
		this.scontents = scontents;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getScnt() {
		return scnt;
	}

	public void setScnt(String scnt) {
		this.scnt = scnt;
	}

	public String getSimage() {
		return simage;
	}

	public void setSimage(String simage) {
		this.simage = simage;
	}

	public String getStag() {
		return stag;
	}

	public void setStag(String stag) {
		this.stag = stag;
	}

	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
	}


}
