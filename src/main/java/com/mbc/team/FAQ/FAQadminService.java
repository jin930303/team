package com.mbc.team.FAQ;

import java.util.ArrayList;

public interface FAQadminService {
//1. FAQ-자주묻는질문 저장(문의글 작성)
	void faqinsert(String tab, String title, String fcontents, String nickname, String fname1, String fname2,
			String fname3);

//2. FAQ-자주묻는질문 게시판
	ArrayList<FAQadminDTO> faqboard(String tab);

//3. FAQ-자주묻는질문 페이지	
	public int total();

	public ArrayList<FAQadminDTO> page(PageDTO dto);

//4. FAQ-자주묻는질문 상세페이지
	FAQadminDTO faq_quetions_detail(int cnum);

//5. FAQ-자주묻는질문 상세페이지 수정(관리자)
	FAQadminDTO faq_admin_update(int cnum);

//5-1. 수정 완료(관리자)
	void faq_admin_update2(int cnum, String tab, String title, String fcontents, String nickname, String fname1,
			String fname2, String fname3);

//6. FAQ-자주묻는질문 삭제
	void faq_admin_delete(int cnum);

//7. FAQ-자주묻는질문 댓글 달기
	void faq_questions_stepup(int groups, int step);

	void faq_questions_faqreplysave(int cnum, int groups, int step, int indent, String fcontents, String tab);

	ArrayList<FAQadminDTO> faq_questions_reply(int cnum);

//8. FAQ-자주묻는질문 조회수
	void faqcount2(int cnum);

}
