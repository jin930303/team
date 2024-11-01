package com.mbc.team.board;

public class EventDTO {
	String id, nickname, etitle, econtents, edate, eimagem, eimaged, estate;
	int evnum, ecnt;
	
	public EventDTO() {}

	public EventDTO(String id, String nickname, String etitle, String econtents, String edate, int ecnt,
			String eimagem, String eimaged, String estate, int evnum) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.etitle = etitle;
		this.econtents = econtents;
		this.edate = edate;
		this.ecnt = ecnt;
		this.eimagem = eimagem;
		this.eimaged = eimaged;
		this.estate = estate;
		this.evnum = evnum;
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

	public String getEtitle() {
		return etitle;
	}

	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}

	public String getEcontents() {
		return econtents;
	}

	public void setEcontents(String econtents) {
		this.econtents = econtents;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public int getEcnt() {
		return ecnt;
	}

	public void setEcnt(int ecnt) {
		this.ecnt = ecnt;
	}

	public String getEimagem() {
		return eimagem;
	}

	public void setEimagem(String eimagem) {
		this.eimagem = eimagem;
	}

	public String getEimaged() {
		return eimaged;
	}

	public void setEimaged(String eimaged) {
		this.eimaged = eimaged;
	}

	public String getEstate() {
		return estate;
	}

	public void setEstate(String estate) {
		this.estate = estate;
	}

	public int getEvnum() {
		return evnum;
	}

	public void setEvnum(int evnum) {
		this.evnum = evnum;
	}
	


}
