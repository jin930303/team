package com.mbc.team.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface BoardService {

	//공지사항
	void insertgongji(String id, String nickname, String gtitle, String gcontents, String gimagefn);
	void insertgongjix(String id, String nickname, String gtitle, String gcontents);

	public int total();
	public ArrayList<GongjiDTO> page(PageDTO dto);

	GongjiDTO gongjidetail(int gnum);
	void gongjicount(int gnum);

	void gongjidelete(int gnum);

	GongjiDTO gongjiupdateview(int gnum);
	void gongjiupdate(int gnum, String id, String nickname, String gtitle, String gcontents, String gimagefn);
	void gongjiupdatex(int gnum, String id, String nickname, String gtitle, String gcontents);

	public ArrayList<GongjiDTO> paget(PageDTO dto, String svalue);
	public ArrayList<GongjiDTO> pagec(PageDTO dto, String svalue);
	public ArrayList<GongjiDTO> pagen(PageDTO dto, String svalue);

	public int totalt(String svalue);
	public int totalc(String svalue);
	public int totaln(String svalue);
	
	//자유게시판
	void insertboardx(String nickname, String tag, String title, String ccontents);
	void insertboard(String nickname, String tag, String title, String ccontents, String cimagefn);
	
	public int boardtotal();
	public ArrayList<BoardDTO> boardpage(PageDTO dto);

	void boardcount(int cnum);
	BoardDTO boarddetail(int cnum);

	void boardlike(int cnum);
	void boardhate(int cnum);

	public ArrayList<BoardDTO> pagect(PageDTO dto, String svalue);
	public ArrayList<BoardDTO> pagecc(PageDTO dto, String svalue);
	public ArrayList<BoardDTO> pagecn(PageDTO dto, String svalue);

	public int totalct(String svalue);
	public int totalcc(String svalue);
	public int totalcn(String svalue);

	void stepup(int rpcgroup, int rpstep);
	void replyinsertb(int rpcnum, int rpcgroup, int rpstep, int rpindent, String ccontents, String nickname);
	ArrayList<BoardDTO> replyout(int cnum);

	void boarddelete(int cnum);

	BoardDTO boardupdateview(int cnum);
	void boardupdate(int cnum, String nickname, String tag, String title, String ccontents, String cimagefn);
	void boardupdatex(int cnum, String nickname, String tag, String title, String ccontents);

	//경기일정
	void iljunginput(String gamedate, String gameresult);
	ArrayList<IljungDTO> iljungout();
	
	public int totalis();
	public ArrayList<IljungDTO> pageis(PageDTO dto);
	
	void iljungdelete(String gamedate, String gameresult);

	IljungDTO iljungupdateview(String gamedate, String gameresult);
	void iljungupdate(String gamedate, String gameresult, String fgamedate, String fgameresult);

	//야구소식	
	void insertsosick(String id, String nickname, String stitle, String scontents, String simagefn, String stag);
	void insertsosickx(String id, String nickname, String stitle, String scontents, String stag);

	public int totals();
	public ArrayList<SosickDTO> pages(PageDTO dto);

	SosickDTO sosickdetail(int snum);

	void sosickdelete(int snum);

	SosickDTO sosickupdateview(int snum);

	void sosickupdate(int snum, String id, String nickname, String stitle, String scontents, String simagefn, String stag);
	void sosickupdatex(int snum, String id, String nickname, String stitle, String scontents, String stag);

	public int totalst(String svalue);
	public ArrayList<SosickDTO> pagest(PageDTO dto, String svalue);

	public int totalsc(String svalue);
	public ArrayList<SosickDTO> pagesc(PageDTO dto, String svalue);

	public int totalsn(String svalue);
	public ArrayList<SosickDTO> pagesn(PageDTO dto, String svalue);

	void sosickcount(int snum);

	//이벤트
	public int totalev();
	public ArrayList<EventDTO> pageev(PageDTO dto);

	void insertevent(String id, String nickname, String etitle, String econtents, String eimagemfn, String eimagedfn, String estate);

	void eventcount(int evnum);
	EventDTO eventdetail(int evnum);

	void eventdelete(int evnum);

	EventDTO eventupdateview(int evnum);
	void updateevent(String id, String nickname, String etitle, String econtents, String eimagemfn, String eimagedfn, String estate, int evnum);

	public int totalet(String svalue);
	public ArrayList<EventDTO> pageet(PageDTO dto, String svalue);

	public int totalec(String svalue);
	public ArrayList<EventDTO> pageec(PageDTO dto, String svalue);

	public int totalevsi(String estate);
	public ArrayList<EventDTO> pageevsi(PageDTO dto, String estate);

	public int totalevse(String estate);
	public ArrayList<EventDTO> pageevse(PageDTO dto, String estate);

	
}
