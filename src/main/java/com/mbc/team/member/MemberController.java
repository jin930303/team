package com.mbc.team.member;



import javax.servlet.http.HttpServletRequest;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	@RequestMapping(value = "/memberinput")
	public String member()
	{
		return "memberinput";
	}
	
	@RequestMapping(value = "/membersave")
	public String member0(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		String pw1=request.getParameter("pw");
		PasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
		String pw=passwordEncoder.encode(pw1);
		String nickname=request.getParameter("nickname");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		String birth=request.getParameter("birth");
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		String phone="010-"+phone1+"-"+phone2;
		String fdomain=request.getParameter("fdomain");
		String bdomain=request.getParameter("bdomain");
		String email=fdomain+"@"+bdomain;
		String mainaddress=request.getParameter("mainaddress");
		String detailaddress=request.getParameter("detailaddress");
		String extraaddress=request.getParameter("extraaddress");
		String address=mainaddress+detailaddress+extraaddress;
		MemberService ms=sqlSession.getMapper(MemberService.class);
		ms.memberinput(id,nickname,pw,name,gender,birth,phone,address,email);
		
		
		return "membercongratulations";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idcheck1")
	public String member2(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		MemberService ms=sqlSession.getMapper(MemberService.class);
		int count=ms.idcheck(id);
		if(count==0)
		{
			return "ok";
		}
		else
		{
			return "no";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/nicknamecheck1")
	public String member3(HttpServletRequest request)
	{
		String nickname=request.getParameter("nickname");
		MemberService ms=sqlSession.getMapper(MemberService.class);
		int count=ms.nicknamecheck(nickname);
		if(count==0)
		{
			return "ok";
		}
		else
		{
			return "no";
		}
	}
	
}
