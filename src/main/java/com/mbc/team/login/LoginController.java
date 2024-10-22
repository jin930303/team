package com.mbc.team.login;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

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
		
		 if (dto3 != null) {
		        PasswordEncoder pe = new BCryptPasswordEncoder();
		        if (pe.matches(inputpw, dto3.getPw())) {
		            HttpSession hs = request.getSession();
		            
		            // 관리자 권한 확인
		            if ("001".equals(dto3.getAuth())) {
		                hs.setAttribute("adminloginstate", true);
		                pww.print("<script> alert('관리자 로그인에 성공하였습니다...!');</script>");
		                pww.print("<script> location.href='main';</script>");
		                pww.flush();
		                return "redirect:/main";
		            } else {
		                // 일반 사용자 로그인 처리
		                hs.setAttribute("loginstate", true);
		                hs.setAttribute("dto3", dto3);
		                pww.print("<script> alert('로그인에 성공하였습니다...!');</script>");
		                pww.print("<script> location.href='main';</script>");
		                pww.flush();
		                return "redirect:/main";
		            }
		        } else {
		            pww.print("<script> alert('비밀번호를 확인해주세요'); history.go(-1);</script>");
		            pww.flush();
		            return null;
		        }
		    } else {
		        pww.print("<script> alert('존재하지 않는 사용자입니다.'); history.go(-1);</script>");
		        pww.flush();
		        return null;
		    }
	}
	
	@RequestMapping(value = "/myinfo")
	public String myInfo(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
	    HttpSession session = request.getSession();
	    Boolean loginState = (Boolean) session.getAttribute("loginstate");

	    if (loginState != null && loginState) {
	        // 로그인 상태인 경우
	        LoginDTO dto3 = (LoginDTO) session.getAttribute("dto3");
	        LoginService ls = sqlSession.getMapper(LoginService.class);
	        LoginDTO dto1 = ls.myinfo(dto3.getId());
	        model.addAttribute("dto1", dto1);
	        return "myinfo";
	    } else {
	        // 로그인 상태가 아닌 경우
	        response.setContentType("text/html;charset=utf-8");
	        PrintWriter pww = response.getWriter();
	        pww.print("<script> alert('로그인 후 이용해주세요.');</script>");
	        pww.print("<script> location.href='/login';</script>");
	        pww.flush();
	        return null;
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
		String birth=request.getParameter("birth");
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		String phone="010-"+phone1+"-"+phone2;
		String fdomain=request.getParameter("fdomain");
		String bdomain=request.getParameter("bdomain");
		String email=fdomain+"@"+bdomain;
		String address=request.getParameter("address");
		LoginService ls=sqlSession.getMapper(LoginService.class);
		ls.memberupdate2(nickname,pw,name,birth,phone,address,email,id);
		
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
	//아이디 찾기
	@RequestMapping(value = "/findmyid")
	public String login10()
	{
		
		return "findmyid";
	}
	
	@ResponseBody
	@RequestMapping(value = "/findidcheck",method = RequestMethod.POST)
	public Map<String, Object> login11(HttpServletRequest request)
	{
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		
		LoginService ls=sqlSession.getMapper(LoginService.class);
		LoginDTO findid=ls.findid(name,email);
		
		Map<String, Object> response= new HashMap<>();
		if(findid!=null)
		{
			response.put("id", findid.getId());
			response.put("message", "아이디를 찾았습니다.");
		}
		else
		{
			response.put("id", null);
			response.put("message","아이디를 찾을 수 없습니다." );
		}
		
		return response;
		
	}
	
	
	
	///////  login-비밀번호 찾기
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
	
	@RequestMapping(value = "/updatepw",method = RequestMethod.POST)
	public String login14(HttpServletRequest request,Model mo)
	{	
		String id=request.getParameter("id");
		String pw1=request.getParameter("pw");
		PasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
		String pw=passwordEncoder.encode(pw1);
		LoginService ls=sqlSession.getMapper(LoginService.class);
		ls.updatepw(id,pw);
		return "redirect:/login";
	}
	
	// 카카오 로그인 처리
    @RequestMapping(value = "/kakaoLoginCheck", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> kakaoLoginCheck(HttpServletRequest request, @RequestParam String kakaoname) {
        Map<String, Object> responseMap = new HashMap<>();
        try {
            HttpSession session = request.getSession();
            session.setAttribute("loginstate", true);  // 로그인 상태 설정
            session.setAttribute("kakaoname", kakaoname); // 카카오 닉네임 저장
            responseMap.put("redirect", "main"); // 성공 후 리다이렉트할 페이지 URL 반환
        } catch (Exception e) {
            e.printStackTrace();
            responseMap.put("error", "카카오 로그인 처리 중 오류가 발생했습니다: " + e.getMessage());
        }
        return responseMap;
    }
    
    private static final String CLIENT_ID = "PtxqAuJgt0ECukbGfDgR";
    private static final String CLIENT_SECRET = "v1p2zPAItY";
    private static final String REDIRECT_URI = "http://localhost:8091/team/main";
    
   
    //네이버 로그인 매핑
    @RequestMapping("/naver")
    public String naverCallback(@RequestParam String code, @RequestParam String state, HttpServletRequest request, Model model) {
        String accessTokenUrl = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
                + "&client_id=" + CLIENT_ID
                + "&client_secret=" + CLIENT_SECRET
                + "&code=" + code
                + "&state=" + state;

        String accessToken = getAccessTokenFromNaver(accessTokenUrl);

        if (accessToken != null) {
            Map<String, Object> userInfo = getUserInfoFromNaver(accessToken);

            HttpSession session = request.getSession();
            session.setAttribute("loginstate", true);  // 로그인 상태 설정
            session.setAttribute("naverUser", userInfo); // 네이버 사용자 정보 저장

            model.addAttribute("userInfo", userInfo);
            return "redirect:/main";  // 로그인 성공 후 메인 페이지로 리다이렉트
        } else {
            model.addAttribute("error", "네이버 로그인 처리 중 오류가 발생했습니다.");
            return "login";
        }
    }

    // Access Token 요청 메서드
    private String getAccessTokenFromNaver(String accessTokenUrl) {
        // 여기서 HttpClient를 사용하여 네이버 API를 호출하고 Access Token을 받아오는 로직을 작성합니다.
        // 받아온 Access Token을 반환합니다.
        return "access_token_value"; // 예시 값
    }

    // 사용자 정보 요청 메서드
    private Map<String, Object> getUserInfoFromNaver(String accessToken) {
        // Access Token을 이용해 네이버 사용자 정보를 요청하는 로직을 작성합니다.
        // 사용자 정보를 JSON으로 받아서 파싱한 후, 필요한 데이터를 Map으로 반환합니다.
        return new HashMap<>(); // 예시 반환값
    }
    
    @RequestMapping("/team")
    public String naverLoginCallback(@RequestParam String code, @RequestParam String state, Model model,HttpServletRequest request) {

        String clientId = "PtxqAuJgt0ECukbGfDgR"; // 네이버 개발자 센터에서 발급한 Client ID
        String clientSecret = "v1p2zPAItY"; // 네이버 개발자 센터에서 발급한 Client Secret
        String redirectUri = "http://localhost:8092/team/main"; // Redirect URI

        // 액세스 토큰 요청을 위한 URL
        String tokenUrl = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
                + "&client_id=" + clientId
                + "&client_secret=" + clientSecret
                + "&code=" + code
                + "&state=" + state
                + "&redirect_uri=" + redirectUri;

        // RestTemplate 사용하여 액세스 토큰 요청
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/x-www-form-urlencoded");

        HttpEntity<String> entity = new HttpEntity<>(headers);
        ResponseEntity<Map> response = restTemplate.exchange(tokenUrl, HttpMethod.POST, entity, Map.class);

        // 액세스 토큰 추출
        String accessToken = (String) response.getBody().get("access_token");

        if (accessToken != null) {
            // 액세스 토큰을 사용해 사용자 정보 요청
            String userInfoUrl = "https://openapi.naver.com/v1/nid/me";
            headers.set("Authorization", "Bearer " + accessToken);
            HttpEntity<String> userInfoEntity = new HttpEntity<>(headers);
            ResponseEntity<Map> userInfoResponse = restTemplate.exchange(userInfoUrl, HttpMethod.GET, userInfoEntity, Map.class);

            // 사용자 정보 처리 (예시로 이름을 가져온다)
            Map<String, Object> userInfo = userInfoResponse.getBody();
            String userName = (String) ((Map) userInfo.get("response")).get("name");

            // 세션에 사용자 정보 저장
            HttpSession session = request.getSession();
            session.setAttribute("loginstate", true);
            session.setAttribute("naverUser", userInfo);  // 사용자 정보 저장
            session.setAttribute("userName", userName);  // 이름 저장

            model.addAttribute("userName", userName);  // 화면에 사용자 이름을 보여주기 위해
            return "redirect:/main"; // 로그인 성공 후 메인 페이지로 리다이렉트
        } else {
            model.addAttribute("error", "네이버 로그인 처리 중 오류가 발생했습니다.");
            return "login"; // 오류 발생 시 로그인 페이지로 돌아감
        }
}
}

