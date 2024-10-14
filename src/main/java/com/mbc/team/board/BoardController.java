package com.mbc.team.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class BoardController {

	String savepath="C://team//team//src//main//webapp//image";
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/gongjiinput", method = RequestMethod.GET)
	public String gongjiinput() {
		return "gongjiinput";
	}
	
	@RequestMapping(value = "/gongjisave", method = RequestMethod.POST)
	public String gongjisave(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		BoardService bs=sqlsession.getMapper(BoardService.class);
		String id=mul.getParameter("id");
		String nickname=mul.getParameter("nickname");
		String gtitle=mul.getParameter("gtitle");
		String gcontents=mul.getParameter("gcontents");
		MultipartFile mf=mul.getFile("gimage");
	    if (mf == null || mf.isEmpty()) {
			bs.insertgongjix(id, nickname, gtitle, gcontents);
		}
		else {
			String gimagefn=mf.getOriginalFilename();
			mf.transferTo(new File(savepath+"//"+gimagefn));
			bs.insertgongji(id, nickname, gtitle, gcontents, gimagefn);
		}
		return "redirect:/gongjiboard";
	}
	
	@RequestMapping(value = "/gongjiboard", method = RequestMethod.GET)
	public String gongjiboard(Model mo, PageDTO dto, HttpServletRequest request) {
		String nowPage=request.getParameter("nowPage");
		String cntPerPage=request.getParameter("cntPerPage");
		BoardService bs=sqlsession.getMapper(BoardService.class);
		int total=bs.total();
		if(nowPage==null && cntPerPage == null) {
			nowPage="1";
			cntPerPage="10";
		}
		else if(nowPage==null) {
			nowPage="1";
		}
		else if(cntPerPage==null) {
			cntPerPage="10";
		} 
		dto=new PageDTO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		mo.addAttribute("paging",dto);
		mo.addAttribute("list", bs.page(dto));
		return "gongjiboard";
	}
	
	@RequestMapping(value = "/gongjidetail", method = RequestMethod.GET)
	public String gongjidetail(Model mo, HttpServletRequest request) {
		int gnum=Integer.parseInt(request.getParameter("gnum"));
		BoardService bs=sqlsession.getMapper(BoardService.class);
		bs.gongjicount(gnum);
		GongjiDTO list=bs.gongjidetail(gnum);
		mo.addAttribute("list",list);
		return "gongjiout";
	}
	
	@RequestMapping(value = "/gongjidelete", method = RequestMethod.GET)
	public String gongjidelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int gnum=Integer.parseInt(request.getParameter("gnum"));
		BoardService bs=sqlsession.getMapper(BoardService.class);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter prw=response.getWriter();
		prw.print("<script> alert('해당 글을 삭제하였습니다.');</script>");
		prw.print("<script> location.href='gongjiboard';</script>");
		prw.close();
		bs.gongjidelete(gnum);
		return "redirect:/gongjiboard";
	}
	
	@RequestMapping(value = "/gongjiupdateview", method = RequestMethod.GET)
	public String gongjiupdateview(HttpServletRequest request, Model mo) {
		int gnum=Integer.parseInt(request.getParameter("gnum"));
		BoardService bs=sqlsession.getMapper(BoardService.class);
		GongjiDTO list=bs.gongjiupdateview(gnum);
		mo.addAttribute("list", list);
		return "gongjiupdateview";
	}
	
	@RequestMapping(value = "/gongjiupdate", method = RequestMethod.POST)
	public String gongjiupdate(HttpServletResponse response, MultipartHttpServletRequest mul) throws IOException {
		BoardService bs=sqlsession.getMapper(BoardService.class);
		int gnum=Integer.parseInt(mul.getParameter("gnum"));
		String id=mul.getParameter("id");
		String nickname=mul.getParameter("nickname");
		String gtitle=mul.getParameter("gtitle");
		String gcontents=mul.getParameter("gcontents");
		MultipartFile mf=mul.getFile("gimage");
	    if (mf == null || mf.isEmpty()) {
	    	bs.gongjiupdatex(gnum, id, nickname, gtitle, gcontents);
		}
		else {
			String gimagefn=mf.getOriginalFilename();
			mf.transferTo(new File(savepath+"//"+gimagefn));
			bs.gongjiupdate(gnum, id, nickname, gtitle, gcontents, gimagefn);
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter prw=response.getWriter();
		prw.print("<script> alert('수정이 완료되었습니다.');</script>");
		prw.print("<script> location.href='gongjiboard';</script>");
		prw.close();
		return "redirect:/gongjidetail?gnum=" + gnum;
	}
	
	@RequestMapping(value = "/gongjisearchsave", method = RequestMethod.POST)
	public String gongjisearchsave(HttpServletRequest request, Model mo, PageDTO dto, @RequestParam("svalue") String svalue, @RequestParam("gongjikey") String gongjikey, HttpServletResponse response) throws IOException {
		String nowPage=request.getParameter("nowPage");
		String cntPerPage=request.getParameter("cntPerPage");
		BoardService bs=sqlsession.getMapper(BoardService.class);
		
		if(nowPage==null && cntPerPage == null) {
			nowPage="1";
			cntPerPage="10";
		}
		else if(nowPage==null) {
			nowPage="1";
		}
		else if(cntPerPage==null) {
			cntPerPage="10";
		} 
	    if (svalue == null || svalue.trim().equals("")) {
	        response.setContentType("text/html;charset=utf-8");
	        PrintWriter prw = response.getWriter();
			prw.print("<script> alert('검색어를 입력해주세요.');</script>");
			prw.print("<script> location.href='gongjiboard';</script>");
	        prw.flush();
	        prw.close();
	        return null;
		}
		else {
			svalue="%"+svalue+"%";
			if(gongjikey.equals("gtitle")) {
				int totalt=bs.totalt(svalue);
				dto=new PageDTO(totalt,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
				mo.addAttribute("paging",dto);
				mo.addAttribute("list", bs.paget(dto, svalue));
			}
			else if(gongjikey.equals("gcontents")) {
				int totalc=bs.totalc(svalue);
				dto=new PageDTO(totalc,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
				mo.addAttribute("paging",dto);
				mo.addAttribute("list", bs.pagec(dto, svalue));
			}
			else {
				int totaln=bs.totaln(svalue);
				dto=new PageDTO(totaln,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
				mo.addAttribute("paging",dto);
				mo.addAttribute("list", bs.pagen(dto, svalue));
			}
			return "gongjisearchview";
		}
	}
	
	@RequestMapping(value = "/boardinput", method = RequestMethod.GET)
	public String boardinput() {
		return "boardinput";
	}
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(Model mo, PageDTO dto, HttpServletRequest request) {
		String nowPage=request.getParameter("nowPage");
		String cntPerPage=request.getParameter("cntPerPage");
		BoardService bs=sqlsession.getMapper(BoardService.class);
		int btotal=bs.boardtotal();
		if(nowPage==null && cntPerPage == null) {
			nowPage="1";
			cntPerPage="10";
		}
		else if(nowPage==null) {
			nowPage="1";
		}
		else if(cntPerPage==null) {
			cntPerPage="10";
		} 
		dto=new PageDTO(btotal,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		mo.addAttribute("paging",dto);
		mo.addAttribute("list", bs.boardpage(dto));
		return "board";
	}
	
	@RequestMapping(value = "/boardsave", method = RequestMethod.POST)
	public String boardsave(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		BoardService bs=sqlsession.getMapper(BoardService.class);
		String tag=mul.getParameter("tag");
		String nickname=mul.getParameter("nickname");
		String title=mul.getParameter("title");
		String ccontents=mul.getParameter("ccontents");
		MultipartFile mf=mul.getFile("cimage");
	    if (mf == null || mf.isEmpty()) {
			bs.insertboardx(nickname, tag, title, ccontents);
		}
		else {
			String cimagefn=mf.getOriginalFilename();
			mf.transferTo(new File(savepath+"//"+cimagefn));
			bs.insertboard(nickname, tag, title, ccontents, cimagefn);
		}
		return "redirect:/board";
	}
	
	@RequestMapping(value = "/boarddetail", method = RequestMethod.GET)
	public String boarddetail(Model mo, HttpServletRequest request) {
		int cnum=Integer.parseInt(request.getParameter("cnum"));
		BoardService bs=sqlsession.getMapper(BoardService.class);
		bs.boardcount(cnum);
		BoardDTO list=bs.boarddetail(cnum);
		mo.addAttribute("list",list);
		ArrayList<BoardDTO>reply=bs.replyout(cnum);
		mo.addAttribute("reply",reply);
		return "boardout";
	}
	
	@RequestMapping(value = "/boardlike", method = RequestMethod.GET)
	public String boardlike(Model mo, @RequestParam("cnum") int cnum) {
		BoardService bs=sqlsession.getMapper(BoardService.class);
		bs.boardlike(cnum);
		BoardDTO list=bs.boarddetail(cnum);
		mo.addAttribute("list",list);
		return "redirect:/boarddetail?cnum=" + cnum;
		}
	
	@RequestMapping(value = "/boardhate", method = RequestMethod.GET)
	public String boardhate(Model mo, @RequestParam("cnum") int cnum) {
		BoardService bs=sqlsession.getMapper(BoardService.class);
		bs.boardhate(cnum);
		BoardDTO list=bs.boarddetail(cnum);
		mo.addAttribute("list",list);
		return "redirect:/boarddetail?cnum=" + cnum;
	}
	
	@RequestMapping(value = "/boardsearchsave", method = RequestMethod.POST)
	public String boardsearchsave(HttpServletRequest request, Model mo, PageDTO dto, @RequestParam("svalue") String svalue, @RequestParam("boardkey") String boardkey, HttpServletResponse response) throws IOException {
		String nowPage=request.getParameter("nowPage");
		String cntPerPage=request.getParameter("cntPerPage");
		BoardService bs=sqlsession.getMapper(BoardService.class);
		
		if(nowPage==null && cntPerPage == null) {
			nowPage="1";
			cntPerPage="10";
		}
		else if(nowPage==null) {
			nowPage="1";
		}
		else if(cntPerPage==null) {
			cntPerPage="10";
		} 
	    if (svalue == null || svalue.trim().equals("")) {
	        response.setContentType("text/html;charset=utf-8");
	        PrintWriter prw = response.getWriter();
			prw.print("<script> alert('검색어를 입력해주세요.');</script>");
			prw.print("<script> location.href='board';</script>");
	        prw.flush();
	        prw.close();
	        return null;
		}
		else {
			svalue="%"+svalue+"%";
			if(boardkey.equals("ctitle")) {
				int totalct=bs.totalct(svalue);
				dto=new PageDTO(totalct,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
				mo.addAttribute("paging",dto);
				mo.addAttribute("list", bs.pagect(dto, svalue));
			}
			else if(boardkey.equals("ccontents")) {
				int totalcc=bs.totalcc(svalue);
				dto=new PageDTO(totalcc,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
				mo.addAttribute("paging",dto);
				mo.addAttribute("list", bs.pagecc(dto, svalue));
			}
			else {
				int totalcn=bs.totalcn(svalue);
				dto=new PageDTO(totalcn,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
				mo.addAttribute("paging",dto);
				mo.addAttribute("list", bs.pagecn(dto, svalue));
			}
			return "boardsearchview";
		}
	}//
	
	@RequestMapping(value = "/boardreplysave", method = RequestMethod.POST)
	public String boardreplysave(HttpServletRequest request, Model mo) {
		int rpcnum=Integer.parseInt(request.getParameter("cnum"));
		int rpcgroup=Integer.parseInt(request.getParameter("cgroup"));
		int rpstep=Integer.parseInt(request.getParameter("step"));
		int rpindent=Integer.parseInt(request.getParameter("indent"));
		String ccontents=request.getParameter("ccontents");
		String nickname=request.getParameter("nickname");
		BoardService bs=sqlsession.getMapper(BoardService.class);
		bs.stepup(rpcgroup, rpstep);
		rpstep++;
		rpindent++;
		bs.replyinsertb(rpcnum, rpcgroup, rpstep, rpindent, ccontents, nickname);
	    return "redirect:/boarddetail?cnum=" + rpcnum;
	}//
	
	@RequestMapping(value = "/boarddelete", method = RequestMethod.GET)
	public String boarddelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int cnum=Integer.parseInt(request.getParameter("cnum"));
		BoardService bs=sqlsession.getMapper(BoardService.class);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter prw=response.getWriter();
		prw.print("<script> alert('해당 글을 삭제하였습니다.');</script>");
		prw.print("<script> location.href='board';</script>");
		prw.close();
		bs.boarddelete(cnum);
		return "redirect:/board";
	}
	
	@RequestMapping(value = "/boardupdateview", method = RequestMethod.GET)
	public String boardupdateview(HttpServletRequest request, Model mo) {
		int cnum=Integer.parseInt(request.getParameter("cnum"));
		BoardService bs=sqlsession.getMapper(BoardService.class);
		BoardDTO list=bs.boardupdateview(cnum);
		mo.addAttribute("list", list);
		return "boardupdateview";
	}
	
	@RequestMapping(value = "/boardupdate", method = RequestMethod.POST)
	public String boardupdate(HttpServletResponse response, MultipartHttpServletRequest mul) throws IOException {
		BoardService bs=sqlsession.getMapper(BoardService.class);
		int cnum=Integer.parseInt(mul.getParameter("cnum"));
		String tag=mul.getParameter("tag");
		String nickname=mul.getParameter("nickname");
		String title=mul.getParameter("title");
		String ccontents=mul.getParameter("ccontents");
		MultipartFile mf=mul.getFile("cimage");
	    if (mf == null || mf.isEmpty()) {
			bs.boardupdatex(cnum, nickname, tag, title, ccontents);
		}
		else {
			String cimagefn=mf.getOriginalFilename();
			mf.transferTo(new File(savepath+"//"+cimagefn));
			bs.boardupdate(cnum, nickname, tag, title, ccontents, cimagefn);
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter prw=response.getWriter();
		prw.print("<script> alert('수정이 완료되었습니다.');</script>");
		prw.print("<script> location.href='board';</script>");
		prw.close();
		return "redirect:/boarddetail?cnum=" + cnum;
	}

	@RequestMapping(value = "/iljung", method = RequestMethod.GET)
	public String iljung() {
		return "iljung";
	}
	
	@RequestMapping(value = "/iljunginput", method = RequestMethod.GET)
	public String iljunginput() {
		return "iljunginput";
	}
	
	@RequestMapping(value = "/iljungsave", method = RequestMethod.POST)
	public String iljungsave(HttpServletRequest request) {
		String leaguestate=request.getParameter("leaguestate");
		int state=Integer.parseInt(request.getParameter("state"));
		String gamedate=request.getParameter("gamedate");
		String home=request.getParameter("home");
		String away=request.getParameter("away");
		int homescore=Integer.parseInt(request.getParameter("homescore"));
		int awayscore=Integer.parseInt(request.getParameter("awayscore"));
		String gamestate=request.getParameter("gamestate");
		String gameresult="";
		
		if(gamestate.equals("진행")&&leaguestate.equals("TB")) {
			gameresult=leaguestate+" "+home+" "+homescore+" : "+awayscore+" "+away;
		}
		else if(gamestate.equals("진행")&&leaguestate.equals("WC")) {
			gameresult=leaguestate+state+" "+home+" "+homescore+" : "+awayscore+" "+away;
		}
		else if(gamestate.equals("진행")&&leaguestate.equals("준PO")) {
			gameresult=leaguestate+state+" "+home+" "+homescore+" : "+awayscore+" "+away;
		}
		else if(gamestate.equals("진행")&&leaguestate.equals("PO")) {
			gameresult=leaguestate+state+" "+home+" "+homescore+" : "+awayscore+" "+away;
		}
		else if(gamestate.equals("진행")&&leaguestate.equals("KS")) {
			gameresult=leaguestate+state+" "+home+" "+homescore+" : "+awayscore+" "+away;
		}
		else if(gamestate.equals("진행")&&leaguestate.equals("정규시즌")) {
			gameresult=home+" "+homescore+" : "+awayscore+" "+away;
		}
		else if(gamestate.equals("예정")&&leaguestate.equals("TB")) {
			gameresult=leaguestate+" "+home+" 예정 "+away;
		}
		else if(gamestate.equals("예정")&&leaguestate.equals("WC")) {
			gameresult=leaguestate+state+" "+home+" 예정 "+away;
		}
		else if(gamestate.equals("예정")&&leaguestate.equals("준PO")) {
			gameresult=leaguestate+state+" "+home+" 예정 "+away;
		}
		else if(gamestate.equals("예정")&&leaguestate.equals("PO")) {
			gameresult=leaguestate+state+" "+home+" 예정 "+away;
		}
		else if(gamestate.equals("예정")&&leaguestate.equals("KS")) {
			gameresult=leaguestate+state+" "+home+" 예정 "+away;
		}
		else if(gamestate.equals("예정")&&leaguestate.equals("정규시즌")) {
			gameresult=home+" 예정 "+away;
		}
		else if(gamestate.equals("취소")&&leaguestate.equals("TB")) {
			gameresult=leaguestate+" "+home+" 취소 "+away;
		}
		else if(gamestate.equals("취소")&&leaguestate.equals("WC")) {
			gameresult=leaguestate+state+" "+home+" 취소 "+away;
		}
		else if(gamestate.equals("취소")&&leaguestate.equals("준PO")) {
			gameresult=leaguestate+state+" "+home+" 취소 "+away;
		}
		else if(gamestate.equals("취소")&&leaguestate.equals("PO")) {
			gameresult=leaguestate+state+" "+home+" 취소 "+away;
		}
		else if(gamestate.equals("취소")&&leaguestate.equals("KS")) {
			gameresult=leaguestate+state+" "+home+" 취소 "+away;
		}
		else if(gamestate.equals("취소")&&leaguestate.equals("정규시즌")) {
			gameresult=home+" 취소 "+away;
		}
		BoardService bs=sqlsession.getMapper(BoardService.class);
		bs.iljunginput(gamedate, gameresult);
		return "iljung";
	}
	
	@RequestMapping(value = "gameiljung", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> events() {
	    BoardService bs = sqlsession.getMapper(BoardService.class);
	    ArrayList<IljungDTO> list = bs.iljungout();
	    List<Map<String, Object>> jsonList = new ArrayList<>();
	    for (IljungDTO dto : list) {
	        Map<String, Object> event = new HashMap<>();
	        event.put("title", dto.getGameresult());
	        event.put("start", dto.getGamedate().toString()); // 기본적으로 시간을 붙임
	        jsonList.add(event);
	    }
	    return jsonList; // JSON 형식으로 반환
	}
	
	@RequestMapping(value = "/sosickinput", method = RequestMethod.GET)
	public String sosickinput() {
		return "sosickinput";
	}
	
	@RequestMapping(value = "/sosicksave", method = RequestMethod.POST)
	public String sosicksave(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		BoardService bs=sqlsession.getMapper(BoardService.class);
		String id=mul.getParameter("id");
		String nickname=mul.getParameter("nickname");
		String stag=mul.getParameter("stag");
		String stitle=mul.getParameter("stitle");
		String scontents=mul.getParameter("scontents");
		MultipartFile mf=mul.getFile("simage");
	    if (mf == null || mf.isEmpty()) {
			bs.insertsosickx(id, nickname, stitle, scontents, stag);
		}
		else {
			String simagefn=mf.getOriginalFilename();
			mf.transferTo(new File(savepath+"//"+simagefn));
			bs.insertsosick(id, nickname, stitle, scontents, simagefn, stag);
		}
		return "redirect:/sosickboard";
	}
	
	@RequestMapping(value = "/sosickboard", method = RequestMethod.GET)
	public String sosickboard(Model mo, PageDTO dto, HttpServletRequest request) {
		String nowPage=request.getParameter("nowPage");
		String cntPerPage=request.getParameter("cntPerPage");
		BoardService bs=sqlsession.getMapper(BoardService.class);
		int totals=bs.totals();
		if(nowPage==null && cntPerPage == null) {
			nowPage="1";
			cntPerPage="10";
		}
		else if(nowPage==null) {
			nowPage="1";
		}
		else if(cntPerPage==null) {
			cntPerPage="10";
		} 
		dto=new PageDTO(totals,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		mo.addAttribute("paging",dto);
		mo.addAttribute("list", bs.pages(dto));
		return "sosickboard";
	}
	
	@RequestMapping(value = "/sosickdetail", method = RequestMethod.GET)
	public String sosickdetail(Model mo, HttpServletRequest request) {
		int snum=Integer.parseInt(request.getParameter("snum"));
		BoardService bs=sqlsession.getMapper(BoardService.class);
		bs.sosickcount(snum);
		SosickDTO list=bs.sosickdetail(snum);
		mo.addAttribute("list",list);
		return "sosickout";
	}
	
	@RequestMapping(value = "/sosickdelete", method = RequestMethod.GET)
	public String sosickdelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int snum=Integer.parseInt(request.getParameter("snum"));
		BoardService bs=sqlsession.getMapper(BoardService.class);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter prw=response.getWriter();
		prw.print("<script> alert('해당 글을 삭제하였습니다.');</script>");
		prw.print("<script> location.href='sosickboard';</script>");
		prw.close();
		bs.sosickdelete(snum);
		return "redirect:/sosickboard";
	}
	
	@RequestMapping(value = "/sosickupdateview", method = RequestMethod.GET)
	public String sosickupdateview(HttpServletRequest request, Model mo) {
		int snum=Integer.parseInt(request.getParameter("snum"));
		BoardService bs=sqlsession.getMapper(BoardService.class);
		SosickDTO list=bs.sosickupdateview(snum);
		mo.addAttribute("list", list);
		return "sosickupdateview";
	}
	
	@RequestMapping(value = "/sosickupdate", method = RequestMethod.POST)
	public String sosickupdate(HttpServletResponse response, MultipartHttpServletRequest mul) throws IOException {
		int snum=Integer.parseInt(mul.getParameter("snum"));
		BoardService bs=sqlsession.getMapper(BoardService.class);
		String id=mul.getParameter("id");
		String nickname=mul.getParameter("nickname");
		String stag=mul.getParameter("stag");
		String stitle=mul.getParameter("stitle");
		String scontents=mul.getParameter("scontents");
		MultipartFile mf=mul.getFile("gimage");
	    if (mf == null || mf.isEmpty()) {
			bs.sosickupdatex(snum, id, nickname, stitle, scontents, stag);
		}
		else {
			String simagefn=mf.getOriginalFilename();
			mf.transferTo(new File(savepath+"//"+simagefn));
			bs.sosickupdate(snum, id, nickname, stitle, scontents, simagefn, stag);
		}

		response.setContentType("text/html;charset=utf-8");
		PrintWriter prw=response.getWriter();
		prw.print("<script> alert('수정이 완료되었습니다.');</script>");
		prw.print("<script> location.href='sosickboard';</script>");
		prw.close();
		return "redirect:/sosickdetail?snum=" + snum;
	}
	
	@RequestMapping(value = "/sosicksearchsave", method = RequestMethod.POST)
	public String sosicksearchsave(HttpServletRequest request, Model mo, PageDTO dto, @RequestParam("svalue") String svalue, @RequestParam("sosickkey") String sosickkey, HttpServletResponse response) throws IOException {
		String nowPage=request.getParameter("nowPage");
		String cntPerPage=request.getParameter("cntPerPage");
		BoardService bs=sqlsession.getMapper(BoardService.class);
		
		if(nowPage==null && cntPerPage == null) {
			nowPage="1";
			cntPerPage="10";
		}
		else if(nowPage==null) {
			nowPage="1";
		}
		else if(cntPerPage==null) {
			cntPerPage="10";
		} 
	    if (svalue == null || svalue.trim().equals("")) {
	        response.setContentType("text/html;charset=utf-8");
	        PrintWriter prw = response.getWriter();
			prw.print("<script> alert('검색어를 입력해주세요.');</script>");
			prw.print("<script> location.href='sosickboard';</script>");
	        prw.flush();
	        prw.close();
	        return null;
		}
		else {
			svalue="%"+svalue+"%";
			if(sosickkey.equals("stitle")) {
				int totalst=bs.totalst(svalue);
				dto=new PageDTO(totalst,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
				mo.addAttribute("paging",dto);
				mo.addAttribute("list", bs.pagest(dto, svalue));
			}
			else if(sosickkey.equals("scontents")) {
				int totalsc=bs.totalsc(svalue);
				dto=new PageDTO(totalsc,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
				mo.addAttribute("paging",dto);
				mo.addAttribute("list", bs.pagesc(dto, svalue));
			}
			else {
				int totalsn=bs.totalsn(svalue);
				dto=new PageDTO(totalsn,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
				mo.addAttribute("paging",dto);
				mo.addAttribute("list", bs.pagesn(dto, svalue));
			}
			return "sosicksearchview";
		}
	}

	@RequestMapping(value = "/eventinput", method = RequestMethod.GET)
	public String eventinput() {
		return "eventinput";
	}
	
	@RequestMapping(value = "/eventsave", method = RequestMethod.POST)
	public String eventsave(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String id=mul.getParameter("id");
		String nickname=mul.getParameter("nickname");
		String etitle=mul.getParameter("etitle");
		String econtents=mul.getParameter("econtents");
		String estate=mul.getParameter("estate");
		
		MultipartFile mf1=mul.getFile("eimagem");
		String eimagemfn=mf1.getOriginalFilename();
		mf1.transferTo(new File(savepath+"//"+eimagemfn));
		
		MultipartFile mf2=mul.getFile("eimaged");
		String eimagedfn=mf2.getOriginalFilename();
		mf2.transferTo(new File(savepath+"//"+eimagedfn));
		
		BoardService bs=sqlsession.getMapper(BoardService.class);
		bs.insertevent(id, nickname, etitle, econtents, eimagemfn, eimagedfn, estate);
		return "redirect:/eventboard";
	}
	
	@RequestMapping(value = "/eventboard", method = RequestMethod.GET)
	public String eventboard(Model mo, PageDTO dto, HttpServletRequest request) {
		String nowPage=request.getParameter("nowPage");
		String cntPerPage=request.getParameter("cntPerPage");
		BoardService bs=sqlsession.getMapper(BoardService.class);
		int totalev=bs.totalev();
		if(nowPage==null && cntPerPage == null) {
			nowPage="1";
			cntPerPage="6";
		}
		else if(nowPage==null) {
			nowPage="1";
		}
		else if(cntPerPage==null) {
			cntPerPage="6";
		} 
		dto=new PageDTO(totalev,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		mo.addAttribute("paging",dto);
		mo.addAttribute("list", bs.pageev(dto));
		return "eventboard";
	}
	
	@RequestMapping(value = "/eventdetail", method = RequestMethod.GET)
	public String eventdetail(Model mo, HttpServletRequest request) {
		int evnum=Integer.parseInt(request.getParameter("evnum"));
		BoardService bs=sqlsession.getMapper(BoardService.class);
		bs.eventcount(evnum);
		EventDTO list=bs.eventdetail(evnum);
		mo.addAttribute("list",list);
		return "eventout";
	}
	
	@RequestMapping(value = "/eventdelete", method = RequestMethod.GET)
	public String eventdelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int evnum=Integer.parseInt(request.getParameter("evnum"));
		BoardService bs=sqlsession.getMapper(BoardService.class);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter prw=response.getWriter();
		prw.print("<script> alert('해당 글을 삭제하였습니다.');</script>");
		prw.print("<script> location.href='eventboard';</script>");
		prw.close();
		bs.eventdelete(evnum);
		return "redirect:/eventboard";
	}
	
	@RequestMapping(value = "/eventupdateview", method = RequestMethod.GET)
	public String eventupdateview(HttpServletRequest request, Model mo) {
		int evnum=Integer.parseInt(request.getParameter("evnum"));
		BoardService bs=sqlsession.getMapper(BoardService.class);
		EventDTO list=bs.eventupdateview(evnum);
		mo.addAttribute("list", list);
		return "eventupdateview";
	}
	
	@RequestMapping(value = "/eventupdate", method = RequestMethod.POST)
	public String eventupdate(HttpServletResponse response, MultipartHttpServletRequest mul) throws IOException {
		int evnum=Integer.parseInt(mul.getParameter("evnum"));
		String id=mul.getParameter("id");
		String nickname=mul.getParameter("nickname");
		String etitle=mul.getParameter("etitle");
		String econtents=mul.getParameter("econtents");
		String estate=mul.getParameter("estate");
		
		MultipartFile mf1=mul.getFile("eimagem");
		String eimagemfn=mf1.getOriginalFilename();
		mf1.transferTo(new File(savepath+"//"+eimagemfn));
		
		MultipartFile mf2=mul.getFile("eimaged");
		String eimagedfn=mf2.getOriginalFilename();
		mf2.transferTo(new File(savepath+"//"+eimagedfn));
		
		BoardService bs=sqlsession.getMapper(BoardService.class);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter prw=response.getWriter();
		prw.print("<script> alert('수정이 완료되었습니다.');</script>");
		prw.print("<script> location.href='eventboard';</script>");
		prw.close();
		bs.updateevent(id, nickname, etitle, econtents, eimagemfn, eimagedfn, estate, evnum);
		return "redirect:/eventdetail?evnum=" + evnum;
	}
	
	@RequestMapping(value = "/eventsearchsave", method = RequestMethod.POST)
	public String eventsearchsave(HttpServletRequest request, Model mo, PageDTO dto, @RequestParam("svalue") String svalue, @RequestParam("eventkey") String eventkey, HttpServletResponse response) throws IOException {
		String nowPage=request.getParameter("nowPage");
		String cntPerPage=request.getParameter("cntPerPage");
		BoardService bs=sqlsession.getMapper(BoardService.class);
		
		if(nowPage==null && cntPerPage == null) {
			nowPage="1";
			cntPerPage="6";
		}
		else if(nowPage==null) {
			nowPage="1";
		}
		else if(cntPerPage==null) {
			cntPerPage="6";
		} 
	    if (svalue == null || svalue.trim().equals("")) {
	        response.setContentType("text/html;charset=utf-8");
	        PrintWriter prw = response.getWriter();
			prw.print("<script> alert('검색어를 입력해주세요.');</script>");
			prw.print("<script> location.href='eventboard';</script>");
	        prw.flush();
	        prw.close();
	        return null;
		}
		else {
			svalue="%"+svalue+"%";
			if(eventkey.equals("etitle")) {
				int totalet=bs.totalet(svalue);
				dto=new PageDTO(totalet,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
				mo.addAttribute("paging",dto);
				mo.addAttribute("list", bs.pageet(dto, svalue));
			}
			else {
				int totalec=bs.totalec(svalue);
				dto=new PageDTO(totalec,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
				mo.addAttribute("paging",dto);
				mo.addAttribute("list", bs.pageec(dto, svalue));
			}
			return "eventsearchview";
		}
	}	
	
	@RequestMapping(value = "/eventing", method = RequestMethod.GET)
	public String eventing(HttpServletRequest request, Model mo, PageDTO dto, HttpServletResponse response) throws IOException {
		String nowPage=request.getParameter("nowPage");
		String cntPerPage=request.getParameter("cntPerPage");
		BoardService bs=sqlsession.getMapper(BoardService.class);
		if(nowPage==null && cntPerPage == null) {
			nowPage="1";
			cntPerPage="6";
		}
		else if(nowPage==null) {
			nowPage="1";
		}
		else if(cntPerPage==null) {
			cntPerPage="6";
		} 
		String estate="진행중";
		int totalevsi=bs.totalevsi(estate);
		dto=new PageDTO(totalevsi,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		mo.addAttribute("paging",dto);
		mo.addAttribute("list", bs.pageevsi(dto, estate));
		return "eventsearchview";
	}
	
	@RequestMapping(value = "/eventend", method = RequestMethod.GET)
	public String eventend(HttpServletRequest request, Model mo, PageDTO dto, HttpServletResponse response) throws IOException {
		String nowPage=request.getParameter("nowPage");
		String cntPerPage=request.getParameter("cntPerPage");
		BoardService bs=sqlsession.getMapper(BoardService.class);
		if(nowPage==null && cntPerPage == null) {
			nowPage="1";
			cntPerPage="6";
		}
		else if(nowPage==null) {
			nowPage="1";
		}
		else if(cntPerPage==null) {
			cntPerPage="6";
		} 
		String estate="종료";
		int totalevse=bs.totalevse(estate);
		dto=new PageDTO(totalevse,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		mo.addAttribute("paging",dto);
		mo.addAttribute("list", bs.pageevse(dto, estate));
		return "eventsearchview";
	}

}
