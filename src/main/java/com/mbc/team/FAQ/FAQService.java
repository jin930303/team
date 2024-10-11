package com.mbc.team.FAQ;

import java.util.ArrayList;

public interface FAQService {
//1. 저장(문의글 작성)
	void faqinsert(String tab, String title, String fcontents, String nickname, String fname1, String fname2,
			String fname3);

//2. 게시판
	ArrayList<FAQDTO> faqboard();

//3. 문의글 상세
	ArrayList<FAQDTO> faqdetail(int cnum);

//4. 문의글 수정창
	FAQDTO faqupdate(int cnum);

//5. 문의글 수정완료
	void faqupdate2(int cnum, String tab, String title, String fcontents, String nickname, String fname1, String fname2,
			String fname3);

//6. 문의글 삭제
	void faqdelete(int cnum);

//7. 페이지	
	public int total(String tab);

	public ArrayList<FAQDTO> page(PageDTO dto);

//8. 문의 답변
	ArrayList<FAQDTO> faqreply(int cnum);

//9-1. 스탭업
	void faqstepup(int groups, int step);

//9-2. 문의 답변 내용 저장	
	void faqreplysave(int cnum, String tab, String title, String fcontents, String nickname, int groups, int step,
			int indent);

//9-3. 문의 답변 출력
	ArrayList<FAQDTO> faqreplydetail(int cnum);

//10. 키값 검색
	// title(제목)
	ArrayList<FAQDTO> faqTitleSearch(String faqvalue);

	// fcontents(내용)
	ArrayList<FAQDTO> faqContentsSearch(String faqvalue);
	
	// nickname(작성자)
	ArrayList<FAQDTO> faqNicknameSearch(String faqvalue);
	
	// fdate(기간)
	ArrayList<FAQDTO> faqSearchByDateOnly(int days);
	
	// 기간+벨류
	ArrayList<FAQDTO> faqTitleSearchWithDate(String faqvalue, int days);
	
	ArrayList<FAQDTO> faqContentsSearchWithDate(String faqvalue, int days);
	
	ArrayList<FAQDTO> faqNicknameSearchWithDate(String faqvalue, int days);

//11. 조회수
	void faqcount(int cnum);

//12. 조회수많은순 정렬
	ArrayList<FAQDTO> category1();

//13. 최신순 정렬
	ArrayList<FAQDTO> category2();

//14. 고객센터 메인 홈
	ArrayList<FAQDTO> best_faq10();
	
//15. 상세페이지 문의 답변 수정창
	FAQDTO faq_reply_update1(int cnum);

//16. 상세페이지 문의 답변 수정완료
	void faq_reply_update2(int cnum, String tab, String title, String fcontents, String nickname, String fname1,
			String fname2, String fname3);

//17. 상세페이지 문의 답변 삭제
	void faq_reply_delete(int cnum);

//18. 고객센터 홈 검색	
	ArrayList<FAQDTO> faq_main_titlesearch(String faq_search_value);

	ArrayList<FAQDTO> faq_main_nicknamesearch(String faq_search_value);
//






	



}
