package com.mbc.team.board;

public class GongjiDTO {
	String id, nickname, gtitle, gcontents, gdate, gimage;
	int gnum, gcnt;
	
	public GongjiDTO() {}

	public GongjiDTO(String id, String nickname, String gtitle, String gcontents, String gdate, String gimage, int gnum,
			int gcnt) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.gtitle = gtitle;
		this.gcontents = gcontents;
		this.gdate = gdate;
		this.gimage = gimage;
		this.gnum = gnum;
		this.gcnt = gcnt;
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

	public String getGtitle() {
		return gtitle;
	}

	public void setGtitle(String gtitle) {
		this.gtitle = gtitle;
	}

	public String getGcontents() {
		return gcontents;
	}

	public void setGcontents(String gcontents) {
		this.gcontents = gcontents;
	}

	public String getGdate() {
		return gdate;
	}

	public void setGdate(String gdate) {
		this.gdate = gdate;
	}

	public String getGimage() {
		return gimage;
	}

	public void setGimage(String gimage) {
		this.gimage = gimage;
	}

	public int getGnum() {
		return gnum;
	}

	public void setGnum(int gnum) {
		this.gnum = gnum;
	}

	public int getGcnt() {
		return gcnt;
	}

	public void setGcnt(int gcnt) {
		this.gcnt = gcnt;
	}

}
