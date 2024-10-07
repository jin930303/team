package com.mbc.team.FAQ;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

//<!-- 상세페이지 하단 문의 답변내용 기재 -->
@Controller
public class FAQController {

	@Autowired
	SqlSession sqlSession;
	// 경로 수정해야합니다.
	String path = "C:\\mbc\\Somall\\Somall\\teamproject\\src\\main\\webapp\\image";

	// faqinput으로 이동
	@RequestMapping(value = "/faqin")
	public String faq() {

		return "faqinput";
	}

	// faqinput내용 저장
	@RequestMapping(value = "/faqsave", method = RequestMethod.POST)
	public String faq1(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String tab = mul.getParameter("tab");
		String title = mul.getParameter("title");
		String nickname = mul.getParameter("nickname");
		String fcontents = mul.getParameter("fcontents");
		MultipartFile fimg1 = mul.getFile("fimage1");
		MultipartFile fimg2 = mul.getFile("fimage2");
		MultipartFile fimg3 = mul.getFile("fimage3");

		String fname1 = fimg1.getOriginalFilename();
		String fname2 = fimg2.getOriginalFilename();
		String fname3 = fimg3.getOriginalFilename();
		FAQService fs = sqlSession.getMapper(FAQService.class);
		fimg1.transferTo(new File(path + "\\" + fname1));
		fimg2.transferTo(new File(path + "\\" + fname2));
		fimg3.transferTo(new File(path + "\\" + fname3));

		fs.faqinsert(tab, title, fcontents, nickname, fname1, fname2, fname3);

		return "redirect:/";
	}

	// 저장내용 목록
	@RequestMapping(value = "/faqout")
	public String faq2(HttpServletRequest request, PageDTO dto, Model mo) {
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");

		FAQService fs = sqlSession.getMapper(FAQService.class);
		ArrayList<FAQDTO> list = fs.faqboard();
		mo.addAttribute("list", list);

		int total = fs.total();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "15";
		}
		dto = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		mo.addAttribute("paging", dto);
		mo.addAttribute("list", fs.page(dto));

