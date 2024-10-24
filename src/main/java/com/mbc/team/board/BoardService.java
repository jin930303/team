package com.mbc.team.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface BoardService {

//... 공지사항

	//... 공지사항 입력
	void insertgongji(String id, String nickname, String gtitle, String gcontents, String gimagefn);
	void insertgongjix(String id, String nickname, String gtitle, String gcontents);

	//... 공지사항 출력
	public int total();
	public ArrayList<GongjiDTO> page(PageDTO dto);
	public ArrayList<GongjiDTO> gongjidayup(PageDTO dto);
	public ArrayList<GongjiDTO> gongjidaydown(PageDTO dto);
	public ArrayList<GongjiDTO> gongjiviewup(PageDTO dto);
	public ArrayList<GongjiDTO> gongjiviewdown(PageDTO dto);

	//... 공지사항 디테일
	GongjiDTO gongjidetail(int gnum);
	void gongjicount(int gnum);

	//... 공지사항 삭제
	void gongjidelete(int gnum);

	//... 공지사항 수정
	GongjiDTO gongjiupdateview(int gnum);
	void gongjiupdate(int gnum, String id, String nickname, String gtitle, String gcontents, String gimagefn);
	void gongjiupdatex(int gnum, String id, String nickname, String gtitle, String gcontents);

	//... 공지사항 검색
	public ArrayList<GongjiDTO> paget(PageDTO dto, String svalue);
	public int totalt(String svalue);
	public ArrayList<GongjiDTO> pagec(PageDTO dto, String svalue);
	public int totalc(String svalue);
	public ArrayList<GongjiDTO> pagen(PageDTO dto, String svalue);
	public int totaln(String svalue);
	
//... 자유게시판

	//... 자유게시판 입력
	void insertboardx(String nickname, String tag, String title, String ccontents);
	void insertboard(String nickname, String tag, String title, String ccontents, String cimagefn);
	
	//... 자유게시판 출력
	public int boardtotal();
	public ArrayList<BoardDTO> boardpage(PageDTO dto);
	public ArrayList<BoardDTO> boarddayup(PageDTO dto);
	public ArrayList<BoardDTO> boarddaydown(PageDTO dto);
	public ArrayList<BoardDTO> boardviewup(PageDTO dto);
	public ArrayList<BoardDTO> boardviewdown(PageDTO dto);
	public ArrayList<BoardDTO> boardlikeup(PageDTO dto);
	public ArrayList<BoardDTO> boardlikedown(PageDTO dto);

	//... 자유게시판 디테일
	void boardcount(int cnum);
	BoardDTO boarddetail(int cnum);
	void boardlike(int cnum);
	void boardhate(int cnum);

	//... 자유게시판 검색
	public ArrayList<BoardDTO> pagect(PageDTO dto, String svalue);
	public int totalct(String svalue);
	public ArrayList<BoardDTO> pagecc(PageDTO dto, String svalue);
	public int totalcc(String svalue);
	public ArrayList<BoardDTO> pagecn(PageDTO dto, String svalue);
	public int totalcn(String svalue);

	//... 자유게시판 댓글
	void stepup(int rpcgroup, int rpstep);
	void replyinsertb(int rpcnum, int rpcgroup, int rpstep, int rpindent, String ccontents, String nickname);
	ArrayList<BoardDTO> replyout(int cnum);

	//... 자유게시판 댓글 삭제
	void replydelete(int cnum);

	
	//... 자유게시판 삭제
	void boarddelete(int cnum);

	//... 자유게시판 검색
	BoardDTO boardupdateview(int cnum);
	void boardupdate(int cnum, String nickname, String tag, String title, String ccontents, String cimagefn);
	void boardupdatex(int cnum, String nickname, String tag, String title, String ccontents);

//... 경기일정
	
	//... 경기일정 입력
	void iljunginput(String gamedate, String gameresult);
	ArrayList<IljungDTO> iljungout();
	
	//... 경기일정 출력
	public int totalis();
	public ArrayList<IljungDTO> pageis(PageDTO dto);
	
	//... 경기일정 삭제
	void iljungdelete(String gamedate, String gameresult);

	//... 경기일정 수정
	IljungDTO iljungupdateview(String gamedate, String gameresult);
	void iljungupdate(String gamedate, String gameresult, String fgamedate, String fgameresult);

//... 야구소식

	//... 야구소식 입력
	void insertsosick(String id, String nickname, String stitle, String scontents, String simagefn, String stag);
	void insertsosickx(String id, String nickname, String stitle, String scontents, String stag);

	//... 야구소식 출력
	public int totals();
	public ArrayList<SosickDTO> pages(PageDTO dto);
	public ArrayList<SosickDTO> sosickdayup(PageDTO dto);
	public ArrayList<SosickDTO> sosickdaydown(PageDTO dto);
	public ArrayList<SosickDTO> sosickviewup(PageDTO dto);
	public ArrayList<SosickDTO> sosickviewdown(PageDTO dto);

	//... 야구소식 디테일
	SosickDTO sosickdetail(int snum);
	void sosickcount(int snum);
	
	//... 야구소식 삭제
	void sosickdelete(int snum);

	//... 야구소식 수정
	SosickDTO sosickupdateview(int snum);
	void sosickupdate(int snum, String id, String nickname, String stitle, String scontents, String simagefn, String stag);
	void sosickupdatex(int snum, String id, String nickname, String stitle, String scontents, String stag);

	//... 야구소식 검색
	public int totalst(String svalue);
	public ArrayList<SosickDTO> pagest(PageDTO dto, String svalue);

	public int totalsc(String svalue);
	public ArrayList<SosickDTO> pagesc(PageDTO dto, String svalue);

	public int totalsn(String svalue);
	public ArrayList<SosickDTO> pagesn(PageDTO dto, String svalue);

//... 이벤트
	
	//... 이벤트 입력
	void insertevent(String id, String nickname, String etitle, String econtents, String eimagemfn, String eimagedfn, String estate);
	
	//... 이벤트 출력
	public int totalev();
	public ArrayList<EventDTO> pageev(PageDTO dto);
	public ArrayList<EventDTO> eventdayup(PageDTO dto);
	public ArrayList<EventDTO> eventdaydown(PageDTO dto);
	public ArrayList<EventDTO> eventviewup(PageDTO dto);
	public ArrayList<EventDTO> eventviewdown(PageDTO dto);

	//... 이벤트 디테일
	void eventcount(int evnum);
	EventDTO eventdetail(int evnum);

	//... 이벤트 삭제
	void eventdelete(int evnum);

	//... 이벤트 수정
	EventDTO eventupdateview(int evnum);
	void updateevent(String id, String nickname, String etitle, String econtents, String eimagemfn, String eimagedfn, String estate, int evnum);
	void updateevent1(String id, String nickname, String etitle, String econtents, String estate, int evnum);
	void updateevent2(String id, String nickname, String etitle, String econtents, String eimagedufn, String estate, int evnum);
	void updateevent3(String id, String nickname, String etitle, String econtents, String eimagemufn, String estate, int evnum);
	
	//... 이벤트 검색
	public int totalet(String svalue);
	public ArrayList<EventDTO> pageet(PageDTO dto, String svalue);

	public int totalec(String svalue);
	public ArrayList<EventDTO> pageec(PageDTO dto, String svalue);

	public int totalevsi(String estate);
	public ArrayList<EventDTO> pageevsi(PageDTO dto, String estate);

	public int totalevse(String estate);
	public ArrayList<EventDTO> pageevse(PageDTO dto, String estate);

}
