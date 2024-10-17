package com.mbc.team.Like;

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

import com.mbc.team.login.LoginDTO;
import com.mbc.team.login.LoginService;

@Controller
public class LikeController {

	@Autowired
	SqlSession sqlSession;
	// 경로 수정해야합니다.
	String path = "C:\\Users\\3-16\\git\\team\\src\\main\\webapp\\image";

	// 찜하기
	@RequestMapping(value = "/like_save")
	public String like1(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession hs = request.getSession();
		Boolean loginState = (Boolean) hs.getAttribute("loginstate");
		int itemnum = Integer.parseInt(request.getParameter("itemnum"));
		LoginDTO dto3 = (LoginDTO) hs.getAttribute("dto3");
		LikeService ls2 = sqlSession.getMapper(LikeService.class);

		if (!loginState || loginState == null) {

			response.setContentType("text/html;charset=utf-8");
			PrintWriter pww = response.getWriter();
			pww.print("<script> alert('로그인 후 이용해주새요')</script>");
			pww.print("<script> location.href='login'</script>");
			pww.close();
			return "redirect:/login";
		}
		ls2.like_insert(itemnum, dto3.getId());

		return "redirect:/main";

	}

	// 찜 목록
	@RequestMapping(value = "/like_product")
	public String like2(HttpServletRequest request, Model mo) {
		HttpSession hs = request.getSession();
		LoginDTO dto3 = (LoginDTO) hs.getAttribute("dto3");

		LikeService ls = sqlSession.getMapper(LikeService.class);
		ArrayList<LikeDTO> list = ls.like_product(dto3.getId());
		mo.addAttribute("list", list);

		return "like_product_out";

	}

	// 찜 상품 삭제
	@RequestMapping(value = "/like_items_delete")
	public String like3(HttpServletRequest request, Model mo) {
		int likenum = Integer.parseInt(request.getParameter("likenum"));
		
		LikeService ls = sqlSession.getMapper(LikeService.class);
		
		ls.like_items_delete(likenum);
		
		return "like_product_out";
	}

}
