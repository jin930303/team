package com.mbc.team.board;

public class IljungDTO {
    String gamedate, gameresult;

	public IljungDTO() {}

	public IljungDTO(String gamedate, String gameresult) {
		super();
		this.gamedate = gamedate;
		this.gameresult = gameresult;
	}

	public String getGamedate() {
		return gamedate;
	}

	public void setGamedate(String gamedate) {
		this.gamedate = gamedate;
	}

	public String getGameresult() {
		return gameresult;
	}

	public void setGameresult(String gameresult) {
		this.gameresult = gameresult;
	}
    
    
}