		return "faqoutput";
	}

	// 문의글 게시판 문의 답변 작성
	@RequestMapping(value = "/faqreply", method = RequestMethod.POST)
	public String faq3(HttpServletRequest request, Model mo) {
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		FAQService fs = sqlSession.getMapper(FAQService.class);
		ArrayList<FAQDTO> list = fs.faqreply(cnum);
		mo.addAttribute("faqlist", list);

		return "faqreplyview";
	}

	// 문의글 답변 내용 저장
	@RequestMapping(value = "/faqreplysave", method = RequestMethod.POST)
	public String faq4(HttpServletRequest request) throws IllegalStateException, IOException {
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

	// 저장내용 목록 상세페이지(+하단에 문의 답변내용 미완)
	@RequestMapping(value = "/faqdetail")
	public String faq5(Model mo, HttpServletRequest request) {
		int cnum = Integer.parseInt(request.getParameter("cnum"));

		FAQService fs = sqlSession.getMapper(FAQService.class);
		ArrayList<FAQDTO> list = fs.faqdetail(cnum);
		mo.addAttribute("list", list);

		ArrayList<FAQDTO> replylist = fs.faqreplydetail(cnum);
		mo.addAttribute("replylist", replylist);

		return "faqDtailview";
	}

	// 문의글 수정창
	@RequestMapping(value = "/faqupdate")
	public String faq6(HttpServletRequest request, Model mo) throws IllegalStateException, IOException {
		int cnum = Integer.parseInt(request.getParameter("cnum"));

		FAQService fs = sqlSession.getMapper(FAQService.class);

		FAQDTO dto = fs.faqupdate(cnum);
		mo.addAttribute("dto", dto);

		return "faqUpdateview";
	}

	// 문의글 수정완료(+수정 완료됐다는 알림 필요)
	@RequestMapping(value = "/faqupdate2", method = RequestMethod.POST)
	public String faq7(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		int cnum = Integer.parseInt(mul.getParameter("cnum"));
		String tab = mul.getParameter("tab");
		String title = mul.getParameter("title");
		String nickname = mul.getParameter("nickname");
		String fcontents = mul.getParameter("fcontents");
		MultipartFile fimg1 = mul.getFile("fimage1");
		MultipartFile fimg2 = mul.getFile("fimage2");
		MultipartFile fimg3 = mul.getFile("fimage3");

		String fname1 = fimg1.getOriginalFilename();
		String fname2 = fimg2.getOriginalFilename();
		String fname3 = fimg3.getOriginalFilename();
		FAQService fs = sqlSession.getMapper(FAQService.class);
		fimg1.transferTo(new File(path + "\\" + fname1));
		fimg2.transferTo(new File(path + "\\" + fname2));
		fimg3.transferTo(new File(path + "\\" + fname3));

		fs.faqupdate2(cnum, tab, title, fcontents, nickname, fname1, fname2, fname3);

		return "redirect:/faqout";
	}

	// 문의글 삭제
	@RequestMapping(value = "/faqdelete")
	public String faq8(HttpServletRequest request) {
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		FAQService fs = sqlSession.getMapper(FAQService.class);
		fs.faqdelete(cnum);

		return "redirect:/faqout";
	}

	// 문의글 목록 검색
	@RequestMapping(value = "/faqsearch", method = RequestMethod.POST)
	public String faq9(HttpServletRequest request, Model mo) throws IllegalStateException, IOException {

		String faqkey = request.getParameter("faqkey");
		String faqvalue = request.getParameter("faqvalue");

		FAQService fs = sqlSession.getMapper(FAQService.class);

		ArrayList<FAQDTO> list;
		if (faqkey.equals("title")) {
			list = fs.faqtitlesearch(faqvalue);
		} else {
			list = fs.faqnicknamesearch(faqvalue);
		}
		mo.addAttribute("list", list);

		return "faqoutput";
	}

	// 고객센터 홈
	@RequestMapping(value = "/faq_community")
	public String faq10() {

		return "faq_main";
	}

	// FAQ-자주 묻는 질문 작성
	@RequestMapping(value = "/FAQ_in")
	public String faq11() {

		return "faq_admin_input";
	}

	// FAQ-자주 묻는 질문 내용 저장
	@RequestMapping(value = "/faq_admin_save", method = RequestMethod.POST)
	public String faq12(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String tab = mul.getParameter("tab");
		String title = mul.getParameter("title");
		String nickname = mul.getParameter("nickname");
		String fcontents = mul.getParameter("fcontents");
		MultipartFile fimg1 = mul.getFile("fimage1");
		MultipartFile fimg2 = mul.getFile("fimage2");
		MultipartFile fimg3 = mul.getFile("fimage3");

		String fname1 = fimg1.getOriginalFilename();
		String fname2 = fimg2.getOriginalFilename();
		String fname3 = fimg3.getOriginalFilename();
		FAQadminService fs2 = sqlSession.getMapper(FAQadminService.class);
		fimg1.transferTo(new File(path + "\\" + fname1));
		fimg2.transferTo(new File(path + "\\" + fname2));
		fimg3.transferTo(new File(path + "\\" + fname3));

		fs2.faqinsert(tab, title, fcontents, nickname, fname1, fname2, fname3);

		return "redirect:/";
	}

	// FAQ-자주 묻는 질문 내용 게시판
	@RequestMapping(value = "/faq")
	public String faq13(HttpServletRequest request, PageDTO dto, Model mo) {
		String tab = request.getParameter("tab");
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");

		FAQadminService fs2 = sqlSession.getMapper(FAQadminService.class);
		ArrayList<FAQadminDTO> list = fs2.faqboard(tab);
		mo.addAttribute("faq_admin_board", list);

		int total = fs2.total();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "15";
		}
		dto = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		mo.addAttribute("paging", dto);
		mo.addAttribute("list", fs2.page(dto));

		return "faq_questions";
	}

	// FAQ-자주 묻는 질문 상세페이지
	@RequestMapping(value = "/faq_quetions_detail")
	public String faq14(Model mo, HttpServletRequest request) {
		int cnum = Integer.parseInt(request.getParameter("cnum"));

		FAQadminService fs2 = sqlSession.getMapper(FAQadminService.class);
		FAQadminDTO faq = fs2.faq_quetions_detail(cnum);
		mo.addAttribute("faq", faq);

		ArrayList<FAQadminDTO> faqreply = fs2.faq_questions_reply(cnum);
		mo.addAttribute("faqreply", faqreply);

		return "faq_questions_Dtailview";
	}

	// FAQ-자주 묻는 질문 수정페이지
	@RequestMapping(value = "/faq_admin_update")
	public String faq15(Model mo, HttpServletRequest request) {
		int cnum = Integer.parseInt(request.getParameter("cnum"));

		FAQadminService fs2 = sqlSession.getMapper(FAQadminService.class);
		FAQadminDTO dto = fs2.faq_admin_update(cnum);
		mo.addAttribute("dto", dto);

		return "faq_questions_Updateview";
	}

	// FAQ-자주 묻는 질문 수정완료
	@RequestMapping(value = "/faq_admin_update2", method = RequestMethod.POST)
	public String faq16(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		int cnum = Integer.parseInt(mul.getParameter("cnum"));
		String tab = mul.getParameter("tab");
		String title = mul.getParameter("title");
		String nickname = mul.getParameter("nickname");
		String fcontents = mul.getParameter("fcontents");
		MultipartFile fimg1 = mul.getFile("fimage1");
		MultipartFile fimg2 = mul.getFile("fimage2");
		MultipartFile fimg3 = mul.getFile("fimage3");

		String fname1 = fimg1.getOriginalFilename();
		String fname2 = fimg2.getOriginalFilename();
		String fname3 = fimg3.getOriginalFilename();
		FAQadminService fs2 = sqlSession.getMapper(FAQadminService.class);
		fimg1.transferTo(new File(path + "\\" + fname1));
		fimg2.transferTo(new File(path + "\\" + fname2));
		fimg3.transferTo(new File(path + "\\" + fname3));

		fs2.faq_admin_update2(cnum, tab, title, fcontents, nickname, fname1, fname2, fname3);

		return "redirect:/faq";
	}

	// FAQ-자주 묻는 질문 삭제
	@RequestMapping(value = "/faq_admin_delete")
	public String faq17(Model mo, HttpServletRequest request) {
		int cnum = Integer.parseInt(request.getParameter("cnum"));

		FAQadminService fs2 = sqlSession.getMapper(FAQadminService.class);
		fs2.faq_admin_delete(cnum);

		return "redirect:/faq";
	}

	// 문의글 게시판 문의 답변 작성
	@RequestMapping(value = "/faq_questions_reply_save", method = RequestMethod.POST)
	public String faq18(HttpServletRequest request, Model mo) {

		int cnum = Integer.parseInt(request.getParameter("cnum"));
		int groups = Integer.parseInt(request.getParameter("groups"));
		int step = Integer.parseInt(request.getParameter("step"));
		int indent = Integer.parseInt(request.getParameter("indent"));
		String fcontents = request.getParameter("fcontents");
		String tab = request.getParameter("tab");

		FAQadminService fs2 = sqlSession.getMapper(FAQadminService.class);
		fs2.faq_questions_stepup(groups, step);
		step++;
		indent++;

		fs2.faq_questions_faqreplysave(cnum, groups, step, indent, fcontents, tab);

		return "redirect:/faq_quetions_detail?cnum=" + cnum;
	}

}
