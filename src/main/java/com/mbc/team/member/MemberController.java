package com.mbc.team.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/mypage")
	public String mypage() {
		
		return "mypage";
	}
	
	@RequestMapping(value = "/memberinput")
	public String member() {
		
		return "memberinput";
	}

	@RequestMapping(value = "/membersave")
	public String member0(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw1 = request.getParameter("pw");
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String pw = passwordEncoder.encode(pw1);
		String nickname = request.getParameter("nickname");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone = "010-" + phone1 + "-" + phone2;
		String fdomain = request.getParameter("fdomain");
		String bdomain = request.getParameter("bdomain");
		String email = fdomain + "@" + bdomain;
		String mainaddress = request.getParameter("mainaddress");
		String detailaddress = request.getParameter("detailaddress");
		String extraaddress = request.getParameter("extraaddress");
		String address = mainaddress + detailaddress + extraaddress;
		MemberService ms = sqlSession.getMapper(MemberService.class);
		ms.memberinput(id, nickname, pw, name, birth, phone, address, email);

		return "redirect:/main";
	}
	
	@RequestMapping(value = "/memberout")
	public String memberout(Model mo) {
		MemberService ms = sqlSession.getMapper(MemberService.class);
		ArrayList<MemberDTO>list=ms.memberout();
		mo.addAttribute("list",list);
		
		return "memberout";
	}
	
	@ResponseBody
	@RequestMapping(value = "/memberdelete")
	public String memberdelete(Model mo,HttpServletRequest request) {
		
		String id=request.getParameter("id");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		 try {
	           ms.memberdelete(id);
	            return "success";
 
	        } 
		 catch (Exception e) {
			 
	            return "fail";  
	        }
	    }
	
	@ResponseBody
	@RequestMapping(value = "/idcheck1")
	public String member2(HttpServletRequest request) {
		String id = request.getParameter("id");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		int count = ms.idcheck(id);
		if (count == 0) {
			return "ok";
		} else {
			return "no";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/nicknamecheck1")
	public String member3(HttpServletRequest request) {
		String nickname = request.getParameter("nickname");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		int count = ms.nicknamecheck(nickname);
		if (count == 0) {
			return "ok";
		} else {
			return "no";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/emailcheck1")
	public String member4(HttpServletRequest request) {
		String email = request.getParameter("email");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		int count = ms.emailcheck(email);
		if (count == 0) {
			return "ok";
		} else {
			return "no";
		}
	}

	@RequestMapping(value = "/phonecheck1", method = RequestMethod.POST)
	@ResponseBody
	public String phoneCheck(HttpServletRequest request) {
		String phone=request.getParameter("phone");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		int count = ms.phonecheck(phone);
		if (count == 0) {
			return "ok"; 
		} else {
			return "notok"; 
		}
	}
}
