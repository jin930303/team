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
	public int total();

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
	ArrayList<FAQDTO> faqtitlesearch(String faqvalue);

	// nickname(작성자)
	ArrayList<FAQDTO> faqnicknamesearch(String faqvalue);

}
