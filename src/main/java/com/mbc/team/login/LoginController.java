package com.mbc.team.login;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mbc.team.member.MemberService;



@Controller
public class LoginController {
	
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	@RequestMapping(value = "/login")
	public String login()
	{
		
		return "login";
	}
	
	
	@RequestMapping(value = "/logout")
	public String login0(HttpServletRequest request)
	{
		HttpSession hs=request.getSession();
		hs.setAttribute("loginstate", false);
		hs.setAttribute("adminloginstate", false);
		hs.removeAttribute("dto3");
		return "redirect:/main";
	}
	
	
	@RequestMapping(value = "/logincheck")
	public String login1(HttpServletRequest request, Model mo,HttpServletResponse response) throws IOException
	{
		String id=request.getParameter("id");
		String inputpw=request.getParameter("pw");
		LoginService ls=sqlSession.getMapper(LoginService.class);
		LoginDTO dto3=ls.logincheck(id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pww=response.getWriter();
		
		if(dto3!=null)
		{
			PasswordEncoder pe=new BCryptPasswordEncoder();
			if(pe.matches(inputpw, dto3.getPw())) {
				HttpSession hs=request.getSession();
				hs.setAttribute("loginstate", true);
				hs.setAttribute("dto3", dto3);
				pww.print("<script> alert(' 로그인에 성공하였습니다...!');</script>");
			    pww.print("<script> location.href='main';</script>");
			    pww.flush();
				return "redirect:/main";
			}
			else
			{
				pww.print("<script> alert('비밀번호를 확인해주세요'); history.go(-1);</script>");
				pww.flush();
				return null;
			}
		}
		else if(id.equals("admin")&&inputpw.equals("admin1234"))
		{
			HttpSession hs=request.getSession();
			hs.setAttribute("adminloginstate", true);
			pww.print("<script> alert('관리자 로그인에 성공하였습니다...!');</script>");
	         pww.print("<script> location.href='main';</script>");
	         pww.close();
	         return "redirect:/main";
		}
		else
		{	
			pww.print("<script> alert('존재하지 않는 사용자입니다.');history.go(-1);</script>");
			pww.flush();
			return "null";
		}
	}
	
	@RequestMapping(value = "/myinfo")
	public String login2(HttpServletRequest request, Model mo, HttpServletResponse response) throws IOException
	{
		HttpSession hs=request.getSession();
		boolean yy=(Boolean)hs.getAttribute("loginstate");
		LoginDTO dto3=(LoginDTO)hs.getAttribute("dto3");
		if(yy)
		{	
			LoginService ls=sqlSession.getMapper(LoginService.class);
			LoginDTO dto1=ls.myinfo(dto3.getId());
			mo.addAttribute("dto1",dto1);
			
			return "myinfo";
		}
		else
		{	response.setContentType("text/html;charset=utf-8");
			PrintWriter pww=response.getWriter();
			pww.print("<script> alert('로그인 후 이용해주새요')</script>");
			pww.print("<script> location.href='main'</script>");
			pww.close();
			return "redirect:/main";
		}
		
	}///////////////
	
	@RequestMapping(value = "/update")
	public String login3(HttpServletRequest request,Model mo)
	{
		String id=request.getParameter("id");
		LoginService ls=sqlSession.getMapper(LoginService.class);
		LoginDTO updateview=ls.updateview(id);
		mo.addAttribute("updateview",updateview);
		
		return "updateview";
	}
	
	@ResponseBody
	@RequestMapping(value = "/nicknamecheck2")
	public String login5(HttpServletRequest request)
	{
		String nickname=request.getParameter("nickname");
		MemberService ms=sqlSession.getMapper(MemberService.class);
		int count=ms.nicknamecheck1(nickname);
		if(count==0)
		{
			return "ok";
		}
		else
		{
			return "no";
		}
	}
	
	@RequestMapping(value = "/memberupdate2")
	public String login6(HttpServletRequest request)
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
		String address=request.getParameter("address");
		LoginService ls=sqlSession.getMapper(LoginService.class);
		ls.memberupdate2(nickname,pw,name,gender,birth,phone,address,email,id);
		
		return "redirect:main";
	}
	
	@RequestMapping(value = "/delete")
	public String login7(HttpServletRequest request,Model mo)
	{
		String id=request.getParameter("id");
		LoginService ls=sqlSession.getMapper(LoginService.class);
		LoginDTO deleteview=ls.deleteview(id);
		mo.addAttribute("deleteview",deleteview);
		
		return "deleteview";
	}
	
	@RequestMapping(value = "/delete2")
	public String login8(HttpServletRequest request,Model mo)
	{
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		LoginService ls=sqlSession.getMapper(LoginService.class);
		boolean success=(boolean) ls.delete2(id);
		if(success) {
			mo.addAttribute("message","그동안 이용해 주셔서 감사합니다");
			return "thanksforusing";
		}
		else
		{
			mo.addAttribute("error","비밀번호가 일치하지 않습니다");
			return "deleteview";
		}
		
	}
	
	@RequestMapping(value = "/findmyid")
	public String login10()
	{
		
		return "findmyid";
	}
	
	@RequestMapping(value = "/findidcheck",method = RequestMethod.POST)
	public String login11(HttpServletRequest request,Model mo)
	{
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		
		LoginService ls=sqlSession.getMapper(LoginService.class);
		LoginDTO findid=ls.findid(name,email);
		mo.addAttribute("findid",findid);
		return "confirmid";
		
	}
	
	@RequestMapping(value = "/findmypw")
	public String login12()
	{
		
		return "findmypw";
	}
	
	@RequestMapping(value = "/findpwcheck",method = RequestMethod.POST)
	public String login13(HttpServletRequest request,Model mo)
	{
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		LoginService ls=sqlSession.getMapper(LoginService.class);
		LoginDTO findpw=ls.findpw(id,name,email);
		mo.addAttribute("findpw",findpw);
		
		return "confirmpw";
	}
	
	@RequestMapping(value = "/confirmpw",method = RequestMethod.POST)
	public String login14(HttpServletRequest request,Model mo)
	{	
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		LoginService ls=sqlSession.getMapper(LoginService.class);
		ls.updatepw(id,pw);
		
		
		return "redirect:/login";
	}
	
}
