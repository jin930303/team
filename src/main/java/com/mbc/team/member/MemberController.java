package com.mbc.team.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	SqlSession sqlSession;
	MemberService ms;
	
	@RequestMapping(value = "/mypage")
	public String mypage() {
		
		return "mypage";
	}
	
	@RequestMapping(value = "/memberinput")
	public String member() {
		
		return "memberinput";
	}

	@RequestMapping(value = "/membersave")
	public String member0(@ModelAttribute MemberDTO memberDTO,@RequestParam("pw") String rawPw, 
			@RequestParam("phone0") String phone0,@RequestParam("phone1") String phone1,
			@RequestParam("phone2") String phone2,@RequestParam("fdomain") String fdomain,
			@RequestParam("bdomain") String bdomain,@RequestParam("mainaddress") String mainaddress,
			@RequestParam("detailaddress") String detailaddress,@RequestParam("extraaddress") String extraaddress
			) {
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String pw = passwordEncoder.encode(rawPw);
		String phone = phone0 +"-"+ phone1 + "-" + phone2;
		String email = fdomain + "@" + bdomain;
		String address = mainaddress + detailaddress + extraaddress;
		memberDTO.setPw(pw);
		memberDTO.setPhone(phone);
		memberDTO.setEmail(email);
		memberDTO.setAddress(address);
		ms = sqlSession.getMapper(MemberService.class);
		ms.memberinput(memberDTO);

		return "redirect:/main";
	}
	
	@RequestMapping(value = "/memberout")
	public String memberout(Model mo) {
		ms = sqlSession.getMapper(MemberService.class);
		ArrayList<MemberDTO>list=ms.memberout();
		mo.addAttribute("list",list);
		
		return "memberout";
	}
	
	@ResponseBody
	@RequestMapping(value = "/memberdelete")
	public String memberdelete(Model mo,HttpServletRequest request) {
		
		String id=request.getParameter("id");
		ms = sqlSession.getMapper(MemberService.class);
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
		ms = sqlSession.getMapper(MemberService.class);
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
		ms = sqlSession.getMapper(MemberService.class);
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
		ms = sqlSession.getMapper(MemberService.class);
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
		ms = sqlSession.getMapper(MemberService.class);
		int count = ms.phonecheck(phone);
		if (count == 0) {
			return "ok"; 
		} else {
			return "notok"; 
		}
	}
}
