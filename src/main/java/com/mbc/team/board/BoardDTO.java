package com.mbc.team.board;

public class BoardDTO {
	String tab, title, cdate, ccontents, nickname, cimage;
	int cnum, cgroup, step, indent, clike, chate, ccnt;
	
	public BoardDTO() {}

	public BoardDTO(String tab, String title, String cdate, String ccontents, String nickname, String cimage, int cnum,
			int cgroup, int step, int indent, int clike, int chate, int ccnt) {
		super();
		this.tab = tab;
		this.title = title;
		this.cdate = cdate;
		this.ccontents = ccontents;
		this.nickname = nickname;
		this.cimage = cimage;
		this.cnum = cnum;
		this.cgroup = cgroup;
		this.step = step;
		this.indent = indent;
		this.clike = clike;
		this.chate = chate;
		this.ccnt = ccnt;
	}

	public String getTab() {
		return tab;
	}

	public void setTab(String tab) {
		this.tab = tab;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getCcontents() {
		return ccontents;
	}

	public void setCcontents(String ccontents) {
		this.ccontents = ccontents;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getCimage() {
		return cimage;
	}

	public void setCimage(String cimage) {
		this.cimage = cimage;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public int getCgroup() {
		return cgroup;
	}

	public void setCgroup(int cgroup) {
		this.cgroup = cgroup;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getIndent() {
		return indent;
	}

	public void setIndent(int indent) {
		this.indent = indent;
	}

	public int getClike() {
		return clike;
	}

	public void setClike(int clike) {
		this.clike = clike;
	}

	public int getChate() {
		return chate;
	}

	public void setChate(int chate) {
		this.chate = chate;
	}

	public int getCcnt() {
		return ccnt;
	}

	public void setCcnt(int ccnt) {
		this.ccnt = ccnt;
	}


}
