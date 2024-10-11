package com.mbc.team.FAQ;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class FAQController {

	/*
	 * 검색 키워드 [작성, 저장, 게시판, 정렬, 상세페이지, Update, Delete, 검색, 댓글]
	 */
	
	@Autowired
	SqlSession sqlSession;
	// 경로 수정해야합니다.
	String path = "C:\\Users\\3-16\\git\\team\\src\\main\\webapp\\image";

	// 1:1 문의글 작성
	@RequestMapping(value = "/faqin")
	public String faq0member(HttpServletResponse response, HttpServletRequest request, Model mo) throws IOException {
		
		HttpSession session = request.getSession();
		Boolean FAQinput = (Boolean) session.getAttribute("loginstate");
		
		if (FAQinput == null || !FAQinput) {
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pww=response.getWriter();
			pww.print("<script> alert('로그인 후 이용해주새요')</script>");
			pww.print("<script> location.href='login'</script>");
			pww.close();
			return "redirect:/login";
		}
		else 
		{
			return "faqinput";
		}
	}
	
	//	1:1 문의글 저장(이미지 갯수별 저장 가능)
	@RequestMapping(value = "/faqsave", method = RequestMethod.POST)
	public String faq1member(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
	    String tab = mul.getParameter("tab");
	    String title = mul.getParameter("title");
	    String nickname = mul.getParameter("nickname");
	    String fcontents = mul.getParameter("fcontents");

	    // 파일 처리 (파일이 없을 경우 빈 문자열로 처리)
	    MultipartFile fimg1 = mul.getFile("fimage1");
	    MultipartFile fimg2 = mul.getFile("fimage2");
	    MultipartFile fimg3 = mul.getFile("fimage3");

	    String fname1 = (fimg1 != null && !fimg1.isEmpty()) ? fimg1.getOriginalFilename() : "";
	    String fname2 = (fimg2 != null && !fimg2.isEmpty()) ? fimg2.getOriginalFilename() : "";
	    String fname3 = (fimg3 != null && !fimg3.isEmpty()) ? fimg3.getOriginalFilename() : "";

	    // 파일 저장 (파일이 있을 경우에만 저장)
	    if (!fname1.isEmpty()) {
	        fimg1.transferTo(new File(path + "\\" + fname1));
	    }
	    if (!fname2.isEmpty()) {
	        fimg2.transferTo(new File(path + "\\" + fname2));
	    }
	    if (!fname3.isEmpty()) {
	        fimg3.transferTo(new File(path + "\\" + fname3));
	    }

	    // FAQ 데이터 저장
	    FAQService fs = sqlSession.getMapper(FAQService.class);
	    fs.faqinsert(tab, title, fcontents, nickname, fname1, fname2, fname3);

	    return "redirect:/";
	}

	// 1:1 문의글 게시판
	@RequestMapping(value = "/faqout")
	public String faq2(HttpServletRequest request, PageDTO dto, Model mo) {
		String tab = request.getParameter("tab");
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");

		FAQService fs = sqlSession.getMapper(FAQService.class);
		ArrayList<FAQDTO> list = fs.faqboard();
		mo.addAttribute("list", list);

		int total = fs.total(tab);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		dto = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		mo.addAttribute("paging", dto);
		mo.addAttribute("list", fs.page(dto));

		return "faqoutput";
	}

	// 1:1 문의글 정렬기준(페이징 필요)
	@RequestMapping(value = "/category")
	public String faq3(HttpServletRequest request, PageDTO dto, Model mo) {
		String faq_category = request.getParameter("faq_category");

		FAQService fs = sqlSession.getMapper(FAQService.class);
		ArrayList<FAQDTO> list = null;
		if (faq_category.equals("faqcnt")) {
			list = fs.category1();
		} else {
			list = fs.category2();
		}
		mo.addAttribute("list", list);
		/*
		 * String nowPage = request.getParameter("nowPage"); String cntPerPage =
		 * request.getParameter("cntPerPage");
		 * 
		 * int total = fs.total(); if (nowPage == null && cntPerPage == null) { nowPage
		 * = "1"; cntPerPage = "10"; } else if (nowPage == null) { nowPage = "1"; } else
		 * if (cntPerPage == null) { cntPerPage = "10"; } dto = new PageDTO(total,
		 * Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		 * mo.addAttribute("paging", dto); mo.addAttribute("list", fs.page(dto));
		 */
		return "faqoutput";
	}

	// 1:1 문의글 답변 작성
	@RequestMapping(value = "/faqreply", method = RequestMethod.POST)
	public String faq4admin(HttpServletResponse response, HttpServletRequest request, Model mo) throws IOException {
		
		HttpSession hs = request.getSession();
		boolean login = (Boolean)hs.getAttribute("adminloginstate");
		
		if(login)
		{
			int cnum = Integer.parseInt(request.getParameter("cnum"));
			FAQService fs = sqlSession.getMapper(FAQService.class);
			ArrayList<FAQDTO> list = fs.faqreply(cnum);
			mo.addAttribute("faqlist", list);
	
			return "faqreplyview";
		}
			return "redirect:/main";
		
	}

	// 1:1 문의글 답변 저장
	@RequestMapping(value = "/faqreplysave", method = RequestMethod.POST)
	public String faq5admin(HttpServletRequest request) throws IllegalStateException, IOException {
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		String tab = request.getParameter("tab");
		String title = request.getParameter("title");
		String fcontents = request.getParameter("fcontents");
		String nickname = request.getParameter("nickname");
		int groups = Integer.parseInt(request.getParameter("groups"));
		int step = Integer.parseInt(request.getParameter("step"));
		int indent = Integer.parseInt(request.getParameter("indent"));

		FAQService fs = sqlSession.getMapper(FAQService.class);
		fs.faqstepup(groups, step);
		step++;
		indent++;
		;
		fs.faqreplysave(cnum, tab, title, fcontents, nickname, groups, step, indent);

		return "redirect:/faqdetail?cnum=" + cnum;
	}

	// 1:1 문의글 상세페이지
	@RequestMapping(value = "/faqdetail")
	public String faq6(Model mo, HttpServletRequest request) {
		int cnum = Integer.parseInt(request.getParameter("cnum"));

		FAQService fs = sqlSession.getMapper(FAQService.class);

		ArrayList<FAQDTO> list = fs.faqdetail(cnum);
		mo.addAttribute("list", list);
		fs.faqcount(cnum);

		ArrayList<FAQDTO> replylist = fs.faqreplydetail(cnum);
		mo.addAttribute("replylist", replylist);

		return "faqDtailview";
	}

	// 1:1 문의글 답변 Updateview
	@RequestMapping(value = "/faq_reply_update1")
	public String faq7admin(HttpServletRequest request, Model mo) throws IllegalStateException, IOException {
		int cnum = Integer.parseInt(request.getParameter("cnum"));

		FAQService fs = sqlSession.getMapper(FAQService.class);

		FAQDTO dto = fs.faq_reply_update1(cnum);
		mo.addAttribute("dto", dto);

		return "faq_reply_updateview";
	}

	// 1:1 문의글 답변 Update clear
	@RequestMapping(value = "/faq_reply_update2", method = RequestMethod.POST)
	public String faq8admin(HttpServletResponse response, MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		int cnum = Integer.parseInt(mul.getParameter("cnum"));
		String tab = mul.getParameter("tab");
	    String title = mul.getParameter("title");
	    String nickname = mul.getParameter("nickname");
	    String fcontents = mul.getParameter("fcontents");

	    // 파일 처리 (파일이 없을 경우 빈 문자열로 처리)
	    MultipartFile fimg1 = mul.getFile("fimage1");
	    MultipartFile fimg2 = mul.getFile("fimage2");
	    MultipartFile fimg3 = mul.getFile("fimage3");

	    String fname1 = (fimg1 != null && !fimg1.isEmpty()) ? fimg1.getOriginalFilename() : "";
	    String fname2 = (fimg2 != null && !fimg2.isEmpty()) ? fimg2.getOriginalFilename() : "";
	    String fname3 = (fimg3 != null && !fimg3.isEmpty()) ? fimg3.getOriginalFilename() : "";

	    // 파일 저장 (파일이 있을 경우에만 저장)
	    if (!fname1.isEmpty()) {
	        fimg1.transferTo(new File(path + "\\" + fname1));
	    }
	    if (!fname2.isEmpty()) {
	        fimg2.transferTo(new File(path + "\\" + fname2));
	    }
	    if (!fname3.isEmpty()) {
	        fimg3.transferTo(new File(path + "\\" + fname3));
	    }
	    
	    // 수정 완료 알림
		response.setContentType("text/html;charset=utf-8");
		PrintWriter prw=response.getWriter();
		prw.print("<script> alert('수정이 완료되었습니다.');</script>");
		prw.print("<script> location.href='faqout';</script>");
		prw.close();
		
		FAQService fs = sqlSession.getMapper(FAQService.class);
		fs.faq_reply_update2(cnum, tab, title, fcontents, nickname, fname1, fname2, fname3);

		return "redirect:/faqout";
	}

	// 1:1 문의글 답변 Delete clear
	@RequestMapping(value = "/faq_reply_delete")
	public String faq9admin(HttpServletRequest request) {
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		FAQService fs = sqlSession.getMapper(FAQService.class);
		fs.faq_reply_delete(cnum);

		return "redirect:/faqout";
	}

	// 1:1 문의글 Updateview
	@RequestMapping(value = "/faqupdate")
	public String faq10member(HttpServletRequest request, Model mo) throws IllegalStateException, IOException {
		int cnum = Integer.parseInt(request.getParameter("cnum"));

		FAQService fs = sqlSession.getMapper(FAQService.class);

		FAQDTO dto = fs.faqupdate(cnum);
		mo.addAttribute("dto", dto);

		return "faqUpdateview";
	}

	// 1:1 문의글 Update clear
	@RequestMapping(value = "/faqupdate2", method = RequestMethod.POST)
	public String faq11member(HttpServletResponse response, MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		int cnum = Integer.parseInt(mul.getParameter("cnum"));
		String tab = mul.getParameter("tab");
	    String title = mul.getParameter("title");
	    String nickname = mul.getParameter("nickname");
	    String fcontents = mul.getParameter("fcontents");

	    // 파일 처리 (파일이 없을 경우 빈 문자열로 처리)
	    MultipartFile fimg1 = mul.getFile("fimage1");
	    MultipartFile fimg2 = mul.getFile("fimage2");
	    MultipartFile fimg3 = mul.getFile("fimage3");

	    String fname1 = (fimg1 != null && !fimg1.isEmpty()) ? fimg1.getOriginalFilename() : "";
	    String fname2 = (fimg2 != null && !fimg2.isEmpty()) ? fimg2.getOriginalFilename() : "";
	    String fname3 = (fimg3 != null && !fimg3.isEmpty()) ? fimg3.getOriginalFilename() : "";

	    // 파일 저장 (파일이 있을 경우에만 저장)
	    if (!fname1.isEmpty()) {
	        fimg1.transferTo(new File(path + "\\" + fname1));
	    }
	    if (!fname2.isEmpty()) {
	        fimg2.transferTo(new File(path + "\\" + fname2));
	    }
	    if (!fname3.isEmpty()) {
	        fimg3.transferTo(new File(path + "\\" + fname3));
	    }
	    
	    // 수정 완료 알림
		response.setContentType("text/html;charset=utf-8");
		PrintWriter prw=response.getWriter();
		prw.print("<script> alert('수정이 완료되었습니다.');</script>");
		prw.print("<script> location.href='faqout';</script>");
		prw.close();

		FAQService fs = sqlSession.getMapper(FAQService.class);
		fs.faqupdate2(cnum, tab, title, fcontents, nickname, fname1, fname2, fname3);

		return "redirect:/faqout";
	}

	// 1:1 문의글 Delete clear
	@RequestMapping(value = "/faqdelete")
	public String faq12member(HttpServletRequest request) {
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		FAQService fs = sqlSession.getMapper(FAQService.class);
		fs.faqdelete(cnum);

		return "redirect:/faqout";
	}

	// 1:1 문의글 게시판 검색
	@RequestMapping(value = "/faqsearch", method = RequestMethod.POST)
	public String faq13(HttpServletRequest request, Model mo) throws IllegalStateException, IOException {

		String faqkey1 = request.getParameter("faqkey1"); // 기간 (1일, 1주일 등)
		String faqkey2 = request.getParameter("faqkey2"); // 검색 조건 (제목, 내용, 작성자)
		String faqvalue = request.getParameter("faqvalue"); // 검색어

		FAQService fs = sqlSession.getMapper(FAQService.class);
		ArrayList<FAQDTO> list = new ArrayList<>();

		// 둘 다 입력된 경우
		if (faqkey1 != null && !faqkey1.isEmpty() && faqkey2 != null && !faqkey2.isEmpty()) {
		    int days = Integer.parseInt(faqkey1); // faqkey1의 값은 1, 7, 30, 90
		    if (faqkey2.equals("title")) {
		        list = fs.faqTitleSearchWithDate(faqvalue, days);
		    } else if (faqkey2.equals("fcontents")) {
		        list = fs.faqContentsSearchWithDate(faqvalue, days);
		    } else {
		        list = fs.faqNicknameSearchWithDate(faqvalue, days);
		    }
		}
		// faqkey1만 입력된 경우 (기간 필터만)
		else if (faqkey1 != null && !faqkey1.isEmpty()) {
		    int days = Integer.parseInt(faqkey1);
		    list = fs.faqSearchByDateOnly(days);
		}
		// faqkey2만 입력된 경우 (검색 조건만)
		else if (faqkey2 != null && !faqkey2.isEmpty()) {
		    if (faqkey2.equals("title")) {
		        list = fs.faqTitleSearch(faqvalue);
		    } else if (faqkey2.equals("fcontents")) {
		        list = fs.faqContentsSearch(faqvalue);
		    } else {
		        list = fs.faqNicknameSearch(faqvalue);
		    }
		}
	    
		mo.addAttribute("list", list);

		return "faqoutput";
	}
	
	// 고객센터 홈
	@RequestMapping(value = "/faq_community")
	public String faq14(Model mo) {

		FAQService fs = sqlSession.getMapper(FAQService.class);
		ArrayList<FAQDTO> bestfaq = fs.best_faq10();
		mo.addAttribute("bestfaq", bestfaq);

		return "faq_main";
	}

	// 고객센터 홈 검색
	@RequestMapping(value = "/faq_main_serch", method = RequestMethod.POST)
	public String faq15(HttpServletRequest request, Model mo) throws IllegalStateException, IOException {

		String faqkey1 = request.getParameter("faqkey1"); // 기간 (1일, 1주일 등)
		String faqkey2 = request.getParameter("faqkey2"); // 검색 조건 (제목, 내용, 작성자)
		String faqvalue = request.getParameter("faqvalue"); // 검색어

		FAQadminService fs2 = sqlSession.getMapper(FAQadminService.class);
		ArrayList<FAQadminDTO> list = new ArrayList<>();

		// 둘 다 입력된 경우
		if (faqkey1 != null && !faqkey1.isEmpty() && faqkey2 != null && !faqkey2.isEmpty()) {
		    int days = Integer.parseInt(faqkey1); // faqkey1의 값은 1, 7, 30, 90
		    if (faqkey2.equals("title")) {
		        list = fs2.faqTitleSearchWithDate(faqvalue, days);
		    } else if (faqkey2.equals("fcontents")) {
		        list = fs2.faqContentsSearchWithDate(faqvalue, days);
		    } else {
		        list = fs2.faqNicknameSearchWithDate(faqvalue, days);
		    }
		}
		// faqkey1만 입력된 경우 (기간 필터만)
		else if (faqkey1 != null && !faqkey1.isEmpty()) {
		    int days = Integer.parseInt(faqkey1);
		    list = fs2.faqSearchByDateOnly(days);
		}
		// faqkey2만 입력된 경우 (검색 조건만)
		else if (faqkey2 != null && !faqkey2.isEmpty()) {
		    if (faqkey2.equals("title")) {
		        list = fs2.faqTitleSearch(faqvalue);
		    } else if (faqkey2.equals("fcontents")) {
		        list = fs2.faqContentsSearch(faqvalue);
		    } else {
		        list = fs2.faqNicknameSearch(faqvalue);
		    }
		}
		mo.addAttribute("bestfaq", list);

		return "faq_main";
	}

	// FAQ-자주 묻는 질문 작성
	@RequestMapping(value = "/FAQ_in")
	public String faq16admin(HttpServletResponse response, HttpServletRequest request, Model mo) throws IOException {
		HttpSession session = request.getSession();
		Boolean FAQinput = (Boolean) session.getAttribute("adminloginstate");

		// 관리자 로그인이 되어 있지 않으면 메인 페이지로 리다이렉트
		if (FAQinput == null || !FAQinput) {
			
			return "redirect:/faq_community";
		}
		return "faq_admin_input";
	}

	// FAQ-자주 묻는 질문 저장
	@RequestMapping(value = "/faq_admin_save", method = RequestMethod.POST)
	public String faq17admin(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {

		String tab = mul.getParameter("tab");
	    String title = mul.getParameter("title");
	    String nickname = mul.getParameter("nickname");
	    String fcontents = mul.getParameter("fcontents");

	    // 파일 처리 (파일이 없을 경우 ""를 통해서 빈 문자열로 처리)
	    MultipartFile fimg1 = mul.getFile("fimage1");
	    MultipartFile fimg2 = mul.getFile("fimage2");
	    MultipartFile fimg3 = mul.getFile("fimage3");

	    String fname1 = (fimg1 != null && !fimg1.isEmpty()) ? fimg1.getOriginalFilename() : "";
	    String fname2 = (fimg2 != null && !fimg2.isEmpty()) ? fimg2.getOriginalFilename() : "";
	    String fname3 = (fimg3 != null && !fimg3.isEmpty()) ? fimg3.getOriginalFilename() : "";

	    // 파일 저장 (파일이 있을 경우에만 저장)
	    if (!fname1.isEmpty()) {
	        fimg1.transferTo(new File(path + "\\" + fname1));
	    }
	    if (!fname2.isEmpty()) {
	        fimg2.transferTo(new File(path + "\\" + fname2));
	    }
	    if (!fname3.isEmpty()) {
	        fimg3.transferTo(new File(path + "\\" + fname3));
	    }

	    // FAQ 데이터 저장
	    FAQService fs = sqlSession.getMapper(FAQService.class);
	    fs.faqinsert(tab, title, fcontents, nickname, fname1, fname2, fname3);

	    return "redirect:/faq_community";
	}

	// FAQ-자주 묻는 질문 게시판
	@RequestMapping(value = "/faq")
	public String faq18(HttpServletRequest request, PageDTO dto, Model mo) {
		String tab = request.getParameter("tab");
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");

		FAQadminService fs2 = sqlSession.getMapper(FAQadminService.class);
		ArrayList<FAQadminDTO> list = fs2.faqboard(tab);
		mo.addAttribute("faq_admin_board", list);

		int total = fs2.total(tab);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		dto = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		mo.addAttribute("paging", dto);
		mo.addAttribute("faq_admin_board", fs2.page(dto));

		return "faq_questions";
	}

	// FAQ-자주 묻는 질문 검색
	@RequestMapping(value = "/faq_questions_search", method = RequestMethod.POST)
	public String faq18_1(HttpServletRequest request, Model mo) throws IllegalStateException, IOException {

		String faqkey1 = request.getParameter("faqkey1"); // 기간 (1일, 1주일 등)
		String faqkey2 = request.getParameter("faqkey2"); // 검색 조건 (제목, 내용, 작성자)
		String faqvalue = request.getParameter("faqvalue"); // 검색어

		FAQadminService fs2 = sqlSession.getMapper(FAQadminService.class);
		ArrayList<FAQadminDTO> list = new ArrayList<>();

		// 둘 다 입력된 경우
		if (faqkey1 != null && !faqkey1.isEmpty() && faqkey2 != null && !faqkey2.isEmpty()) {
		    int days = Integer.parseInt(faqkey1); // faqkey1의 값은 1, 7, 30, 90
		    if (faqkey2.equals("title")) {
		        list = fs2.faqTitleSearchWithDate(faqvalue, days);
		    } else if (faqkey2.equals("fcontents")) {
		        list = fs2.faqContentsSearchWithDate(faqvalue, days);
		    } else {
		        list = fs2.faqNicknameSearchWithDate(faqvalue, days);
		    }
		}
		// faqkey1만 입력된 경우 (기간 필터만)
		else if (faqkey1 != null && !faqkey1.isEmpty()) {
		    int days = Integer.parseInt(faqkey1);
		    list = fs2.faqSearchByDateOnly(days);
		}
		// faqkey2만 입력된 경우 (검색 조건만)
		else if (faqkey2 != null && !faqkey2.isEmpty()) {
		    if (faqkey2.equals("title")) {
		        list = fs2.faqTitleSearch(faqvalue);
		    } else if (faqkey2.equals("fcontents")) {
		        list = fs2.faqContentsSearch(faqvalue);
		    } else {
		        list = fs2.faqNicknameSearch(faqvalue);
		    }
		}
		    
		mo.addAttribute("faq_admin_board", list);

		return "faq_questions";
		}
		
	// FAQ-자주 묻는 질문 상세페이지
	@RequestMapping(value = "/faq_questions_detail")
	public String faq19(Model mo, HttpServletRequest request) {
		int cnum = Integer.parseInt(request.getParameter("cnum"));

		FAQadminService fs2 = sqlSession.getMapper(FAQadminService.class);

		FAQadminDTO faq = fs2.faq_questions_detail(cnum);
		mo.addAttribute("faq", faq);
		fs2.faqcount2(cnum);

		ArrayList<FAQadminDTO> faqreply = fs2.faq_questions_reply(cnum);
		mo.addAttribute("faqreply", faqreply);

		return "faq_questions_Detailview";
	}

	// FAQ-자주 묻는 질문 Updateview
	@RequestMapping(value = "/faq_admin_update")
	public String faq20admin(Model mo, HttpServletRequest request) {
		int cnum = Integer.parseInt(request.getParameter("cnum"));

		FAQadminService fs2 = sqlSession.getMapper(FAQadminService.class);
		FAQadminDTO dto = fs2.faq_admin_update(cnum);
		mo.addAttribute("dto", dto);

		return "faq_questions_Updateview";
	}

	// FAQ-자주 묻는 질문 Update clear
	@RequestMapping(value = "/faq_admin_update2", method = RequestMethod.POST)
	public String faq21admin(HttpServletResponse response, MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		int cnum = Integer.parseInt(mul.getParameter("cnum"));
		String tab = mul.getParameter("tab");
	    String title = mul.getParameter("title");
	    String nickname = mul.getParameter("nickname");
	    String fcontents = mul.getParameter("fcontents");

	    // 파일 처리 (파일이 없을 경우 빈 문자열로 처리)
	    MultipartFile fimg1 = mul.getFile("fimage1");
	    MultipartFile fimg2 = mul.getFile("fimage2");
	    MultipartFile fimg3 = mul.getFile("fimage3");

	    String fname1 = (fimg1 != null && !fimg1.isEmpty()) ? fimg1.getOriginalFilename() : "";
	    String fname2 = (fimg2 != null && !fimg2.isEmpty()) ? fimg2.getOriginalFilename() : "";
	    String fname3 = (fimg3 != null && !fimg3.isEmpty()) ? fimg3.getOriginalFilename() : "";

	    // 파일 저장 (파일이 있을 경우에만 저장)
	    if (!fname1.isEmpty()) {
	        fimg1.transferTo(new File(path + "\\" + fname1));
	    }
	    if (!fname2.isEmpty()) {
	        fimg2.transferTo(new File(path + "\\" + fname2));
	    }
	    if (!fname3.isEmpty()) {
	        fimg3.transferTo(new File(path + "\\" + fname3));
	    }
	    
	    // 수정 완료 알림
		response.setContentType("text/html;charset=utf-8");
		PrintWriter prw=response.getWriter();
		prw.print("<script> alert('수정이 완료되었습니다.');</script>");
		prw.print("<script> location.href='faqout';</script>");
		prw.close();
		
		FAQadminService fs2 = sqlSession.getMapper(FAQadminService.class);
		fs2.faq_admin_update2(cnum, tab, title, fcontents, nickname, fname1, fname2, fname3);

		return "redirect:/faq";
	}

	// FAQ-자주 묻는 질문 Delete clear
	@RequestMapping(value = "/faq_admin_delete")
	public String faq22admin(Model mo, HttpServletRequest request) {
		int cnum = Integer.parseInt(request.getParameter("cnum"));

		FAQadminService fs2 = sqlSession.getMapper(FAQadminService.class);
		fs2.faq_admin_delete(cnum);

		return "redirect:/faq";
	}

	// FAQ-자주 묻는 질문 댓글
	@RequestMapping(value = "/faq_questions_reply_save", method = RequestMethod.POST)
	public String faq23member(HttpServletResponse response, HttpServletRequest request, Model mo) throws IOException {
		
		HttpSession session = request.getSession();
		Boolean FAQinput = (Boolean) session.getAttribute("loginstate");
		
		if (FAQinput == null || !FAQinput) {
		
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pww=response.getWriter();
			pww.print("<script> alert('로그인 후 이용해주새요')</script>");
			pww.print("<script> location.href='login'</script>");
			pww.close();
			return "";			
			
		}
		else
		{
			int cnum = Integer.parseInt(request.getParameter("cnum"));
			int groups = Integer.parseInt(request.getParameter("groups"));
			int step = Integer.parseInt(request.getParameter("step"));
			int indent = Integer.parseInt(request.getParameter("indent"));
			String fcontents = request.getParameter("fcontents");
			String nickname = request.getParameter("nickname");
			String tab = request.getParameter("tab");
			FAQadminService fs2 = sqlSession.getMapper(FAQadminService.class);
			fs2.faq_questions_stepup(groups, step);
			step++;
			indent++;
	
			fs2.faq_questions_faqreplysave(cnum, groups, step, indent, fcontents, tab, nickname);
	
			return "redirect:/faq_questions_detail?cnum=" + cnum;

		}
	}

}
